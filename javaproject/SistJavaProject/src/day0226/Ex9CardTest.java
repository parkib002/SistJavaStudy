package day0226;

public class Ex9CardTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Ex9Card.width=10;
		Ex9Card.height=20;
		
		System.out.println(Ex9Card.width);
		System.out.println(Ex9Card.height);
		
		//인스턴스 변수생성
		Ex9Card c1=new Ex9Card();
		
		System.out.println(c1.kind);//null
		System.out.println(c1.number);//0
		
		//c2생성해서 heart,7로 변경
		Ex9Card c2=new Ex9Card();
		
		c2.kind="heart";
		c2.number=7;
		
		System.out.println(c2.kind);
		System.out.println(c2.number);
		
		//c3생성
		Ex9Card c3=new Ex9Card();
		c3.kind="diamond";
		c3.number=9;
		
		System.out.println(c3.kind+","+c3.number+","+Ex9Card.width+","+Ex9Card.height);
		System.out.println(c2.kind+","+c2.number+","+Ex9Card.width+","+Ex9Card.height);
	}

}
