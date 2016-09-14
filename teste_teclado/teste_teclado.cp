#line 1 "C:/Users/aluno/Desktop/teste_teclado/teste_teclado.c"

unsigned short le_teclado(){
 PORTB = 0x70;
 if(!PORTB.F0) { while(!PORTB.F0); Delay_ms(20); return('A'); }
 if(!PORTB.F1) { while(!PORTB.F1); Delay_ms(20); return('B'); }
 if(!PORTB.F2) { while(!PORTB.F2); Delay_ms(20); return('C'); }
 if(!PORTB.F3) { while(!PORTB.F3); Delay_ms(20); return('D'); }
 PORTB = 0xB0;
 if(!PORTB.F0) { while(!PORTB.F0); Delay_ms(20); return('3'); }
 if(!PORTB.F1) { while(!PORTB.F1); Delay_ms(20); return('6'); }
 if(!PORTB.F2) { while(!PORTB.F2); Delay_ms(20); return('9'); }
 if(!PORTB.F3) { while(!PORTB.F3); Delay_ms(20); return('#'); }
 PORTB = 0xD0;
 if(!PORTB.F0) { while(!PORTB.F0); Delay_ms(20); return('2'); }
 if(!PORTB.F1) { while(!PORTB.F1); Delay_ms(20); return('5'); }
 if(!PORTB.F2) { while(!PORTB.F2); Delay_ms(20); return('8'); }
 if(!PORTB.F3) { while(!PORTB.F3); Delay_ms(20); return('0'); }
 PORTB = 0xE0;
 if(!PORTB.F0) { while(!PORTB.F0); Delay_ms(20); return('1'); }
 if(!PORTB.F1) { while(!PORTB.F1); Delay_ms(20); return('4'); }
 if(!PORTB.F2) { while(!PORTB.F2); Delay_ms(20); return('7'); }
 if(!PORTB.F3) { while(!PORTB.F3); Delay_ms(20); return('*'); }
 return(255);
}
unsigned short tecla;
void main(){

 TRISB = 0B00001111;

 INTCON2.RBPU = 0;

 ADCON1 = 0x0F;
 UART1_Init(19200);
 Delay_ms(100);
 UART1_write_text("Start");
 while(1){
 tecla = le_teclado();
 while(tecla == 255){
 tecla = le_teclado();
 }
 UART1_write(tecla);
 }
}
