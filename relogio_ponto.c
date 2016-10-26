int displayAtual = 0;
char ValorDisplay[] = {0,0,0,0};
char valor_teclado = 255;
unsigned char txt[6]; //utilizada para conversao de binario para txt para ser impresso
short mes_atual;
short dia_atual;
short hora_atual;
short minuto_atual;
short segundo_atual;
char modo = 0; //0 = mostrando a hora; 1 = digitando valor 1; 2 = digitando valor 2; 3 = digitando valor 3; 4 = digitando valor 4;
char endereco_atual = 0;
char entrada_saida = 0;
int intTemp = 0;
int i = 0;
int j = 0;
char buffer[4];

const char valoresDisplay7[] = {
	0B00111111, //0
	0B00000110, //1
	0B01011011, //2
	0B01001111, //3
	0B01100110, //4
	0B01101101, //5
	0B01111101, //6
	0B00000111, //7
	0B01111111, //8
	0B01101111, //9
	0B01111100,	//E
	0B01101101,	//r
	0B00111111,	//o
	0B00000000, //vazio
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
			PORTD = valoresDisplay7[ValorDisplay[0]];
			PORTA.F5 = 1;
		break;
		case 1:
			PORTD = valoresDisplay7[ValorDisplay[1]];
			PORTE = 0B00000100;
		break;
		case 2:
			PORTD = valoresDisplay7[ValorDisplay[2]];
			PORTE = 0B00000010;
		break;
		case 3:
			PORTD = valoresDisplay7[ValorDisplay[3]];
			PORTE = 0B00000001;
		break;
	}
	if(++displayAtual > 3){
		displayAtual=0;
	}

}

unsigned short le_teclado(){
	PORTB = 0x70;
	if(!PORTB.F0) { while(!PORTB.F0); Delay_ms(20); return(10); }
	if(!PORTB.F1) { while(!PORTB.F1); Delay_ms(20); return(11); }
	if(!PORTB.F2) { while(!PORTB.F2); Delay_ms(20); return(255); }
	if(!PORTB.F3) { while(!PORTB.F3); Delay_ms(20); return(255); }
	PORTB = 0xB0;
	if(!PORTB.F0) { while(!PORTB.F0); Delay_ms(20); return(3); }
	if(!PORTB.F1) { while(!PORTB.F1); Delay_ms(20); return(6); }
	if(!PORTB.F2) { while(!PORTB.F2); Delay_ms(20); return(9); }
	if(!PORTB.F3) { while(!PORTB.F3); Delay_ms(20); return(255); }
	PORTB = 0xD0;
	if(!PORTB.F0) { while(!PORTB.F0); Delay_ms(20); return(2); }
	if(!PORTB.F1) { while(!PORTB.F1); Delay_ms(20); return(5); }
	if(!PORTB.F2) { while(!PORTB.F2); Delay_ms(20); return(8); }
	if(!PORTB.F3) { while(!PORTB.F3); Delay_ms(20); return(0); }
	PORTB = 0xE0;
	if(!PORTB.F0) { while(!PORTB.F0); Delay_ms(20); return(1); }
	if(!PORTB.F1) { while(!PORTB.F1); Delay_ms(20); return(4); }
	if(!PORTB.F2) { while(!PORTB.F2); Delay_ms(20); return(7); }
	if(!PORTB.F3) { while(!PORTB.F3); Delay_ms(20); return(12); }
	return(255);
}

void Escreve_MemoriaEEPROM(unsigned int endereco, unsigned char dado){
	I2C1_Start(); // issue I2C start signal
	I2C1_Wr(0xA0); // send byte via I2C (device address + W)
	I2C1_Wr(endereco); // send byte (address of EEPROM location)
	I2C1_Wr(dado); // send data (data to be written)
	I2C1_Stop();
	delay_ms(16);
}
unsigned char Le_MemoriaEEPROM(unsigned int endereco){
	unsigned char dado_lido;
	I2C1_Start(); // issue I2C start signal
	I2C1_Wr(0xA0); // send byte via I2C (device address + W)
	I2C1_Wr(endereco); // send byte (address of EEPROM location)
	I2C1_Repeated_Start(); // issue I2C signal repeated start
	I2C1_Wr(0xA1); // send byte (device address + R)
	dado_lido = I2C1_Rd(0u); // Read the data (NO acknowledge)
	I2C1_Stop();
	return(dado_lido);
}
void Escreve_Memoria(unsigned int endereco, unsigned char dado){
	I2C1_Start(); // issue I2C start signal
	I2C1_Wr(0xD0); // send byte via I2C (device address + W)
	I2C1_Wr(endereco); // send byte (address of EEPROM location)
	I2C1_Wr(dado); // send data (data to be written)
	I2C1_Stop();
	delay_ms(16);
}
unsigned char Le_Memoria(unsigned int endereco){
	unsigned char dado_lido;
	I2C1_Start(); // issue I2C start signal
	I2C1_Wr(0xD0); // send byte via I2C (device address + W)
	I2C1_Wr(endereco); // send byte (address of EEPROM location)
	I2C1_Repeated_Start(); // issue I2C signal repeated start
	I2C1_Wr(0xD1); // send byte (device address + R)
	dado_lido = I2C1_Rd(0u); // Read the data (NO acknowledge)
	I2C1_Stop();
	return(dado_lido);
}

short transform_tempo_read(short in){
	return ((in & 0xF0) / 16) * 10 + (in &	0x0F);
}
short transform_tempo_write(short in){
	return (in / 10) * 16 + (in % 10);
}



void le_hora(short *mes, short *dia, short *hora, short *minuto, short *segundo){
	*segundo = Le_Memoria(0);
	*minuto = Le_Memoria(1);
	*hora = Le_Memoria(2);
	*dia = Le_Memoria(3);
	*mes = Le_Memoria(4);
}


void acerta_hora(short hora, short minuto, short segundo){
	Escreve_Memoria(0,segundo); //11 segundos
	Escreve_Memoria(1,minuto); //11 minutos
	Escreve_Memoria(2,hora); //11 horas
}

void imprimeTodaAMemoria(){
	for(i = 0; i < 128 ; i++){
		UART1_write('E');
		UART1_write('(');
		UART1_write((i%10)+48);
		UART1_write(')');
		UART1_write(':');
		UART1_write(Le_MemoriaEEPROM(i)+48);
		UART1_write('\r');
		UART1_write('\n');
	}
}

void WriteText(char* mensagem){
	for(j = 0; mensagem[j] != '\0'; j++){
		UART1_write(mensagem[j]);
	}
}
void WriteInt(int input){
	buffer[0] = 0;
	buffer[1] = 0;
	buffer[2] = 0;
	buffer[3] = 0;
	IntToStr(input, &buffer);
	WriteText(buffer);
}

void imprimeRelatorio(){
	for(i = 0; i < endereco_atual-7 ; i += 7){
		WriteText("\r\n");
		WriteText("Codigo: ");

		WriteInt(Le_MemoriaEEPROM(i));
		WriteInt(Le_MemoriaEEPROM(i+1));
		WriteText("\r\n");

		WriteText("Tipo: ");
		WriteText(Le_MemoriaEEPROM(i+2)==0?"Entrada":"Saida");
		WriteText("\r\n");

		WriteText("Hora: ");
		WriteInt(transform_tempo_read(Le_MemoriaEEPROM(i+3)));
		WriteText("\r\n");

		WriteText("Minuto: ");
		WriteInt(transform_tempo_read(Le_MemoriaEEPROM(i+4)));
		WriteText("\r\n");

		WriteText("Dia: ");
		WriteInt(transform_tempo_read(Le_MemoriaEEPROM(i+5)));
		WriteText("\r\n");

		WriteText("Mes: ");
		WriteInt(transform_tempo_read(Le_MemoriaEEPROM(i+6)));
		WriteText("\r\n");



	}
	WriteText("\r\n");
	WriteText("Total de registros: ");
	WriteInt((endereco_atual)/7);
	WriteText("\r\n");
}
/*
Escreve_MemoriaEEPROM(endereco_atual, ValorDisplay[0] | (ValorDisplay[1] << 4));
			Escreve_MemoriaEEPROM(endereco_atual+1, ValorDisplay[2] | (ValorDisplay[3] << 4));
			Escreve_MemoriaEEPROM(endereco_atual+2, entrada_saida);
			Escreve_MemoriaEEPROM(endereco_atual+3, hora_atual);
			Escreve_MemoriaEEPROM(endereco_atual+4, minuto_atual);
			Escreve_MemoriaEEPROM(endereco_atual+5, dia_atual);
			Escreve_MemoriaEEPROM(endereco_atual+6, mes_atual);
*/


void playSomErro(){
	ValorDisplay[3] = 0;
	ValorDisplay[2] = 0;
	ValorDisplay[1] = 0;
	ValorDisplay[0] = 0;
	Sound_Play(1500, 500);
	ValorDisplay[3] = 13;
	ValorDisplay[2] = 13;
	ValorDisplay[1] = 13;
	ValorDisplay[0] = 13;
	delay_ms(500);
	ValorDisplay[3] = 0;
	ValorDisplay[2] = 0;
	ValorDisplay[1] = 0;
	ValorDisplay[0] = 0;
	Sound_Play(1500, 500);
	ValorDisplay[3] = 13;
	ValorDisplay[2] = 13;
	ValorDisplay[1] = 13;
	ValorDisplay[0] = 13;
	delay_ms(500);
	ValorDisplay[3] = 0;
	ValorDisplay[2] = 0;
	ValorDisplay[1] = 0;
	ValorDisplay[0] = 0;
	Sound_Play(1500, 500);
	ValorDisplay[3] = 13;
	ValorDisplay[2] = 13;
	ValorDisplay[1] = 13;
	ValorDisplay[0] = 13;
	delay_ms(500);
}
void playSomTecla(){
	Sound_Play(2000, 50);
}
void playSomSucesso(){
	Sound_Play(2000, 100);
	delay_ms(100);
	Sound_Play(2000, 100);
	delay_ms(500);
	Sound_Play(2000, 100);
	delay_ms(100);
	Sound_Play(2000, 100);
	delay_ms(500);
}
void playSomSucessoHora(){
	Sound_Play(650, 100);
	delay_ms(100);
	Sound_Play(660, 100);
	delay_ms(100);
	Sound_Play(670, 100);
	delay_ms(100);
	Sound_Play(700, 200);
	delay_ms(100);
	Sound_Play(660, 100);
	delay_ms(100);
	Sound_Play(700, 300);
	delay_ms(100);
}
int horaCerta(){
	if(ValorDisplay[3] > 2) return 0;
	else if(ValorDisplay[3] == 2 && ValorDisplay[2] >= 4) return 0;
	else if(ValorDisplay[1] > 5) return 0;

	return 1;
}
int main(){
	TRISE.F0 = 0;
	TRISE.F1 = 0;
	TRISE.F2 = 0;
	TRISE.F3 = 0;
	TRISA.F5 = 0;
	TRISD = 0;
	//configurar entrada e saida
	TRISB = 0B00001111;
	//habilitar pullup
	INTCON2.RBPU = 0;
	//setar pra tipo digital
	ADCON1 = 0x0F;
	I2C1_Init(100000); // initialize I2C communication
	Sound_Init(&PORTC, 2);
	Delay_ms(100); // Wait for UART module to stabilize

	initTimer0();
	UART1_Init(19200);

	endereco_atual = Le_MemoriaEEPROM(127);
	while(1){
		if(modo == 0){
			le_hora(&mes_atual, &dia_atual, &hora_atual, &minuto_atual, &segundo_atual);
			ValorDisplay[0] = minuto_atual & 0B00001111;
			ValorDisplay[1] = (minuto_atual & 0B11110000) >> 4;
			ValorDisplay[2] = hora_atual & 0B00001111;
			ValorDisplay[3] = (hora_atual & 0B11110000) >> 4;
		} else if(modo == 1 && valor_teclado != 255){
			if(endereco_atual >= 120){
				ValorDisplay[0] = 12;
				ValorDisplay[1] = 11;
				ValorDisplay[2] = 11;
				ValorDisplay[3] = 10;
				playSomErro();
				modo = 0;
			} else {
				ValorDisplay[3] = 0;
				ValorDisplay[2] = 0;
				ValorDisplay[1] = 0;
				ValorDisplay[0] = valor_teclado;
			}
		} else if(modo == 2 && valor_teclado != 255){
			ValorDisplay[3] = 0;
			ValorDisplay[2] = 0;
			ValorDisplay[1] = ValorDisplay[0];
			ValorDisplay[0] = valor_teclado;
		} else if(modo == 3 && valor_teclado != 255){
			ValorDisplay[3] = 0;
			ValorDisplay[2] = ValorDisplay[1];
			ValorDisplay[1] = ValorDisplay[0];
			ValorDisplay[0] = valor_teclado;
		} else if(modo == 4 && valor_teclado != 255){
			ValorDisplay[3] = ValorDisplay[2];
			ValorDisplay[2] = ValorDisplay[1];
			ValorDisplay[1] = ValorDisplay[0];
			ValorDisplay[0] = valor_teclado;
		} else if(modo == 5 && valor_teclado != 255){
			if(valor_teclado == 10){
				entrada_saida = 0;
				modo++;
			} else if(valor_teclado == 11){
				entrada_saida = 1;
				modo++;
			} else if(valor_teclado == 12){
				entrada_saida = 1;
				if(horaCerta() == 1){
					acerta_hora(ValorDisplay[2] | (ValorDisplay[3] << 4), ValorDisplay[0] | (ValorDisplay[1] << 4), 0);
					playSomSucessoHora();
				} else {
					playSomErro();
				}
				modo = 0;
			} else {
				UART1_write('E');
				UART1_write('R');
				UART1_write('R');
				UART1_write('O');
				playSomErro();
				modo = 0;
			}
			UART1_write('6');
		} else if(modo >= 6){
			UART1_write('7');
			le_hora(&mes_atual, &dia_atual, &hora_atual, &minuto_atual, &segundo_atual);
			endereco_atual = Le_MemoriaEEPROM(127);

			Escreve_MemoriaEEPROM(endereco_atual, ValorDisplay[0] | (ValorDisplay[1] << 4));
			Escreve_MemoriaEEPROM(endereco_atual+1, ValorDisplay[2] | (ValorDisplay[3] << 4));
			Escreve_MemoriaEEPROM(endereco_atual+2, entrada_saida);
			Escreve_MemoriaEEPROM(endereco_atual+3, hora_atual);
			Escreve_MemoriaEEPROM(endereco_atual+4, minuto_atual);
			Escreve_MemoriaEEPROM(endereco_atual+5, dia_atual);
			Escreve_MemoriaEEPROM(endereco_atual+6, mes_atual);


			endereco_atual+=7;
			Escreve_MemoriaEEPROM(127, endereco_atual);

			UART1_write('o');
			UART1_write('k');
			playSomSucesso();
			modo = 0;
			imprimeRelatorio();
		}

		if(modo < 6){
			valor_teclado = le_teclado();
			if(valor_teclado != 255){
				playSomTecla();
				modo++;
			}
		}
	}
}