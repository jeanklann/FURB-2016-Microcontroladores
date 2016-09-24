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
const char keyStart = 0;
const char keyUp = 4;
const char keyDown = 2;
const char keyLeft = 3;
const char keyRight = 1;
const char voidValue = 0;
const char foodValue = 1;
const char obstacleValue = 2;
const char startState = 0;
const char startingState = 1;
const char runningState = 2;
const char loseState = 3;
const char winState = 4;
const char pauseState = 5;


//hardware specific
const int width = 16;
const int height = 2;

//vars
char level[width][height];
int currentDirection = keyRight;
int score = 0;
int seed = 0;
int spawnTime = 5000; //in ms
int gameTime = 0;
int i,j,k,x,y;
int pacmanX = (width-1)/2;
int pacmanY = (height-1)/2;
int gameState = startState;

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
        if(!PORTB.F3) { while(!PORTB.F3); Delay_ms(20); return(0); }
        return(255);
}

int digitalRead(char valor){
	if(le_teclado() == valor){
		return HIGH;
	}
	return LOW;
}

void draw_character(char custom_char) {
	Lcd_Chr(pacmanX+1, pacmanY+1, custom_char);
}

byte random_0_1() {
	rand() & (0b1);
}

byte random_0_15() {
	rand() & (0b1111);
}

void drawPacMan(){
	switch(currentDirection){
		case keyUp:
			draw_character(charUp);
		break;
		case keyLeft:
			draw_character(charLeft);
		break;
		case keyRight:
			draw_character(charRight);
		break;
		case keyDown:
			draw_character(charDown);
		break;
	}
}
void spawnFood(){
	int isValid;
	do {
		isValid = 1;
		x = random_0_15();
		y = random_0_1();
		if(level[x][j] == foodValue) isValid = 0;
		else if(pacmanX == x && pacmanY == y) isValid = 0;
		else level[x][j] = foodValue;
	} while(!isValid);
}
void generateLevel(){
	for(i = 0; i < 6; i++){
		spawnFood();
	}
}
void gameLogic(){
	if(level[pacmanX][pacmanY] == foodValue){
		level[pacmanX][pacmanY] = voidValue;
		++score;
		gameTime += 200;
	}
	switch(currentDirection){
		case keyUp:
			--pacmanY;
		break;
		case keyLeft:
			--pacmanX;
		break;
		case keyRight:
			++pacmanX;
		break;
		case keyDown:
			++pacmanY;
		break;
	}
	if(gameTime >= spawnTime){
		gameTime = 0;
		spawnTime -= 200;
		spawnFood();
	}
}


void drawAll(){
	for(j = 0; j<height; j++){
		for(i = 0; i<width; i++){
			if(level[i][j] == voidValue) Lcd_Chr(i+1, j+1, " ");
			else if(level[i][j] == foodValue) Lcd_Chr(i+1, j+1, "*");
		}
	}
	drawPacMan();
}
void getNewSeed(){
	//seed = randomSeed(micros());
}
void verifyState(){
	int hasVoid = 0;
	int hasFood = 0;
	for(i = 0; i<width; i++){
		for(j = 0; j<width; j++){
			if(level[i][j] == voidValue) hasVoid = 1;
			else if(level[i][j] == foodValue) hasFood = 1;
			if(hasVoid && hasFood) break;
		}
		if(hasVoid && hasFood) break;
	}
	if(!hasVoid) gameState = loseState;
	if(!hasFood) gameState = winState;
}
void gameStateLoop(){
	switch(gameState){
		case startState:
			Lcd_Cmd(_LCD_CLEAR);
			Lcd_Out(1, 1, "     APERTE     ");
			Lcd_Out(2, 1, "     START      ");

			if(digitalRead(keyStart) == HIGH){
				gameState = startingState;
			}
		break;
		case startingState:
			Lcd_Cmd(_LCD_CLEAR);
			Lcd_Out(1, 1, "   SOLTE PARA   ");
			Lcd_Out(2, 1, "    INICIAR     ");

			if(digitalRead(keyStart) == LOW){
				Lcd_Cmd(_LCD_CLEAR);
				getNewSeed();
				generateLevel();
				gameState = runningState;
			}

		break;
		case runningState:
			if(digitalRead(keyDown) == HIGH){
				currentDirection = keyDown;
			} else if(digitalRead(keyLeft) == HIGH){
				currentDirection = keyLeft;
			} else if(digitalRead(keyRight) == HIGH){
				currentDirection = keyRight;
			} else if(digitalRead(keyUp) == HIGH){
				currentDirection = keyUp;
			}
			gameLogic();
			drawAll();

			if(digitalRead(keyStart) == HIGH){
				gameState = runningState;
				break;
			}
		break;
		case loseState:
			Lcd_Cmd(_LCD_CLEAR);
			Lcd_Out(1, 1, "      VOCE      ");
			Lcd_Out(2, 1, "     PERDEU     ");
		break;
		case winState:
			Lcd_Cmd(_LCD_CLEAR);
			Lcd_Out(1, 1, "      VOCE      ");
			Lcd_Out(2, 1, "     GANHOU     ");
		break;
		default:
		break;

	}
}

void CustomChar(){
	char i;
	LCD_Cmd(0x40);
	for(i = 0; i<=7; i++) LCD_Chr_Cp(right[i]);
	for(i = 0; i<=7; i++) LCD_Chr_Cp(left[i]);
	for(i = 0; i<=7; i++) LCD_Chr_Cp(up[i]);
	for(i = 0; i<=7; i++) LCD_Chr_Cp(down[i]);

	LCD_Cmd(_LCD_RETURN_HOME);
}

void loop() {
	gameStateLoop();
	gameTime += 50;
	delay_ms(50);
}

void main() {
	//configurar entrada e saida
	TRISB = 0B00001111;
	//habilitar pullup
	INTCON2.RBPU = 0;
	//setar pra tipo digital
	ADCON1 = 0x0F;
	//ANSEL  = 0;                        // Configure AN pins as digital I/O
	//ANSELH = 0;
	//C1ON_bit = 0;                      // Disable comparators
	//C2ON_bit = 0;
	Lcd_Init();                        // Initialize LCD

	//Lcd_Cmd(_LCD_CLEAR);               // Clear display
	Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off

	Delay_ms(100);


	//erases the level
	for(i = 0; i<width; i++){
		for(j = 0; j<height; j++){
			level[i][j] = voidValue;
		}
	}



	CustomChar();
	while (1) {
		loop();
	}
}


