package spring.text.quiz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class OrderController {

	@Autowired
	ShopDaoInter shopInter;
	
	int cnt=20;
	String name="홍길동";
	
	public void orderInsert(String sang,int price,String color)
	{
		shopInter.insertShop(sang, price, color);
		
		System.out.println();
		
		System.out.println(name+"님이 "+cnt+"개 주문 완료!!!");
		
		System.out.println();
	}
	
	public void orderDelete(String num)
	{
		shopInter.deleteShop(num);
		
		System.out.println();
	}
	
	public void orderSelect(String sang,int price,String color)
	{
		shopInter.selectShop(sang, price, color);
		
		System.out.println();
		
		System.out.println("주문자: "+name);
		System.out.println("주문량: "+cnt);
	}
	
}
