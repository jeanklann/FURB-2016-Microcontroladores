#define HIGH 1
#define LOW 0

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

typedef unsigned char byte;

byte right[8] = {
	0b00000,
	0b01110,
	0b11111,
	0b11000,
	0b11000,
	0b11111,
	0b01110,
	0b00000
};
byte left[8] = {
	0b00000,
	0b01110,
	0b11111,
	0b00011,
	0b00011,
	0b11111,
	0b01110,
	0b00000
};
byte up[8] = {
	0b00000,
	0b01010,
	0b11011,
	0b11011,
	0b11111,
	0b11111,
	0b01110,
	0b00000
};
byte down[8] = {
	0b00000,
	0b01110,
	0b11111,
	0b11111,
	0b11011,
	0b11011,
	0b01010,
	0b00000
};

byte wall[8] = {
	0b11111,
	0b11111,
	0b11111,
	0b11111,
	0b11111,
	0b11111,
	0b11111,
	0b11111
};

//consts

const char charDown = 0;
const char charUp = 1;
const char charLeft = 2;
const char charRight = 3;
const char charWall  = 4;

const char keyStart = 1;
const char keyUp = 5;
const char keyDown = 3;
const char keyLeft = 4;
const char keyRight = 2;

const char voidValue = 0;
const char foodValue = 1;
const char wallValue = 2;

//hardware specific
const int width = 16;
const int height = 2;

//vars
char level[height][width];
int i,j,k,x,y;
char ultimaTecla = 0;
int pacmanX=1, pacmanY=1;
char pacmanFace = charLeft;
char oldpacmanface = charLeft;
char score = 0;
char record = 0;
char click = 0;
char click_spawn = 7;
char perdeu = 0;

char score_str[3] = {0, 0, 0};
char record_str[3] = {0, 0, 0};


struct Parede {
	int x; int y;
};

struct Parede p1 = {3 , 1};
struct Parede p2 = {10, 2};

unsigned char le_teclado(){
        PORTB = 0x70;
        if(!PORTB.F0) { while(!PORTB.F0); Delay_ms(20); return(0); }
        if(!PORTB.F1) { while(!PORTB.F1); Delay_ms(20); return(0); }
        if(!PORTB.F2) { while(!PORTB.F2); Delay_ms(20); return(0); }
        if(!PORTB.F3) { while(!PORTB.F3); Delay_ms(20); return(0); }
        PORTB = 0xB0;
        if(!PORTB.F0) { while(!PORTB.F0); Delay_ms(20); return(0); }
        if(!PORTB.F1) { while(!PORTB.F1); Delay_ms(20); return(keyRight); }
        if(!PORTB.F2) { while(!PORTB.F2); Delay_ms(20); return(0); }
        if(!PORTB.F3) { while(!PORTB.F3); Delay_ms(20); return(0); }
        PORTB = 0xD0;
        if(!PORTB.F0) { while(!PORTB.F0); Delay_ms(20); return(keyUp); }
        if(!PORTB.F1) { while(!PORTB.F1); Delay_ms(20); return(0); }
        if(!PORTB.F2) { while(!PORTB.F2); Delay_ms(20); return(keyDown); }
        if(!PORTB.F3) { while(!PORTB.F3); Delay_ms(20); return(0); }
        PORTB = 0xE0;
        if(!PORTB.F0) { while(!PORTB.F0); Delay_ms(20); return(0); }
        if(!PORTB.F1) { while(!PORTB.F1); Delay_ms(20); return(keyLeft); }
        if(!PORTB.F2) { while(!PORTB.F2); Delay_ms(20); return(0); }
        if(!PORTB.F3) { while(!PORTB.F3); Delay_ms(20); return(keyStart); }
        return(0);
}

void CustomChar(){
	char i;
	LCD_Cmd(0x40);
	for(i = 0; i<=7; i++) LCD_Chr_Cp(down[i]);
	for(i = 0; i<=7; i++) LCD_Chr_Cp(up[i]);
	for(i = 0; i<=7; i++) LCD_Chr_Cp(left[i]);
	for(i = 0; i<=7; i++) LCD_Chr_Cp(right[i]);
	for(i = 0; i<=7; i++) LCD_Chr_Cp(wall[i]);

	LCD_Cmd(_LCD_RETURN_HOME);
}

void draw_character(char custom_char) {
	Lcd_Chr(pacmanY, pacmanX, custom_char);
}

void draw_level() {
	Lcd_Chr(p1.y, p1.x, charWall);
	Lcd_Chr(p2.y, p2.x, charWall);
	
	for (j=0; j<height; j++) {
		for (i=0; i<width; i++) {
			if (level[j][i] == foodValue) {
				Lcd_Chr(j+1, i+1, '*');
			}
		}
	}
}

byte random_0_1() {
	return rand() & (0b1);
}

byte random_0_15() {
	return rand() & (0b1111);
}

void setup_comida()
{
	int isValid;
	do {
		isValid = 1;
		x = random_0_15();
		y = random_0_1();
		if(level[y][x] == foodValue) isValid = 0;
		if(level[y][x] == wallValue) isValid = 0;
		else if(pacmanX == x && pacmanY == y) isValid = 0;
		else level[y][x] = foodValue;
	} while(!isValid);
}

int tem_colisao_paredes() {
    int colisao = 0;
    if (pacmanX == p1.x && pacmanY == p1.y) {
		colisao = 1;
	}
	if (pacmanX == p2.x && pacmanY == p2.y) {
		colisao = 1;
	}
	return colisao;
}

int tem_colisao_comida() {
	return (level[pacmanY-1][pacmanX-1] == foodValue);
}

void loop() {
	oldpacmanface = pacmanFace;
	ultimaTecla = le_teclado();
	while(ultimaTecla == 0) {
		ultimaTecla = le_teclado();
	}
	
	switch (ultimaTecla) {
	case keyUp:
		pacmanY -= 1; pacmanFace = charUp;break;
	case keyDown:
		pacmanY += 1; pacmanFace = charDown;break;
	case keyLeft:
		pacmanX -= 1; pacmanFace = charLeft;break;
	case keyRight:
		pacmanX += 1; pacmanFace = charRight;break;
	}
	
	if (tem_colisao_paredes()) {
		switch (ultimaTecla) {
		case keyUp:
			pacmanY += 1; pacmanFace = oldpacmanface;break;
		case keyDown:
			pacmanY -= 1; pacmanFace = oldpacmanface;break;
		case keyLeft:
			pacmanX += 1; pacmanFace = oldpacmanface;break;
		case keyRight:
			pacmanX -= 1; pacmanFace = oldpacmanface;break;
		}
	}
	
	if (tem_colisao_comida()) {
		level[pacmanY-1][pacmanX-1] = voidValue;
		score += 1;
		click_spawn += 1;
	}
	
	if(pacmanX > width)
		pacmanX = 1;
	if(pacmanX < 1)
		pacmanX = width;
	if(pacmanY > height)
		pacmanY = height;
	if(pacmanY < 1)
		pacmanY = 1;
	
	Lcd_Cmd(_LCD_CLEAR);	
	draw_level();
	draw_character(pacmanFace);
	
	click += 1;
	if (click >= click_spawn) {
		click_spawn -= 1;
		click = 0;
		setup_comida();
	}
	
	if (click_spawn <= 0) {
		perdeu = 1;
	}
	
	if (click_spawn >= 10) {
		perdeu = 2;
	}
}

void start() {
	Lcd_Out(1, 1, "     APERTE     ");
	Lcd_Out(2, 1, "     START      ");
	ultimaTecla = le_teclado();
	while(ultimaTecla == 0) {
		ultimaTecla = le_teclado();
	}
	Lcd_Cmd(_LCD_CLEAR);
}

void main() {
	//configurar entrada e saida
	TRISB = 0B00001111;
	//habilitar pullup
	INTCON2.RBPU = 0;
	//setar pra tipo digital
	ADCON1 = 0x0F;
	
	Lcd_Init();                        // Initialize LCD

	//Lcd_Cmd(_LCD_CLEAR);               // Clear display
	Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off

	Delay_ms(100);

	//erases the level
	for(i = 0; i<width; i++){
		for(j = 0; j<height; j++){
			level[j][i] = voidValue;
		}
	}
		
	// coloca as paredes;
	level[p1.y-1][p1.x-1] = wallValue;
	level[p2.y-1][p2.x-1] = wallValue;
	//coloca as comidas
	setup_comida();
	setup_comida();
	setup_comida();


	CustomChar();
	
	record = (char)EEPROM_Read(0x32);
	
	start();
	while (!perdeu) {
		loop();
		Delay_ms(50);
	}
	IntToStr((int)score, score_str);
	IntToStr((int)record, record_str);
	
	while(1){
		Lcd_Cmd(_LCD_CLEAR);
		if (perdeu == 1) {
			Lcd_Out(1, 1, "     PERDEU    ");
			Lcd_Out(2, 1, score_str);
		} else {
			Lcd_Out(1, 1, "     GANHOU    ");
			Lcd_Out(2, 1, score_str);
		}
		
		ultimaTecla = 0;
		while(ultimaTecla == 0) {
			ultimaTecla = le_teclado();
		}
		
		Lcd_Cmd(_LCD_CLEAR);	
			Lcd_Out(1, 1, "     RECORD    ");
			Lcd_Out(2, 1, record_str);
			if (score > record) {
				EEPROM_Write(0x32, score);
			}
		ultimaTecla = 0;
		while(ultimaTecla == 0) {
			ultimaTecla = le_teclado();
		}
	}
}