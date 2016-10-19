package br.furb.snake.debug;

import br.furb.snake.game.Direction;
import br.furb.snake.game.FoodGameObject;
import br.furb.snake.game.Game;
import br.furb.snake.game.GameObject;
import br.furb.snake.game.SnakeGameObject;

public class DebugGame {

	public static void main(String[] args) {
		// TODO fazer com debug no terminal
		Game game = new Game(30);
		game.StartGame();
		print(game);
		game.Update();
		print(game);
		game.GoDirection(Direction.Left);
		game.Update();
		print(game);
		game.Update();
		print(game);
		game.GoDirection(Direction.Up);
		game.Update();
		print(game);
		game.GoDirection(Direction.Right);
		game.Update();
		print(game);
		game.Update();
		print(game);
		game.Update();
		print(game);
		game.Update();
		print(game);
		game.Update();
		print(game);
		game.Update();
		print(game);
		game.Update();
		print(game);
		game.Update();
		print(game);
		game.Update();
		print(game);
		game.Update();
		print(game);
		
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
					}
				}
			}
			System.out.println();
		}
		System.out.println();
	}

}
