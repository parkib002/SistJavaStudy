package day0225;

public class ArrayStringTemp_06 {

	public static void main(String[] args) {
		
		String [] stuNames= {"공찬혁","현승윤","유혜지","박용희","원주희","조태민","김민규"};
		
		System.out.println("**정렬전 출력**");
		for(int i=0;i<stuNames.length;i++)
		{
			System.out.print(stuNames[i]+"  ");
		}
		System.out.println();
		
		//오름차순 출력
		//같으면 0반환,i>j 양수반환  i<j 음수반환
		//System.out.println("a".compareTo("b")); //-
		for(int i=0;i<stuNames.length-1;i++)
		{
			for(int j=i+1;j<stuNames.length;j++)
			{
				if(stuNames[i].compareTo(stuNames[j])>0)
				{
					String temp=stuNames[i];
					stuNames[i]=stuNames[j];
					stuNames[j]=temp;
				}
			}
		}
		
		System.out.println("**정렬후 출력**");
		for(int i=0;i<stuNames.length;i++)
		{
			System.out.print(stuNames[i]+"  ");
		}
		System.out.println();
	}

}
