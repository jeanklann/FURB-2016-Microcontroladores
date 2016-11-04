const char AGUA = 0;
const char PORTA_AVIOES = 1;
const char ENCOURACADO = 2;
const char SUBMARINO = 3;
const char CRUZADOR = 4;
const char HIDROAVIAO = 5;

const char WIDTH = 15;
const char HEIGHT = 15;


char i = 0;
char j = 0;
char k = 0;
char l = 0;


char matriz[WIDTH][HEIGHT];

struct acertos {
	char x;
	char y;
	char acertou;
}

struct {
	struct acertos posicoes[6];
} porta_aviao[1];

struct {
	struct acertos posicoes[5];
} encouracados[2];

struct {
	struct acertos posicoes[2];
} cruzadores[3];

struct {
	struct acertos posicoes[1];
} submarinos[4];

struct {
	struct acertos posicoes[3];
} hidroavioes[5];

void CriaPortaAvioes(){
	char valido;
	char y;
	char x;
	for(j = 0; j < 1; j++){
		do{
			valido = 1;
			y = rand()%(HEIGHT-1);
			x = rand()%((WIDTH-1)-6);
			
			for(i = 0; i < 6; i++){
				if(matriz[x][y] != AGUA){
					valido = 0;
					break;
				}
				if(x > 0 && matriz[x-1][y] != AGUA){
					valido = 0;
					break;
				}
				if(x < WIDTH-1 && matriz[x+1][y] != AGUA){
					valido = 0;
					break;
				}
				if(y > 0 && matriz[x][y-1] != AGUA){
					valido = 0;
					break;
				}
				if(y < HEIGHT-1 && matriz[x][y+1] != AGUA){
					valido = 0;
					break;
				}
				porta_aviao[j].posicoes[i].y = y;
				porta_aviao[j].posicoes[i].x = x;
				porta_aviao[j].posicoes[i].acertou = 0;
				
				x++;
			}
		} while(valido == 1);
		for(i = 0; i < 6; i++){
			x = porta_aviao[j].posicoes[i].x;
			y = porta_aviao[j].posicoes[i].y;
			matriz[x][y] = PORTA_AVIOES;
		}
	}
	
}

void CriaEncouracados(){
	char valido;
	char y;
	char x;
	for(j = 0; j < 2; j++){
		do{
			valido = 1;
			y = rand()%(HEIGHT-1);
			x = rand()%((WIDTH-1)-5);
			
			for(i = 0; i < 5; i++){
				if(matriz[x][y] != AGUA){
					valido = 0;
					break;
				}
				if(x > 0 && matriz[x-1][y] != AGUA){
					valido = 0;
					break;
				}
				if(x < WIDTH-1 && matriz[x+1][y] != AGUA){
					valido = 0;
					break;
				}
				if(y > 0 && matriz[x][y-1] != AGUA){
					valido = 0;
					break;
				}
				if(y < HEIGHT-1 && matriz[x][y+1] != AGUA){
					valido = 0;
					break;
				}
				encouracados[j].posicoes[i].y = y;
				encouracados[j].posicoes[i].x = x;
				encouracados[j].posicoes[i].acertou = 0;
				
				x++;
			}
		} while(valido == 1);
		for(i = 0; i < 5; i++){
			x = encouracados[j].posicoes[i].x;
			y = encouracados[j].posicoes[i].y;
			matriz[x][y] = ENCOURACADO;
		}
	}
}

void CriaCruzadores(){
	char valido;
	char y;
	char x;
	for(j = 0; j < 3; j++){
		do{
			valido = 1;
			y = rand()%(HEIGHT-1);
			x = rand()%((WIDTH-1)-3);
			
			for(i = 0; i < 2; i++){
				if(matriz[x][y] != AGUA){
					valido = 0;
					break;
				}
				if(x > 0 && matriz[x-1][y] != AGUA){
					valido = 0;
					break;
				}
				if(x < WIDTH-1 && matriz[x+1][y] != AGUA){
					valido = 0;
					break;
				}
				if(y > 0 && matriz[x][y-1] != AGUA){
					valido = 0;
					break;
				}
				if(y < HEIGHT-1 && matriz[x][y+1] != AGUA){
					valido = 0;
					break;
				}
				cruzadores[j].posicoes[i].y = y;
				cruzadores[j].posicoes[i].x = x;
				cruzadores[j].posicoes[i].acertou = 0;
				
				x++;
			}
		} while(valido == 1);
		for(i = 0; i < 2; i++){
			x = cruzadores[j].posicoes[i].x;
			y = cruzadores[j].posicoes[i].y;
			matriz[x][y] = CRUZADOR;
		}
	}
}

void CriaSubmarinos(){
	char valido;
	char y;
	char x;
	for(j = 0; j < 4; j++){
		do{
			valido = 1;
			y = rand()%(HEIGHT-1);
			x = rand()%(WIDTH-1);
			
			if(matriz[x][y] != AGUA){
				valido = 0;
				break;
			}
			if(x > 0 && matriz[x-1][y] != AGUA){
				valido = 0;
				break;
			}
			if(x < WIDTH-1 && matriz[x+1][y] != AGUA){
				valido = 0;
				break;
			}
			if(y > 0 && matriz[x][y-1] != AGUA){
				valido = 0;
				break;
			}
			if(y < HEIGHT-1 && matriz[x][y+1] != AGUA){
				valido = 0;
				break;
			}
			submarinos[j].posicoes[0].y = y;
			submarinos[j].posicoes[0].x = x;
			submarinos[j].posicoes[0].acertou = 0;
			
			x++;
			
		} while(valido == 1);
		
		x = submarinos[j].posicoes[0].x;
		y = submarinos[j].posicoes[0].y;
		matriz[x][y] = SUBMARINO;
	}
}

void CriaHidroavioes(){
	char valido;
	char y;
	char x;
	char y_atual;
	char x_atual;
	
	for(j = 0; j < 5; j++){
		do{
			valido = 1;
			y = rand()%((HEIGHT-1)-1);
			x = rand()%((WIDTH-1)-3);
			
			for(i = 0; i < 3; i++){
				switch(i){
					case 0: 
						x_atual = x;
						y_atual = y+1;
						break;
					case 1: 
						x_atual = x+1;
						y_atual = y;
						break;
					case 2: 
						x_atual = x+2;
						y_atual = y+1;
						break;
				}
				if(matriz[x][y] != AGUA){
					valido = 0;
					break;
				}
				if(x > 0 && matriz[x-1][y] != AGUA){
					valido = 0;
					break;
				}
				if(x < WIDTH-1 && matriz[x+1][y] != AGUA){
					valido = 0;
					break;
				}
				if(y > 0 && matriz[x][y-1] != AGUA){
					valido = 0;
					break;
				}
				if(y < HEIGHT-1 && matriz[x][y+1] != AGUA){
					valido = 0;
					break;
				}
				hidroavioes[j].posicoes[i].y = y;
				hidroavioes[j].posicoes[i].x = x;
				hidroavioes[j].posicoes[i].acertou = 0;
			}
		} while(valido == 1);
		for(i = 0; i < 3; i++){
			x = hidroavioes[j].posicoes[i].x;
			y = hidroavioes[j].posicoes[i].y;
			matriz[x][y] = HIDROAVIAO;
		}
	}
}




