package day0220;

import java.util.Scanner;

public class ReviewIfScan_01 {

	public static void main(String[] args) {
		/*
		 * 이름을 입력하세요
		 * 홍길동
		 * 정보처리기사 3과목의 점수를 입력하세요
		 * 88 77 39
		 * =======================
		 * 3과목의 평균: **.**
		 * =======================
		 * **합격조건: 평균이 60점 이상이고 각 과목이 모두 40점 이상이면 합격**
		 * =======================
		 * 홍길동님은 불합격입니다
		 */
		
		Scanner sc=new Scanner(System.in);
		
		String name;
		
		double a,b,c,e;
		
		System.out.println("이름을 입력하세요");
		name=sc.nextLine();
		System.out.println("정보처리기사 3과목의 점수를 입력하세요");
		a=sc.nextInt(); 
		b=sc.nextInt(); 
		c=sc.nextInt();
		
		System.out.println("=================");
		
		e=(a+b+c)/3.0;
		
		System.out.printf("3과목의 평균: %.2f점\n",e);
		
		System.out.println("=================");
		System.out.println("**합격조건: 평균이 60점 이상이고 각 과목이 모두 40점 이상이면 합격**");
		System.out.println("=================");
		
		if(a>=40&&b>=40&&c>=40&&e>=60)
			System.out.println(name+"님은 합격입니다");
		else
			System.out.println(name+"님은 불합격입니다");
	}

}
