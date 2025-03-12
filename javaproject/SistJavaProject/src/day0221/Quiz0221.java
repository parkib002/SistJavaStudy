package day0221;

import java.util.Scanner;

public class Quiz0221 {

	public static void quiz1() {
		// TODO Auto-generated method stub
		
		Scanner sc=new Scanner(System.in);
		
		int a;
		int cnt1=0;
		int cnt2=0;
		
		for(int i=1;i<=5;i++)
		{
			System.out.print(i+":  ");
			a=sc.nextInt();
		
		if(a>0)
			cnt1++;
		else if(a<0)
			cnt2++;
	    }
		System.out.println("=============");
		System.out.println("양수갯수: "+cnt1);
		System.out.println("음수갯수: "+cnt2);
	}
	
	public static void quiz2() {
		// TODO Auto-generated method stub
         Scanner sc=new Scanner(System.in);
		
		int a;
		int cnt1=0;
		int cnt2=0;
		int cnt3=0;
		
		while(true)
		{	
			System.out.print("나이를 입력하시오: ");
			a=sc.nextInt();
		
			if(a==0)
				break;
			
			if(a>=50)
				cnt1++;
			else if(a>=30&&a<50)
				cnt2++;
			else
				cnt3++;
		}
		
		System.out.println("================");
		System.out.println("50세이상: "+cnt1);
		System.out.println("30세이상: "+cnt2);
		System.out.println("그이외: "+cnt3);
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//quiz1();
		//quiz2();
	}

}
