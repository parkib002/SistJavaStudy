package day0217;

public class SpecialCharTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        //Escape 시퀀스는 모두 \로 시작함
		//\t: 다음 탭위치로 이동
		//\n: 다음줄로 이동
		//\': 소따옴표 기능
		//\": 대따옴표 기능
		//\\: 백슬래시 기능
		System.out.println("Apple\t");
		System.out.println("Banana\tMellon");
		System.out.println("\"Apple\"");	
		System.out.println("\'Hello\'");
		System.out.println("\"피자\",\"스파게티\",\"햄버거\"");
		System.out.println("Banana\nMellon");
		System.out.println("\\");
	}

}
