package day0221;

import java.util.Scanner;

public class ForSumScan_08 {

	public static void main(String[] args) {
		// 점수를 3번 반복해서 입력 후 합계를 구하시오(1~100까지 입력할 것!!!)
		// 1번째 점수를 입력하세요(1~100)
		
		Scanner sc=new Scanner(System.in);
		
		int sum=0;
		int score;
		
		for(int i=1;i<=3;i++)
		{
			System.out.println(i+"번째 점수를 입력하세요(1~100)");
			score=sc.nextInt();
			
			if(score<0 || score>100)
			{
				System.out.println("잘못입력된 점수입니다\n1~100까지 다시입력바람");
				i--;//잘못된 반복문이므로 반복횟수에서 하나 빼준다
				continue;
			}
			
			sum+=score;
		}
		System.out.println("====================");
		System.out.println("총합계: "+sum);
	}

}
