package br.furb.snake.debug;

import java.util.Scanner;

import br.furb.snake.game.Direction;
import br.furb.snake.game.FoodGameObject;
import br.furb.snake.game.Game;
import br.furb.snake.game.GameObject;
import br.furb.snake.game.SnakeGameObject;

public class DebugGame {
	static Game game = new Game(1);
	public static void main(String[] args) {
		game.StartGame();
		while(true){
			loop();
		}
		
	}
	public static void print(Game game){
		GameObject matriz[][] = game.getMatrix();
		for (int y = 0; y < matriz.length; y++) {
			for (int x = 0; x < matriz[y].length; x++) {
				if(matriz[x][y] == null){
						System.out.print('.');
				} else {
					if(matriz[x][y].getClass() == SnakeGameObject.class){
						System.out.print('@');
					} else if(matriz[x][y].getClass() == FoodGameObject.class){
						System.out.print('#');
					} else {
						System.out.print('&');
					}
				}
			}
			System.out.println();
		}
		System.out.println();
	}
	public static void loop(){
		Scanner scanner = new Scanner(System.in);
		String input = scanner.nextLine();
		if(input.equals("w")){
			game.GoDirection(Direction.Up);
		} else if(input.equals("s")){
			game.GoDirection(Direction.Down);
		} else if(input.equals("a")){
			game.GoDirection(Direction.Left);
		} else if(input.equals("d")){
			game.GoDirection(Direction.Right);
		}
		game.Update();
		print(game);
	}

}
