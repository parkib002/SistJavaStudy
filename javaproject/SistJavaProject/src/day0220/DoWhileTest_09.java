package day0220;

public class DoWhileTest_09 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//조건이 참일동안 반복
		//선조건: 조건이 먼저 옴
		int i=1;
		
		System.out.println("While문 결과");
		while(i<=5)  //조건이 안 맞으면 한번도 결과수행 안함
		{
			//출력 후 증가
			System.out.print(i++ +"  ");
		
		}
		System.out.println();
		
		System.out.println("do~While문 결과");
	
		i=1;
		
		do {
			System.out.print(i++ +"  ");
		}while(i<=5);
		System.out.println("종료");
	
	}
	

}
