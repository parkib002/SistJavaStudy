package day0218;

import java.util.Calendar;
import java.util.Scanner;

public class QuizLast_13 {

	public static void main(String[] args) {
		/*
		 * 키보드로 입력하고 출력을 다음과 같이 해보세요 변수는 마음대로 어울리게 줄 것
		 * 
		 * 당신의 이름은?
		 * 김사랑
		 * 당신의 출생년도는?
		 * 1997 당신의 직업은?
		 * 연예인 
		 * ===============================
		 * 김사랑님은 1997년생이며 28세입니다. 직업은 연예인입니다.
		 */

		Scanner sc = new Scanner(System.in);
		Calendar cal = Calendar.getInstance();

		String name, job;
		int birthYear, myAge;
		int curYear = cal.get(cal.YEAR);
		

		System.out.println("당신의 이름은?");
		name = sc.nextLine();
		System.out.println("당신의 출생년도는?");
		birthYear = Integer.parseInt(sc.nextLine());
		System.out.println("당신의 직업은?");
		job = sc.nextLine();
		
		myAge=curYear-birthYear;
	
		System.out.println("==========================================================");
		System.out.println(name + "님은 " + birthYear + "년생이며 " + myAge + "세입니다." + " 직업은 " + job + "입니다.");
	}

}
