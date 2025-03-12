package day0221;

public class GuguGaro_11 {

	public static void main(String[] args) {
		// 구구단 콘솔창 가로로 출력
		/* [2단]     [3단]   -단일 for문
		 * 
		 * 2X1=2	3X1=3   -다중 for문
		 * 2X2=4	3X2=6
		 */
		
		System.out.println("\t가로방향 구구단 출력");
		
		for(int dan=2;dan<=9;dan++)
		{
			System.out.print("["+dan+"단]\t");
		}
		
		System.out.println();
		for(int j=1;j<=9;j++)
		{
			for(int dan=2;dan<=9;dan++)
			{
				System.out.print(dan+"X"+j+"="+dan*j+"\t");
			}
			System.out.println();
		}
		
	}

}
