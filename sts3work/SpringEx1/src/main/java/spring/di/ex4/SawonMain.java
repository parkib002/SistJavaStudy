package spring.di.ex4;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class SawonMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		ApplicationContext context=new ClassPathXmlApplicationContext("appContext4.xml");
		
		Sawon sawon=(Sawon)context.getBean("sawon");
		
		sawon.writeData();
	}

}
