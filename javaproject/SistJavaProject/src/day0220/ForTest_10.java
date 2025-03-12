package day0220;

public class ForTest_10 {

	public static void main(String[] args) {
		//1. 1~10까지 숫자 가로로 출력
		
		
		for(int i=1;i<=10;i++)
		{
			System.out.print(i+"  ");
		}
		System.out.println();
		
		//2. 10~1까지 숫자 가로로 출력
		for(int i=10;i>=1;i--)
		{
			System.out.print(i+"  ");
		}
		System.out.println();
		
		//Hello1 Hello2 Hello3 출력
		
		for(int i=1;i<=3;i++)
		{
			System.out.print("Hello"+i+"  ");
		}
		System.out.println();
		
		//1,4,7.....50까지 3의 배수 구하기
		for(int i=1;i<=50;i+=3)		
		{
			System.out.print(i+"  ");
		}
		System.out.println();
		
		
		//1 2 3 4 6 7 8 9 11...1~20까지 중 5의 배수 없이 출력할 것
		for(int i=1;i<=20;i++)
		{
			//5의 배수는 빼고 출력
			if(i%5==0)
				continue; //i++로 이동
				
			System.out.print(i+"  ");
		}
		System.out.println();
	
	
		//1~10까지의 숫자 중 짝수만 출력
		for(int i=1;i<=10;i++)
		{
			if(i%2==1)
				continue;
		System.out.print(i+"  ");
		}
		System.out.println();
		
		for(int i=2;i<=10;i+=2)
		{
			System.out.print(i+"  ");
		}
		System.out.println();
		for(int i=1;i<=10;i++)
		{
			if(i%2==0)
				System.out.print(i+"  ");
		}
	}

}
