package day0226;

public class SelectionSort_01 {

	public static void main(String[] args) {
		// 그냥 출력 먼저하고 오름차순 정렬해서 출력해보세요
		//0:10
		//1:2
		int [] data= {10,2,9,6,4,7,2,3};
		
		System.out.println("일반출력");
		
		for(int i=0;i<data.length;i++)
		{
			System.out.print(i+":"+data[i]+"  ");
		}
		
		System.out.println();
		
		for(int i=0;i<data.length-1;i++)
		{
			for(int j=i+1;j<data.length;j++)
			{
				if(data[i]>data[j])
				{
					int temp=data[i];
					data[i]=data[j];
					data[j]=temp;
				}
			}
		}
		
		System.out.println("오름차순 출력");
		for(int i=0;i<data.length;i++)
		{
			System.out.print(i+":"+data[i]+"  ");
		}

	}

}
