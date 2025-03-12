package day0219;

import java.util.Scanner;

public class ReviewScan_01 {

	public static void main(String[] args) {

		/*
		 * 이름과 키 몸무게를 입력하면 입력한 데이터와 함께
		 * 표준몸무게: (키-100)*0.9를 출력하시오
		 * 
		 *  **손흥민님 신체정보**
		 *  키: 180cm
		 *  몸무게: 88kg
		 *  권장표준몸무게:   소수점1자리 kg으로 나타낼 것
		 *  
		 */
		
		Scanner sc=new Scanner(System.in);
		
		String name;
		double height,weight,st_weight;
		
		System.out.println("이름: ");
		name=sc.nextLine();
		System.out.println("키: ");
		height=sc.nextDouble();
		System.out.println("몸무게: ");
		weight=sc.nextDouble();
		
		st_weight=(height-100)*0.9;
		
		System.out.println("**"+name+"님 신체정보**");
		System.out.println("키: "+height+"cm");
		System.out.println("몸무게: "+weight+"kg");
		System.out.printf("권장표준몸무게: %.1f kg\n",st_weight);
	
	}

}
