package day0221;

import java.util.Scanner;

public class WhileScanSumAvg_10 {

	public static void main(String[] args) {
		/*
		 * 점수(1~100)입력 받다가 0입력시 빠져나온 후 총갯수와 총점 평균 구하기
		 * 
		 * ex)
		 * 77
		 * 88
		 * -10
		 *    다시입력바람
		 * 99
		 * 110
		 *    다시입력바람
		 *    
		 * ==============================   
		 * 총갯수:3
		 * 총점:**
		 * 평균:**.**
		 */

		Scanner sc=new Scanner(System.in);
		
		int sum=0,cnt=0;
		String score;
		double avg=0;
		
		while(true)
		{
			System.out.println("점수입력");
			score=sc.nextLine();
			
			/*if(score==0)
				break;*/
			//입력한 문자의 첫글자가 q나 Q면 반복문 빠져나가기
			if(score.charAt(0)=='Q' || score.charAt(0)=='q')
				break;
			
			/*if(score<0&&score>100)
			{
				System.out.println("\t다시 입력바람");
				continue;
			}*/
			
			if(Integer.parseInt(score)<0 || Integer.parseInt(score)>100)
			{
				System.out.println("\t다시 입력바람");
				continue;
			}	

			cnt++;
			
			//sum+=score;
			sum+=Integer.parseInt(score); //정수로 변화 후 합계변수에 더하기
			
		}	
		avg=(double)sum/cnt;
		System.out.println("==================");
		System.out.println("총갯수: "+cnt);
		System.out.println("총점: "+sum);
		System.out.printf("평균: %.2f점",avg);
			
		} 
	

}
