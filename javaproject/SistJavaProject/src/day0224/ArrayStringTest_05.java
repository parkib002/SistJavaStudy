package day0224;

public class ArrayStringTest_05 {

	public static void main(String[] args) {
		// 문자배열 선언 및 초기화
		String [] str;
		str=new String[5]; //5개의 주소값 할당 초기값 지정 안해도 null로 초기화
		
		//초기값 지정 안하고 출력
		for(int i=0;i<str.length;i++)
		{
			System.out.println(i+":"+str[i]);
		}
		
		//초기값 지정
		str[0]="원주희";
		str[1]="유혜지";
		str[2]="조태민";
		str[3]="박용희";
		str[4]="김희찬";
		
		//초기값 지정출력
		for(int i=0;i<str.length;i++)
		{
			System.out.println((i+1)+":"+str[i]);
		}
		
		//for~each로 출력
		for(String s:str)
		{
			System.out.println(s);
		}
	}

}
