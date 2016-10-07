int displayAtual = 0;
int ValorDisplay = 0;
int c1 = 0;
int c2 = 0;
const int valoresDisplay7[] = {
	0B00111111, //0
	0B00000110, //1
	0B01011011, //2
	0B01001111, //3
	0B01100110, //4
	0B01101101, //5
	0B01111101, //6
	0B00000111, //7
	0B01111111, //8
	0B01101111  //9
};

void initTimer0(){
	T0CON = 0xC4; //contador de 8 bits. toda vez que ele estourar gera a interrupcao.
	TMR0L = 0x06; //calculo maroto feito pelo Miguel
	TMR0IE_BIT = 1;
	GIE_BIT = 1;
}

void Interrupt(){ //a cada 4ms ele chama essa funcao
	TMR0IF_BIT = 0;
	TMR0L = 0x06;
	
	PORTD = 0B00000000;
	PORTE = 0B00000000;
	PORTA.F5 = 0;
	
	switch(displayAtual){
		case 0:
			PORTD = valoresDisplay7[ValorDisplay%10];
			PORTA.F5 = 1;
		break;
		case 1:
			PORTD = valoresDisplay7[(ValorDisplay/10)%10];
			PORTE = 0B00000100;
		break;
		case 2:
			PORTD = valoresDisplay7[(ValorDisplay/100)%10];
			PORTE = 0B00000010;
		break;
		case 3:
			PORTD = valoresDisplay7[(ValorDisplay/1000)%10];
			PORTE = 0B00000001;
		break;
	}
	if(++displayAtual > 3){
		displayAtual=0;
	}
	
}


void main(){
	TRISE.F0 = 0;
	TRISE.F1 = 0;
	TRISE.F2 = 0;
	TRISE.F3 = 0;
	TRISA.F5 = 0;
	TRISD = 0;
	
	initTimer0();

	while(1){
		c1++;
		
		ValorDisplay = c1;
		delay_ms(10);
	}

}