package day0226;

public class Ex9Card {

	//iv_생성 후 인스턴스변수명으로 접근
	String kind; //카드의 무늬_iv(인스턴스 변수)
	int number; //카드의 숫자_""
	
	//클래스명으로 접근가능_인스턴스 생성없이 클래스가 로딩될 때 생성 종료하면 소멸
	static int width; //카드의 넓이_static변수_클래스변수
	static int height;//카드의 높이_""
}
