#line 1 "C:/Users/aluno/Desktop/Temperatura_LCD/temp_lcd.c"

sbit LCD_RS at RE0_bit;
sbit LCD_EN at RE1_bit;

sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;



sbit LCD_RS_DIRECTION at TRISE0_bit;
sbit LCD_EN_DIRECTION at TRISE1_bit;

sbit LCD_D7_DIRECTION at TRISD7_bit;
sbit LCD_D6_DIRECTION at TRISD6_bit;
sbit LCD_D5_DIRECTION at TRISD5_bit;
sbit LCD_D4_DIRECTION at TRISD4_bit;

unsigned int temperatura_ate_1023 = 0;
double temperatura = 0.0;
int temperaturaInt = 0;
char temperatura_str[15];
int i;

const char char1[] = {0,0,0,0,0,0,0,31};
const char char2[] = {0,0,0,0,0,0,31,31};
const char char3[] = {0,0,0,0,0,31,31,31};
const char char4[] = {0,0,0,0,31,31,31,31};
const char char5[] = {0,0,0,31,31,31,31,31};
const char char6[] = {0,0,31,31,31,31,31,31};
const char char7[] = {0,31,31,31,31,31,31,31};
const char char8[] = {31,31,31,31,31,31,31,31};


void CustomChar(){
 char i;
 LCD_Cmd(0x40);
 for(i = 0; i<=7; i++) LCD_Chr_Cp(char1[i]);
 for(i = 0; i<=7; i++) LCD_Chr_Cp(char2[i]);
 for(i = 0; i<=7; i++) LCD_Chr_Cp(char3[i]);
 for(i = 0; i<=7; i++) LCD_Chr_Cp(char4[i]);
 for(i = 0; i<=7; i++) LCD_Chr_Cp(char5[i]);
 for(i = 0; i<=7; i++) LCD_Chr_Cp(char6[i]);
 for(i = 0; i<=7; i++) LCD_Chr_Cp(char7[i]);
 for(i = 0; i<=7; i++) LCD_Chr_Cp(char8[i]);
 LCD_Cmd(_LCD_RETURN_HOME);
}

void VoltaProComeco(){
 Lcd_Cmd(_LCD_FIRST_ROW);
}

void main(){
 TRISC.F1 = 0;
 TRISC.F2 = 0;
 PORTC.F1 = 1;


 adcon1 = 0x0f;

 lcd_init();
 CustomChar();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 while(1){
 for(i = 0; i < 15; i++) temperatura_str[i] = 0;
 temperatura_ate_1023 = ADC_Read(3);
 temperatura = (temperatura_ate_1023*(5.0/1023.0)) * 100.0;
 temperaturaInt = (int)temperatura;
 if(temperatura<=25){
 PORTC.F1 = 1;
 PORTC.F2 = 0;
 } else if(temperatura >= 40){
 PORTC.F1 = 0;
 PORTC.F2 = 1;
 }
 Lcd_Cmd(_LCD_FIRST_ROW);
 switch(temperaturaInt){
 case 31: Lcd_Chr_Cp(0); break;
 case 32: Lcd_Chr_Cp(1); break;
 case 33: Lcd_Chr_Cp(2); break;
 case 34: Lcd_Chr_Cp(3); break;
 case 35: Lcd_Chr_Cp(4); break;
 case 36: Lcd_Chr_Cp(5); break;
 case 37: Lcd_Chr_Cp(6); break;
 case 38: Lcd_Chr_Cp(7); break;
 default:
 if(temperatura>=38) Lcd_Chr_Cp(7);
 else Lcd_Chr(1,1,' ');
 }
 Lcd_Cmd(_LCD_SECOND_ROW);
 switch(temperaturaInt){
 case 23: Lcd_Chr_Cp(0); break;
 case 24: Lcd_Chr_Cp(1); break;
 case 25: Lcd_Chr_Cp(2); break;
 case 26: Lcd_Chr_Cp(3); break;
 case 27: Lcd_Chr_Cp(4); break;
 case 28: Lcd_Chr_Cp(5); break;
 case 29: Lcd_Chr_Cp(6); break;
 case 30: Lcd_Chr_Cp(7); break;
 default:
 if(temperatura>=30) Lcd_Chr_Cp(7);
 else Lcd_Chr(2,1,' ');
 }
#line 129 "C:/Users/aluno/Desktop/Temperatura_LCD/temp_lcd.c"
 FloatToStr(temperatura, temperatura_str);
 Lcd_Out(1, 3, "Temp:");
 Lcd_Out(2, 3, temperatura_str);

 }



}
