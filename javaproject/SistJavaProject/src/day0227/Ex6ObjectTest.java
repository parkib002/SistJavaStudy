package day0227;

class MyDate{
	
	private int year;
	private int month;
	private int day;
	
	//명시적 생성자 (인자 3개)
	public MyDate(int y, int m, int d) {
		year=y;
		month=m;
		day=d;
	}
	
	//getter 메서드
	public int getYear()
	{
		return year;
	}
	public int getMonth() 
	{
		return month;
	}
	public int getDay()
	{
		return day;
	}
	
}
///////////////////////////////
public class Ex6ObjectTest {

	public static void main(String[] args) {
		// 파라메터에 여러분들의 출생년월일을 넣어서 출력해보세요
		
		MyDate a=new MyDate(2000, 10, 02);
		
		//출력
		//System.out.println(a.getYear()+"년"+a.getMonth()+"월"+a.getDay()+"일");
		System.out.println("년도: "+a.getYear());
		System.out.println("월: "+a.getMonth());
		System.out.println("일: "+a.getDay());

	}

}
