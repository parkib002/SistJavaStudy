package day0219;

import java.util.Scanner;

public class IfMax_10 {

	public static void main(String[] args) {
		/*
		 * 3개의 수를 입력하시오
		 * 5
		 * 15
		 * 8
		 * ***if문***
		 * max=15
		 * ***삼항연산자***
		 * max=15
		 */

		Scanner sc=new Scanner(System.in);
		int a,b,c,max;
		
		System.out.println("3개의 수를 입력하시오");
		a=sc.nextInt();
		b=sc.nextInt();
		c=sc.nextInt();
		
		System.out.println("***if문***");
		if(a>b&&a>c)
			max=a;
		else if(b>a&&b>c)
			max=b;
		else
			max=c;
		System.out.println("max="+max);
		
		System.out.println("***삼항연산자***");
		max=a>b&&a>c?a:
			b>a&&b>c?b:c;
		
		System.out.println("max="+max);
		
		
	
				
	}

}
