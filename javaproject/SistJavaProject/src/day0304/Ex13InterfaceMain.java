package day0304;

interface GameA{
	
	public void play();
}
interface GameB{
	
	public void stop();
}
class MyGame implements GameA,GameB{

	@Override
	public void stop() {
		// TODO Auto-generated method stub
		System.out.println("게임을 중지합니다");
	}

	@Override
	public void play() {
		// TODO Auto-generated method stub
		System.out.println("게임을 시작합니다");
	}
	
}
public class Ex13InterfaceMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		MyGame game=new MyGame();
		game.play();
		game.stop();
		
		System.out.println("--------------------");
		
		GameA gameA=new MyGame();
		gameA.play();
		GameB gameB=new MyGame();
		gameB.stop();

	}

}
