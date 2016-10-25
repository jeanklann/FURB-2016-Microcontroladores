package br.furb.snake.game;

import java.util.ArrayList;
import java.util.Random;


public class Game {
	public static final byte Width = 8;
	public static final byte Height = 8;
	
	private float desiredDelay = 1;
	private float score = 0;
	
	private Random random;
	
	private SnakeGameObject head;
	private ArrayList<FoodGameObject> foods = new ArrayList<FoodGameObject>();
	private ArrayList<GameObject> interfaceGrafica = new ArrayList<GameObject>();
	private int state;
	private float time;
	private float timeToSpawnFood;
	private int snakeSize = 3;

	public float getScore() {
		return score;
	}
	public void setScore(float score) {
		this.score = score;
	}
	public float getTime() {
		return time;
	}
	public void setTime(float time) {
		this.time = time;
	}
	public int getSnakeSize() {
		return snakeSize;
	}
	public void setSnakeSize(int snakeSize) {
		this.snakeSize = snakeSize;
	}
	public static byte getWidth() {
		return Width;
	}
	public static byte getHeight() {
		return Height;
	}
	public float getDesiredDelay() {
		return desiredDelay;
	}
	public GameObject[][] getMatrix(){
		GameObject matrix[][] = new GameObject[Width][];
		for (int i = 0; i < matrix.length; i++) {
			matrix[i] = new GameObject[Height];
		}
		if(state == GameState.Run){
			SnakeGameObject next = head;
			while(next != null){
				matrix[next.position.X][next.position.Y] = next;
				next = next.root;
			}
			for (int i = 0; i < foods.size(); i++) {
				FoodGameObject food = (FoodGameObject) foods.get(i);
				matrix[food.position.X][food.position.Y] = food;
			}
		} else {
			for (int i = 0; i < interfaceGrafica.size(); i++) {
				GameObject inter = (GameObject) interfaceGrafica.get(i);
				matrix[inter.position.X][inter.position.Y] = inter;
			}
		}
		
		return matrix;
	}
	
	public Game(float desiredFPS){
		desiredDelay = 1f / desiredFPS;
		//random = new Random();
		random = new Random(3); //seed
		state = GameState.Start;
		
		time = 0f;
	}
	public void StartGame(){
		SnakeGameObject tail = new SnakeGameObject();
		SnakeGameObject corpse = new SnakeGameObject();
		head = new SnakeGameObject();
		
		tail.Direction = Direction.Down;
		corpse.Direction = Direction.Down;
		head.Direction = Direction.Down;
		
		tail.position = new Position(Width / 2, Height / 2 - 1);
		corpse.position = new Position(Width / 2, Height / 2);
		head.position = new Position(Width / 2, Height / 2 + 1);
		
		head.root = corpse;
		corpse.root = tail;
		time = 0f;
		timeToSpawnFood = FoodGameObject.TimeToSpawn;
		SpawnFood();
		SpawnFood();
		state = GameState.Run;
	}
	public void Update(){
		time += desiredDelay;
		timeToSpawnFood -= desiredDelay;
		PassFoodTime();
		
		switch (state) {
			case GameState.Start:
				// TODO estado antes de iniciar o jogo
				break;
			case GameState.Run:
				if(timeToSpawnFood <= 0){
					timeToSpawnFood = FoodGameObject.TimeToSpawn;
					SpawnFood();
				}
				MoveSnake();
				Verify();
				// TODO tem que ver se falta mais alguma coisa aqui
				break;
			case GameState.Win:
				if(interfaceGrafica.size() < Width*Height){
					GameObject obj = new GameObject();
					obj.position = new Position(interfaceGrafica.size()%Width, interfaceGrafica.size()/Width);
					interfaceGrafica.add(obj);
				}
				break;
			case GameState.Lose:
				if(interfaceGrafica.size() < Width*Height){
					GameObject obj = new GameObject();
					obj.position = new Position(interfaceGrafica.size()%Width, interfaceGrafica.size()/Width);
					interfaceGrafica.add(obj);
				}
				break;
		}

	}
	
	private void Verify(){
		for (int i = 0; i < foods.size(); i++) {
			FoodGameObject food = (FoodGameObject) foods.get(i);
			if(food.position.IsEqual(head.position)){
				score++;
				foods.remove(i);
				SnakeGameObject next = head.root;
				while(next != null){
					if(next.root == null){
						SnakeGameObject cauda = new SnakeGameObject();
						cauda.position = new Position(next.position.X, next.position.Y);
						cauda.comidoAgora = true;
						cauda.Direction = next.Direction;
						next.root = cauda;
						snakeSize++;
						break;
					}
					next = next.root;
				}
				break;
			}
		}
		if(snakeSize >= Width * Height){
			state = GameState.Win;
			return;
		}
		SnakeGameObject next = head.root;
		while(next != null){
			if(head.position.IsEqual(next.position)){
				state = GameState.Lose;
				return;
			}
			next = next.root;
		}
		
	}
	private void SpawnFood(){
		if(foods.size() >= FoodGameObject.MaxSpawnedFood) return;
		boolean valid;
		Position pos;
		do{
			valid = true;
			pos = new Position(
				random.nextInt(Width), 
				random.nextInt(Height));
			for (int i = 0; i < foods.size(); i++) {
				FoodGameObject food = (FoodGameObject) foods.get(i);
				if(food.position.IsEqual(pos)){
					valid = false;
					break;
				}
			}
			if(!valid) continue;
			
			SnakeGameObject next = head;
			while(next != null){
				if(pos.IsEqual(next.position)){
					valid = false;
					break;
				}
				next = next.root;
			}
		} while(!valid);
		FoodGameObject food = new FoodGameObject();
		food.position = pos;
		foods.add(food);
	}
	private void PassFoodTime(){
		int max = foods.size();
		for (int i = 0; i < max; i++) {
			FoodGameObject food = (FoodGameObject) foods.get(i);
			food.TimePassed += desiredDelay;
			if(food.TimePassed >= FoodGameObject.TimeToDisapear){
				foods.remove(i);
				max--;
				i--;
			}
		}
	}
	private void MoveSnake(){
		SnakeGameObject next = head;
		int lastDirection = head.Direction;
		if(head == null){
			System.out.println("gsjiodgd");
		}
		while(next != null){
			if(!next.comidoAgora){
				switch (next.Direction) {
					case Direction.Down:
						next.position.Y++;
						break;
					case Direction.Up:
						next.position.Y--;
						break;
					case Direction.Left:
						next.position.X--;
						break;
					case Direction.Right:
						next.position.X++;
						break;
				}
				// TODO fazer as tratativas para quando ele chegar no fim do mapa
				if(next.position.X >= Width)
					next.position.X = 0;
				else if(next.position.X < 0)
					next.position.X = Width - 1;
				
				if(next.position.Y >= Height)
					next.position.Y = 0;
				else if(next.position.Y < 0)
					next.position.Y = Height - 1;
			
			
			
				int temp_dir = next.Direction;
				next.Direction = lastDirection;
				lastDirection = temp_dir;
			}
			next.comidoAgora = false;
			next = next.root;
		}
	}
	public void GoDirection(int direction){
		head.Direction = direction;
	}
	
}
