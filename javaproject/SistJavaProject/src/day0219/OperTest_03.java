package day0219;

import java.util.Scanner;

public class OperTest_03 {

	public static void main(String[] args) {
		// 산술연산자
		
		Scanner sc=new Scanner(System.in);
		int x,y;
		
		System.out.println("두 수를 입력해주세요");
		x=sc.nextInt();
		y=sc.nextInt();

		
		//산술연산자로 출력
		System.out.println("더하기="+(x+y));
		System.out.println("빼기="+(x-y));
		System.out.println("곱하기="+(x*y));
		System.out.println("나누기="+(double)x/y);
		System.out.println("나머지="+(x%y));
		
	}

}
