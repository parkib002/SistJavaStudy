package spring.text.quiz;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ShopMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		ApplicationContext app=new ClassPathXmlApplicationContext("anno.xml");
		
		OrderController oc=(OrderController)app.getBean("orderController");
		
		oc.orderInsert("����", 25000, "����");
		oc.orderDelete("3");
		oc.orderSelect("����", 13, "����");
	}

}
