package day0227;

import java.util.Calendar;

class QuizMart{
	
	static String martName;
	static int cnt;
	private String name;
	private int amount;
	private int price;
	
	public void setData(String name, int amount, int price)
	{
		this.name=name;
		this.amount=amount;
		this.price=price;
	}
	
	public String getData()
	{

		cnt++;
		String t="입고물품: "+cnt+"\n=================="+"\n상점명: "+QuizMart.martName+"\n상품명: "+name+"\n수량: "+amount+"개"+"\n단가: "+price+"원";
		return t;
	}
	
}

public class QuizMartTest {

	public static void main(String[] args) {
		
		Calendar cal=Calendar.getInstance();
		QuizMart.martName="이마트 강동지점";
		System.out.println("[오늘의 입고상품("+cal.get(cal.YEAR)+"년/"+(cal.get(cal.MONTH)+1)+"월/"+cal.get(cal.DATE)+"일)]");
		System.out.println();
		QuizMart a=new QuizMart();
		a.setData("땅콩버터", 100,10000);
		System.out.println(a.getData());
		QuizMart b=new QuizMart();
		b.setData("사과", 200, 5000);
		System.out.println(b.getData());

	}

}
