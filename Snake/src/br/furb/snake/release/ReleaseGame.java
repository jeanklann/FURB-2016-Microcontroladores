package br.furb.snake.release;

import br.furb.snake.game.Game;

public class ReleaseGame {

	public static void main(String[] args) {
		new ReleaseGame();
	}
	
	public ReleaseGame(){
		Game game = new Game(20);
		game.StartGame();
		while(true){
			
		}
	}

}
