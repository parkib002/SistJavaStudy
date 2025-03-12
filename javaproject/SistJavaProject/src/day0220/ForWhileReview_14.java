package day0220;

import java.util.Scanner;

public class ForWhileReview_14 {
	
	public static void sumTest1() {
		
		//for문으로 1~5까지 더하기
		int sum=0;
		for(int i=1;i<=5;i++)
		{
			sum+=i; //sum=sum+i
		}
		System.out.println("총합계는 "+sum+"입니다");
	}
	
	public static void sumTest2() {
		
		//1~10까지중 홀수의 합 1 3 5 7 9
		int sum=0;
		for(int i=1;i<=10;i+=2)
		{
			sum=sum+i;
		}
		System.out.println("총합계는 "+sum+"입니다");
	}
	
	public static void sumTest3() {
		
		int sum=0;
		int i;
		for(i=1;i<=10;i++)
		{
			sum+=i;
		}
		System.out.println("1부터"+(i-1)+"까지의 합은"+sum);
	}
	
	public static void quiz1() {
		
		//1부터 100까지의 숫자중 짝수합과 홀수합을 나누어 출력하시오
		
		//짝수의 합:***
		//홀수의 합:***
	
		
		int a=0;
		for(int i=0;i<=100;i+=2)
		{
			a=a+i;
		}
		System.out.println("짝수의 합: "+a);
		int b=0;
		for(int i=1;i<=100;i+=2)
		{
			b=b+i;
		}
		System.out.println("홀수의 합: "+b);
		System.out.println("=====================");
		int esum=0;
		int osum=0;
		
		for(int i=1;i<=100;i++)
		{
		if(i%2==0)
			esum+=i;
		else
			osum+=i;
		}
		System.out.println("짝수의 합: "+esum);
		System.out.println("홀수의 합: "+osum);
	}
	
	public static void quiz2() {
		
		//합계를 더할 숫자를 입력하시오
		//숫자를 입력하면 1부터 입력한 숫자까지의 합계를 구해서 출력하시오
		
		//1부터 **까지의 합은 *** 입니다
		Scanner sc=new Scanner(System.in);
		int a, tot=0;
		System.out.println("합계를 더할 숫자를 입력하시오");
		a=sc.nextInt();
		for(int i=1;i<=a;i++)
		{
			tot=tot+i;
		}
		System.out.println();
		System.out.println("1부터 "+a+"까지의 합은 "+tot+"입니다");
		System.out.println("======================");
		int sum=0;
		int su;
		System.out.println("합계를 구할 숫자는?");
		su=sc.nextInt();
		for(int i=1;i<=su;i++)
			sum+=i; //sum=sum+i
		System.out.println("1부터 "+su+"까지의 합은="+sum);
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		//sumTest1();
		//sumTest2();
		//sumTest3();
		//quiz1();
		//quiz2();
	}

}
