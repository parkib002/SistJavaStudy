package day0226;

public class Ex8Object {
	
	String name; //인스턴스 멤버변수..인스턴스 변수로 호출 가능..객체 생성 후 각각 다른값 가질 수 있다
	
	static final String MESSAGE="Happy Day"; 
	//static은 주로 상수선언할 때 인스턴스 변수 없이 클래스명으로 접근 가능

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		System.out.println("static 멤버변수는 new로 생성없이 호출 가능하다");
		System.out.println(Ex8Object.MESSAGE);//클래스명.변수명으로 호출 가능
		System.out.println(MESSAGE); //같은 클래스 내에서는 클래스명 생략이 가능하다
		
		//MESSAGE 초기값 재지정
		//MESSAGE="오늘 따뜻하다"; //final이라서 값변경 안됨
		
		Ex8Object ab=new Ex8Object(); //클래스명 참조(인스턴스)변수명=new 클래스명();
		Ex8Object cd=new Ex8Object();
		Ex8Object ef=new Ex8Object();
		
		ab.name="박창배";
		cd.name="손흥민";
		ef.name="김연아";
		
		
		System.out.println(ab.name);
		System.out.println(cd.name);
		System.out.println(ef.name);
		
		System.out.println("다 같이 사용하는 메세지: "+MESSAGE);
	}

}
