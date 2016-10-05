
int count = 0;
int count2 = 0;
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

const int pausa = 4;



void escreveDisplay7(int valor){

    PORTD = 0B00000000;
	PORTE = 0B00000001;
	PORTD = valoresDisplay7[(valor/1000)%10];
	delay_ms(pausa);
	
	PORTD = 0B00000000;
	PORTE = 0B00000010;
	PORTD = valoresDisplay7[(valor/100)%10];
	delay_ms(pausa);
	
	PORTD = 0B00000000;
	PORTE = 0B00000100;
	PORTD = valoresDisplay7[(valor/10)%10];
	delay_ms(pausa);
	
	PORTE = 0B00000000;
	PORTD = 0B00000000;
	PORTD = valoresDisplay7[valor%10];
	PORTA.F5 = 1;
	delay_ms(pausa);
	PORTA.F5 = 0;
	PORTD = 0B00000000;
}
void main(){
	TRISE.F0 = 0;
	TRISE.F1 = 0;
	TRISE.F2 = 0;
	TRISE.F3 = 0;
	TRISA.F5 = 0;
	TRISD = 0;


	while(1){
		count++;
		if(count % 5 == 0)
			count2 ++;
		escreveDisplay7(count2);
		//delay_ms(10);
	}

}
