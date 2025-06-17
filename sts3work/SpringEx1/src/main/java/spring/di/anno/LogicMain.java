package spring.di.anno;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class LogicMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		ApplicationContext context=new ClassPathXmlApplicationContext("anno.xml");
		
		LogicController logic=(LogicController)context.getBean("logic");
		
		logic.insert("점심시간이다");
		logic.delete("3");
		
	}

}
