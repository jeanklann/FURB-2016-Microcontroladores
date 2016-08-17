#line 1 "C:/Users/aluno/Desktop/Projeto.c"
void main() {
 unsigned int A_D;
 TRISD = 0;
 while(1){
 A_D = ADC_Read(0);

 if(A_D <= 128){
 PORTD = 0x00;
 } else if(A_D <= 128*2){
 PORTD = 0x01;
 } else if(A_D <= 128*3){
 PORTD = 0x03;
 } else if(A_D <= 128*4){
 PORTD = 0x07;
 } else if(A_D <= 128*5){
 PORTD = 0x0F;
 } else if(A_D <= 128*6){
 PORTD = 0x1F;
 } else if(A_D <= 128*7){
 PORTD = 0x3F;
 } else if(A_D <= 128*8){
 PORTD = 0x7F;
 } else {
 PORTD = 0xFF;
 }

 }

}
