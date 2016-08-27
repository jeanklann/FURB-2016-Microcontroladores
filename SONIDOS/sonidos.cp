#line 1 "C:/Users/aluno/Desktop/SONIDOS/sonidos.c"
void main() {
 char byte_recebido = 0;
 UART1_Init(19200);
 Sound_Init(&PORTC, 2);

 while(1)
 {

 if(UART1_Data_Ready())
 {
 byte_recebido = UART1_Read();
 }
 switch(byte_recebido){
 case '1': Sound_Play(200, 25);
 break;
 case '2': Sound_Play(400, 25);
 break;
 case '3': Sound_Play(600, 25);
 break;
 case '4': Sound_Play(800, 25);
 break;
 case '5': Sound_Play(1000, 25);
 break;
 case '6': Sound_Play(1200, 25);
 break;
 case '7': Sound_Play(1400, 25);
 break;
 case '8': Sound_Play(1600, 25);
 break;
 case '9': Sound_Play(1800, 25);
 break;
 case '0': Sound_Play(2000, 25);
 break;

 }
 }
}
