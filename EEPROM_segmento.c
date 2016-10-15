//Acerta hora
unsigned char txt[6]; //utilizada para conversao de binario para txt para ser impresso
short hora_atual;
short minuto_atual;
short segundo_atual;
void Escreve_Memoria(unsigned int endereco, unsigned char dado);
unsigned char Le_Memoria(unsigned int endereco);

const int valorOK[] = {
	0x3F, //O
	0x76
};
const int valorFAIL[] = {
	0x71, //F
	0x77, //A
	0x06, //I
	0x38 //L
};
int valor = 0;

const int pausa = 4;

void escreveOK(){
    PORTD = 0B00000000;
	PORTE = 0B00000001;
	PORTD = valorOK[0];
	delay_ms(pausa);
	
	PORTD = 0B00000000;
	PORTE = 0B00000010;
	PORTD = valorOK[1];
	delay_ms(pausa);
	
	PORTD = 0B00000000;
	PORTE = 0B00000100;
	PORTD = 0;
	delay_ms(pausa);
	
	PORTE = 0B00000000;
	PORTD = 0B00000000;
	PORTD = 0;
	PORTA.F5 = 1;
	delay_ms(pausa);
	PORTA.F5 = 0;
	PORTD = 0B00000000;
}
void escreveFAIL(){
    PORTD = 0B00000000;
	PORTE = 0B00000001;
	PORTD = valorFAIL[0];
	delay_ms(pausa);
	
	PORTD = 0B00000000;
	PORTE = 0B00000010;
	PORTD = valorFAIL[1];
	delay_ms(pausa);
	
	PORTD = 0B00000000;
	PORTE = 0B00000100;
	PORTD = valorFAIL[2];
	delay_ms(pausa);
	
	PORTE = 0B00000000;
	PORTD = 0B00000000;
	PORTD = valorFAIL[3];
	PORTA.F5 = 1;
	delay_ms(pausa);
	PORTA.F5 = 0;
	PORTD = 0B00000000;
}


//Passa como parametro as hora em binario (decimal) e entao converte para BCD
//para acertar a hora...
void acerta_hora(short hora, short minuto, short segundo){
	short hora_bcd;
	short minuto_bcd;
	short segundo_bcd;
	hora_bcd = (hora / 10) * 16 + (hora % 10);
	minuto_bcd = (minuto / 10) * 16 + (minuto % 10);
	segundo_bcd = (segundo / 10) * 16 + (segundo % 10);
	Escreve_Memoria(0,segundo_bcd); //11 segundos
	Escreve_Memoria(1,minuto_bcd); //11 minutos
	Escreve_Memoria(2,hora_bcd); //11 horas
}
//Passa como parametro tres variaveis que receberao a hora
//A hora lida é em bcd e deve novamente ser transformada em Binario para o usuário
void le_hora(short *hora, short *minuto, short *segundo){
	short hora_binario;
	short minuto_binario;
	short segundo_binario;
	segundo_binario = Le_Memoria(0);
	minuto_binario = Le_Memoria(1);
	hora_binario = Le_Memoria(2);
	*hora = ((hora_binario & 0xF0) / 16) * 10 + (hora_binario &	0x0F);
	*minuto = ((minuto_binario & 0xF0) / 16) * 10 + (minuto_binario & 0x0F);
	*segundo = ((segundo_binario & 0xF0) / 16) * 10 + (segundo_binario & 0x0F);
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
	//I2C1_Repeated_Start(); // issue I2C signal repeated start
	//I2C1_Wr(0xD1); // send byte (device address + R)
	dado_lido = I2C1_Rd(0u); // Read the data (NO acknowledge)
	I2C1_Stop();
	return(dado_lido);
}
void main(){
	/*
	I2C1_Init(100000); // initialize I2C communication
	Delay_ms(100); // Wait for UART module to stabilize
	UART1_Init(9600); // Initialize UART module at 9600 bps
	Delay_ms(100); // Wait for UART module to stabilize
	UART1_Write_Text("Start");
	//Acerta hora para 11:11:11
	hora_atual = 11;
	minuto_atual = 12;
	segundo_atual = 17;
	acerta_hora(hora_atual,minuto_atual,segundo_atual);
	UART1_Write_Text("CELESC INFORMA...");
	while(1){
		le_hora(&hora_atual,&minuto_atual,&segundo_atual);
		UART1_Write(13);
		UART1_Write(10);
		//converte inteiro para string
		inttostr(hora_atual,txt);
		UART1_Write_Text(txt);
		UART1_Write_Text(":");
		//converte inteiro para string
		inttostr(minuto_atual,txt);
		UART1_Write_Text(txt);
		UART1_Write_Text(":");
		//converte inteiro para string
		inttostr(segundo_atual,txt);
		UART1_Write_Text(txt);
		delay_ms(1000);
	}
	*/
	TRISE.F0 = 0;
	TRISE.F1 = 0;
	TRISE.F2 = 0;
	TRISE.F3 = 0;
	TRISA.F5 = 0;
	TRISD = 0;
	I2C1_Init(100000); // initialize I2C communication
	Delay_ms(100); // Wait for UART module to stabilize
	
	
	Escreve_MemoriaEEPROM(0, 22);
	valor = Le_MemoriaEEPROM(0);
	
	while(1){
		if(valor == 22){
			escreveOK();
		} else {
			escreveFAIL();
		}
	}
	
	
	
}