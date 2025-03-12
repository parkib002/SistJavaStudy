package day0219;

import java.util.Scanner;

public class Quiz0219_12 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner sc=new Scanner(System.in);
		
		int a;
		
		System.out.println("숫자를 입력하시오");
		a=sc.nextInt();
		System.out.println("***if문***");
		if(a%2==1)
			System.out.println(a+"는 홀수");
		else
			System.out.println(a+"는 짝수");
		
		System.out.println("***삼항연산자***");
		System.out.print(a+"는 ");
		System.out.println(a%2==1?"홀수":"짝수");
		
		//switch문으로
		System.out.println("***switch문으로***");
		
		switch(a%2)
		{
		case 0:
			System.out.println(a+"는 짝수");
			break;
		case 1:
			System.out.println(a+"는 홀수");
			break;
		}
	
	
		
		
			
		
		
		
		
		

				
	
		
		
		
		
	
		
			
		
		
		
		
		
		
		
		
			
	}

}
