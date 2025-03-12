package day0227;

import java.time.Year;
import java.util.Calendar;

class Quizshop{
	
	static String martName;
	static int cnt;
	private String name;
	private int amount;
	private int price;
	
	public void setDatas(String name, int amount, int price)
	{
		this.name=name;
		this.amount=amount;
		this.price=price;
	}
	
	public void getDatas()
	{
		cnt++;
		System.out.println("입고물품"+cnt);
		System.out.println("====================");
		System.out.println("상점명: "+martName);
		System.out.println("상품명: "+name);
		System.out.println("수량: "+amount+"개");
		System.out.println("단가: "+price+"원");
		System.out.println();
	}
	
}

public class QuizShopTest {

	public static void main(String[] args) {
		
		Calendar cal=Calendar.getInstance();
		int y=cal.get(cal.YEAR);
		int m=(cal.get(cal.MONTH)+1);
		int d=cal.get(cal.DATE);
		
		Quizshop.martName="이마트 강동지점";
		
		System.out.println("[오늘의 입고상품("+y+"년/"+m+"월/"+d+"일)]");
		System.out.println();
		Quizshop a=new Quizshop();
		a.setDatas("땅콩버터", 100, 11000);
		Quizshop b=new Quizshop();
		b.setDatas("사과", 200, 5000);
		a.getDatas();
		b.getDatas();
		
		
	}

}
