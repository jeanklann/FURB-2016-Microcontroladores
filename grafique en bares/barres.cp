#line 1 "C:/Users/aluno/Desktop/grafique en bares/barres.c"
void main() {
 char ENTER_CONST[] = {13,0};
 char mensagem[31];
 char byte_str[5];
 char int_str[7];
 unsigned char byte_recebido = 0;
 unsigned int temperatura_ate_1023 = 0;
 double temperatura = 0.0;
 double temperatura_escolhida = 0.0;
 int i = 0;
 UART1_Init(19200);
 TRISD = 0;
 TRISC.F1 = 0;
 TRISC.F2 = 0;







 for( i = 0; i<7; i++)
 int_str[i] = 0;
 while(1)
 {
 temperatura_ate_1023 = ADC_Read(3);
 temperatura = (temperatura_ate_1023*(5.0/1023.0)) * 100.0;

 if(UART1_Data_Ready())
 {
 byte_recebido = UART1_Read();
 }
 if(byte_recebido == 'V')
 {
 if(PORTC.F2)
 {
 PORTC.F2 = 0;
 }
 else
 {
 PORTC.F2 = 1;
 }
 byte_recebido = 0;
 }

 if(byte_recebido == 'R')
 {
 if(PORTC.F1)
 {
 PORTC.F1 = 0;
 }
 else
 {
 PORTC.F1 = 1;
 }
 byte_recebido = 0;
 }


 Delay_ms(100);
 IntToStr(((int)temperatura), int_str);
 UART1_Write(27);
 UART1_Write_text("[2J");

 UART1_Write(27);
 UART1_Write_text("[13;10H");

 for(i = 0; i < (int)temperatura; i++)
 UART1_Write('*');
 UART1_Write_Text(int_str);
 UART1_Write('o');
 UART1_Write('C');
 UART1_Write(10);
 UART1_Write(13);
 for( i = 0; i<7; i++)
 int_str[i] = 0;




 Delay_ms(100);
 }

}
