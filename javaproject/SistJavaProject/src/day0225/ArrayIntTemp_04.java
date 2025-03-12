package day0225;

public class ArrayIntTemp_04 {

	public static void main(String[] args) {
		// 배열안의 숫자 순서를 바꾸어 출력해보기
		
		int[] arr= {5,4,9,8,1,3,6,10};
		
		//출력
		System.out.println("원래 순서 데이터 출력");
		for(int i=0;i<arr.length;i++)
		{
			System.out.print(arr[i]+"  ");
		}
		System.out.println();
		
		//거꾸로 데이터 변경
		for(int i=0;i<arr.length/2;i++)
		{
			int temp=arr[i];
			//10개일 때 0번과 9번을 바꾸는 것
			arr[i]=arr[arr.length-1-i];
			arr[arr.length-1-i]=temp;
		}
		
		System.out.println("거꾸로 데이터 출력");
		
		for(int i=0;i<arr.length;i++)
		{
			System.out.print(arr[i]+"  ");
		}
		System.out.println();
		
		
		//오름차순(1 2 3.....)
		//선택정렬: 가장 작은 숫자를 앞으로 보내자
		
		
		//기준데이터는 0번부터 끝에서 두번째까지
		for(int i=0;i<arr.length-1;i++)
		{
			//비교하는 데이터는 기준 다음값부터 끝까지
			for(int j=i+1;j<arr.length;j++)
			{
				if(arr[i]>arr[j])
				{
					int temp=arr[i];
					arr[i]=arr[j];
					arr[j]=temp;
				}
			}
		}
		
		System.out.println("오름차순 출력");
		
		for(int i=0;i<arr.length;i++)
		{
			System.out.print(arr[i]+"  ");
		}
		System.out.println();
	}

}
