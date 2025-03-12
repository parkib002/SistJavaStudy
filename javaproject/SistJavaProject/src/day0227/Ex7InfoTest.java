package day0227;

class YourInfo{
	
	String myName;
	static String Message;
	
	public YourInfo(String a)
	{
		System.out.println("주민명: "+a);
	}
}

public class Ex7InfoTest {

	private String city; //사는지역
	int age; //나이
	
	public Ex7InfoTest(String b)
	{
		System.out.println("지역: "+b);
	}
	
	public Ex7InfoTest(int c)
	{
		System.out.println("나이: "+c);
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		YourInfo.Message="행복하게 살자";
		
		System.out.println("[개인정보]");
		YourInfo a2=new YourInfo("민영기");
		System.out.println(YourInfo.Message);
		Ex7InfoTest b2=new Ex7InfoTest("대전");
		Ex7InfoTest c2=new Ex7InfoTest(27);

	}

}
