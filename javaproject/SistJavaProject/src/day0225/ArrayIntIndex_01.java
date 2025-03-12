package day0225;

import java.util.Scanner;

public class ArrayIntIndex_01 {

	public static void main(String[] args) {
		//숫자배열 중에서 내가 입력한 숫자가 있는지 있다면 몇번째 있는지 찾아보자 0입력시 종료
		
		int [] nums= {5,11,87,56,22,47,35,98,57,88,74}; //0~10
		
		//System.out.println(nums.length);
		Scanner sc=new Scanner(System.in);
		int su;
		boolean flag; //숫자가 있는지 없는지에 대한 변수
		
		while(true)
		{
			System.out.println("검색할 숫자를 입력하세요");
			su=sc.nextInt();
			
			//종료조건
			if(su==0)
			{
				System.out.println("숫자 검색을 종료합니다");
				break;
			}
			
			flag=false; //찾으면 true(false라고 가정)
			
			//값찾기
			for(int i=0;i<nums.length;i++)
			{
				//true조건
				if(su==nums[i])
				{
					flag=true;
					System.out.println(i+1+"번째에서 검색됨");
				}
			}
			
			if(!flag)//flag==false==>실제값을 찾지 못함
			System.out.println(su+"는 데이터에 없습니다");
				
		}
	}

}
