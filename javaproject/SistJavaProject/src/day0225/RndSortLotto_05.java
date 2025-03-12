package day0225;

import java.util.Arrays;

public class RndSortLotto_05 {

	public static void main(String[] args) {
		
		int [] lotto=new int[6];
		
		//임의의 수를 로또변수에 발생시켜서 넣어준다
		for(int i=0;i<lotto.length;i++)
		{
			lotto[i]=(int)(Math.random()*45)+1; //1~45중의 랜덤수 발생
			//System.out.println("뽑은값: "+lotto[i]);
			
			//중복처리: 현재 index(i)와 (0~i-1)비교해서 중복된 숫자가 존재하면 i--
			for(int j=0;j<i;j++)
			{
				//System.out.println(lotto[i]+"=="+lotto[j]); //직접 찍어보기
				if(lotto[i]==lotto[j])
				{
					System.out.println("중복");
					i--;
					break;
				}
			}
			 
		}
		
		//오름차순 정렬
		for(int i=0;i<lotto.length-1;i++)
		{
			for(int j=i+1;j<lotto.length;j++)
			{
				if(lotto[i]>lotto[j])
				{
					int temp=lotto[i];
					lotto[i]=lotto[j];
					lotto[j]=temp;
				}
			}
		}
		
		//Arrays.sort(lotto);
		
		//출력
		
		for(int i=0;i<lotto.length;i++)
		{
			//System.out.print(lotto[i]+"\t");
			System.out.printf("%5d",lotto[i]);
		}
		System.out.println();
	}
}
