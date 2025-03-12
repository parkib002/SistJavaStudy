package day0220;

public class ForSum_12 {

	public static void main(String[] args) {
		// 1~10까지의 반복문으로 합 구하기_for

		int sum=0;
		for(int i=1;i<=10;i++)
		{
			sum+=i; //sum=sum_+i
		}
		
		System.out.println("1~10까지의 합은"+sum+"입니다");
		
		// 1~10까지의 반복문으로 합 구하기_while
		int tot=0;
		int i=1;
		while(i<=10) {
			
			//합계변수에 i를 누적시킨다
			tot=tot+i; //tot+=i;
			i++;
		}
		System.out.println("1~10까지의 합은"+tot+"입니다");
		
		//1~20까지의 합을 구하되 2씩 증가한다(1 3 5 7 .....)
		int a=0;
		for(i=1;i<=20;i+=2)
		{
			a+=i;
		}
		System.out.println(a);
		
		

		//Q.1 2 4 5 7 8 10
		for(int b=0;b<=10;b++)
		{
			if(b%3==0)
				continue;
			System.out.print(b+"  ");
		}
		System.out.println();
	
				
		
	}

}
