//LCD PINOUT SETTINGS
sbit LCD_RS at RE0_bit;
sbit LCD_EN at RE1_bit;

sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;

//pin direction

sbit LCD_RS_DIRECTION at TRISE0_bit;
sbit LCD_EN_DIRECTION at TRISE1_bit;

sbit LCD_D7_DIRECTION at TRISD7_bit;
sbit LCD_D6_DIRECTION at TRISD6_bit;
sbit LCD_D5_DIRECTION at TRISD5_bit;
sbit LCD_D4_DIRECTION at TRISD4_bit;


char temperatura_str[15];


const char ampulheta[] = {31,31,14,4,4,14,31,31};
const char pacmanaberto[] = {0,15,31,28,28,31,15,0};
const char pacmanfechado[] = {0,14,31,31,31,31,14,0};


void CustomChar(){
	char i;
	LCD_Cmd(0x40);
	for(i = 0; i<=7; i++) LCD_Chr_Cp(ampulheta[i]);
	for(i = 0; i<=7; i++) LCD_Chr_Cp(pacmanaberto[i]);
	for(i = 0; i<=7; i++) LCD_Chr_Cp(pacmanfechado[i]);

	LCD_Cmd(_LCD_RETURN_HOME);
}

void VoltaProComeco(){
     Lcd_Cmd(_LCD_FIRST_ROW);
}

void main(){
	adcon1 = 0x0f;

	lcd_init();
	CustomChar();
     Lcd_Cmd(_LCD_CURSOR_OFF);
	while(1){
             VoltaProComeco();
             Delay_ms(250);
             Lcd_Chr_Cp(1);
             VoltaProComeco();
             Delay_ms(250);
             Lcd_Chr_Cp(2);
	}



}

