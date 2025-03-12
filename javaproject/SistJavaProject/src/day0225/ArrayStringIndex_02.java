package day0225;

import java.util.Scanner;

public class ArrayStringIndex_02 {

	public static void main(String[] args) {
		// 이름을 입력하여 몇번째에 있는지 아니면 우리반 학생이 아닌지 검색해 볼 것
		// 반복해서 검색하다가 끝 이라고 하면 프로그램을 종료할 것!!!
		String [] stu= {"손현정","박호준","유혜지","원주희","김기범","이창연","박용희","김민규","조태민","공찬혁"};
		boolean b;
		String stuName;
		
		Scanner sc=new Scanner(System.in);
		
		while(true)
		{
			System.out.println("이름을 입력하시오");
			stuName=sc.nextLine();
			
			if(stuName.equals("끝"))
			{
				System.out.println("프로그램을 종료합니다");
				break;
			}
			b=false; //반복문 안에서 찾을시 true변경
			
			for(int i=0;i<stu.length;i++)
			{
				if(stuName.equals(stu[i]))
				{
					b=true;
					System.out.println(i+1+"번째 학생입니다");
				}
			}
			
			if(!b)
			{
				System.out.println(stuName+"은 데이터에 없습니다");
			}
		
		}
		
		
	}

}
