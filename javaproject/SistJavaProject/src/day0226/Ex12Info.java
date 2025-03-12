package day0226;

public class Ex12Info {

	private String name;
	private int age;
	
	//setter,getter메서드를 worker 메서드라고 한다
	//setter메서드는 수정을 목적으로 사용 _ set변수명
	
	public void setName(String name) //void는 리턴이 없다라는 의미
	{
		this.name=name; //이름이 같으므로 인스턴스 자신을 가르키는 this 
		//name=myname; //this는 붙혀도 되고 이름이 달라서 구분되므로 안붙혀도 된다
	}
	
	public void setAge(int age)
	{
		this.age=age;
	}
	
	
	//getter메서드는 조회할 목적으로 사용 _ get변수명_return결과값으로 지정
	public String getName()
	{
		return name;
	}
	
	public int getAge()
	{
		return age;
	}
}
