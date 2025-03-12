package day0225;

public class ArrayStringTemp_07 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		String [] names= {"이효리","유재석","하하","김영웅"};
		int [] ages= {34,52,48,38};
		
		
		System.out.println("정렬전 출력");
		System.out.println("번호\t이름\t나이\t");
		for(int i=0;i<names.length;i++)
		{
			System.out.println(i+1+"\t"+names[i]+"\t"+ages[i]+"\t");
		}
		System.out.println();
		
		//이름의 오름차순
		//정렬 for문 작성
		
		//문자열 오름차순
		for(int i=0;i<names.length-1;i++)
		{
			for(int j=i+1;j<names.length;j++)
			{
				//a.compareTo(b)  :a가 더 크면 양수값
				if(names[i].compareTo(names[j])>0)
				{
					String temp=names[i];
					names[i]=names[j];
					names[j]=temp;
					
					//이름 변경시 나이도 같이 변경
					int temp2=ages[i];
					ages[i]=ages[j];
					ages[j]=temp2;
					
				}
			}
		}
		
		System.out.println("이름 오름차순 정렬후 출력");
		System.out.println("번호\t이름\t나이\t");
		for(int i=0;i<names.length;i++)
		{
			System.out.println(i+1+"\t"+names[i]+"\t"+ages[i]+"\t");
		}	
	}

}
