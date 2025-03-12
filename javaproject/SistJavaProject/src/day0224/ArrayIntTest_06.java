package day0224;

public class ArrayIntTest_06 {

	public static void main(String[] args) {
		// 배열선언하면서 초기값들을 저장할 수 있다
		
		int [] arr= {8,6,11,21,99,32,100,55,99};
		
		System.out.println("arr의 갯수: "+arr.length);
		
		System.out.println("**출력방법1_for**"); //0 : 8
		for(int i=0;i<arr.length;i++)
		{
			System.out.println(i+"번지의 초기값은: "+arr[i]);
		}
		
		System.out.println("====================");
		System.out.println("**출력방법2_for~each**"); // 8
		for(int a:arr)
		{
			System.out.println(a);
		}
	}

}
