package day0224;

import java.util.Scanner;

public class ArrayScanSumRank_12 {

	public static void main(String[] args) {
		/*
		 * 입력할 인원수를 먼저 입력 후 그 인원수만큼 이름과 점수를 입력한 후 
		 * 입력한 데이터도 출력하고 전체 합계와 평균을 구해보자
		 * 등수를 구한다
		 */
		int inwon;
		String [] name;
		int[] score;
		int[] rank; //등수
		int tot=0;
		double avg=0;
		
		Scanner sc=new Scanner(System.in);
		System.out.println("인원수를 입력하세요");
		inwon=Integer.parseInt(sc.nextLine());
		
		//인원수만큼 배열갯수 할당
		name=new String[inwon];
		score=new int[inwon];
		rank=new int[inwon];
		
		//인원수만큼 이름,점수를 입력
		for(int i=0;i<inwon;i++)
		{
			System.out.println(i+1+"번지 이름?");
			name[i]=sc.nextLine();
			System.out.println(i+1+"번지 점수");
			score[i]=Integer.parseInt(sc.nextLine());
			//총점
			tot+=score[i];
		}
		
		//등수구하기(다중for문)
		for(int i=0;i<inwon;i++)
		{
			//비교되는 대상이 점수가 높으면 i번지의 등수를 1증가시킨다
			rank[i]=1;
			for(int j=0;j<inwon;j++)
			{
				if(score[i]<score[j])
				rank[i]++;
			}
		}
		
		//평균
		avg=(double)tot/inwon;
		
		//출력
		System.out.println("------------------------------");
		System.out.println("번호\t이름\t점수\t등수");
		System.out.println("------------------------------");
		
		for(int i=0;i<inwon;i++)
		{
			System.out.println(i+1+"\t"+name[i]+"\t"+score[i]+"\t"+rank[i]);
		}
		System.out.println("------------------------------");
		System.out.println("총점: "+tot);
		System.out.println("평균: "+avg);
	}

}
