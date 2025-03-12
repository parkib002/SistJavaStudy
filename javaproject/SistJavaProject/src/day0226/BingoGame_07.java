package day0226;

import java.util.Scanner;

public class BingoGame_07 {

	public static void main(String[] args) {
		// 반복문 안에서 엔터를 누르면 다음 난수가 나오도록 합니다(종료:Q or q)
		/*
		 * 3행3열의 다차원 배열을 생성 후 1~3사이의 난수를 발생
		 * 각각의 가로,각각의 세로,대각선을 비교해서 같은 값이 나오면 빙고:2개 출력
		 * 없으면 꽝!!! 출력
		 */
		
		Scanner sc=new Scanner(System.in);
		int [][] puzzle=new int[3][3];
		int bingo=0;
		
		while(true)
		{
			//2차원배열에 1~3사이의 난수 발생
			for(int i=0;i<puzzle.length;i++)
			{
				for(int j=0;j<puzzle[i].length;j++)
				{
					puzzle[i][j]=(int)(Math.random()*3)+1; //1~3
				}
			}
			
			//출력
			for(int i=0;i<puzzle.length;i++)
			{
				for(int j=0;j<puzzle[i].length;j++)
				{
					System.out.printf("%3d",puzzle[i][j]);
				}
				System.out.println();
			}
			
			bingo=0;
			
			//가로세로대각선 비교해서 같은 숫자 나오면 빙고
			//없으면 꽝
			for(int i=0;i<puzzle.length;i++)
			{
				//가로
				if(puzzle[i][0]==puzzle[i][1] && puzzle[i][1]==puzzle[i][2])
					bingo++;
				
				//세로
				if(puzzle[0][i]==puzzle[1][i] && puzzle[1][i]==puzzle[2][i])
					bingo++;
			}
			
			//대각선 /
			if(puzzle[0][2]==puzzle[1][1] && puzzle[1][1]==puzzle[2][0])
				bingo++;
			//대각선 \
			if(puzzle[0][0]==puzzle[1][1] && puzzle[1][1]==puzzle[2][2])
				bingo++;
			
			//빙고출력
			if(bingo==0)
				System.out.println("꽝!!!");
			else
				System.out.println("빙고^^: "+bingo+"개");
			
			//종료
			System.out.println("엔터를 누르면 다음 난수가 나옵니다(종료:Q)");
			/*String ans=sc.nextLine();
			
			if(ans.equalsIgnoreCase("q"))
			{
				System.out.println("게임을 종료합니다");
				break;
			}*/
			
			if(sc.nextLine().equalsIgnoreCase("q"))
			{
				System.out.println("프로그램 종료!!");
				break;
			}	
		}

	}
}
