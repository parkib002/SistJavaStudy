package day0224;

public class ForReviewStar_01 {

	public static void main(String[] args) {
		
		System.out.println("**다중 For문으로 star(*)출력하기**");
		
		//5행5열로 star 출력
		for(int i=1;i<=5;i++) //행갯수
		{
			for(int j=1;j<=5;j++)//열갯수
			{
				System.out.print("*");
			}
			System.out.println();
		}
		
		//5행5열 star (1행:1열 2행:2열까지....)
		for(int i=1;i<=5;i++) //행갯수
		{
			for(int j=1;j<=i;j++)//열갯수(i값 만큼만 반복)
			{
				System.out.print("*");
			}
			System.out.println();
		}
		
		//5행5열 star :2번과 반대로(i가 1일때 5번,2일때 4번...5일대 1번)
		
		for(int i=1;i<=5;i++) //행갯수
		{
			for(int j=5;j>=i;j--)//열갯수
			{
				System.out.print("*");
			}
			System.out.println();
		}
		
	}

}
