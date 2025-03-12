package day0219;

import java.util.Scanner;

public class ScanIf_11 {

	public static void main(String[] args) {
		// 이름과 java,jsp,spring 점수를 입력 후
		//평균이 80이상이면 "참잘함",70이상이면 "노력하세요",70미만은 "불합격"
		//이름입력==>손흥민
		//java,jsp,spring 과목점수를 차례로 입력하세요
		//88,77,66
		//손흥민님의 시험결과
		//총점:  점
		//평균:  점(소수점1자리)
		//평가: 노력하세요
		
		Scanner sc=new Scanner(System.in);
		
		int a,b,c,d;
		double e;
		String name,res;
		
		System.out.print("이름입력==>");
		name=sc.nextLine();
		System.out.print("java,jsp,spring 과목점수를 차례로 입력하세요==>");
		a=sc.nextInt();
		b=sc.nextInt();
		c=sc.nextInt();
		
		d=a+b+c;
		e=d/3.0;
		
		res=e>=80?"참잘함":e>=70?"노력하세요":"불합격";
		
		
		System.out.println(name+"님의 시험결과");
		System.out.println("총점: "+d+"점");
		System.out.printf("평균: %.1f점\n",e);
		System.out.println("평가: "+res);
		
		

	}

}
