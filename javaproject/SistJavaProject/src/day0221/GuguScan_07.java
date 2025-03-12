package day0221;

import java.util.Scanner;

public class GuguScan_07 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc=new Scanner(System.in);
		
		int dan;
		
		while(true)
		{
			System.out.println("원하는 구구단 입력하시오(종료:0)");
			dan=sc.nextInt();
			
			if(dan==0)
			{
				System.out.println("프로그램종료!!");
				break;
			}
			
			//잘못 입력된 경우..2~9까지만 입력 가능하게
			if(dan<2 || dan>9)
			{
				System.out.println("잘못입력했어요 \n2~9단까지만 입력해주세요");
				continue;
			}
	
			System.out.println("["+dan+"]\n");
			
			for(int j=1;j<=9;j++)
			{
				System.out.println(dan+"X"+j+"="+dan*j);
			}
			System.out.println();
		}

	}

}
