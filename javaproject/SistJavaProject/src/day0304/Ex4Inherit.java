package day0304;

class shop{
	
	private String sangpum;
	private int su;
	
	//디폴트 생성자(상품명=딸기,수량=50
	public shop() {
		sangpum="딸기";
		su=50;
	}
	
	//명시적 생성자
	public shop(String sangpum,int su) {
		this.sangpum=sangpum;
		this.su=su;
	}
	
	//출력 writeShop(상품명: 쵸코파이
	//				수량: 100개)
	public void writeShop()
	{
		System.out.println("상품명: "+sangpum);
		System.out.println("수량: "+su);
	}
}
/////////////////Shop을 상속 받는다, 생성자 2개와 메소드 하나도 완성한다
class Myget extends shop{
	
	private int price;
	
	public Myget()
	{
		price=2500;
	}
	
	public Myget(String sangpum,int su,int price)
	{
		super(sangpum,su);
		this.price=price;
	}
	
	@Override
	public void writeShop() {
		System.out.println("단가: "+price);
		super.writeShop();
	}
}
//////////////////2개의 객체를 생성 후 출력한다 1.디폴트 생성자로 출력 2.인자있는 생성자로 출력
public class Ex4Inherit {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Myget a=new Myget();
		a.writeShop();
		
		Myget b=new Myget("사과", 2000, 500);
		b.writeShop();
		
	}

}
