package br.furb.snake.game;

public class Position {
	public byte X = 0;
	public byte Y = 0;
	
	public Position() {
		
	}	
	public Position(byte x, byte y) {
		X = x; Y = y;
	}
	public Position(int x, int y) {
		X = (byte)x; Y = (byte)y;
	}
	
	public boolean IsEqual(Position other){
		 return (X == other.X && Y == other.Y);
	}
}
