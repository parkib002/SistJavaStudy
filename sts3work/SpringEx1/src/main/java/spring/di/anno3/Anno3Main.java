package spring.di.anno3;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Anno3Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		ApplicationContext app=new ClassPathXmlApplicationContext("anno.xml");
		
		MySqlController msc=(MySqlController)app.getBean("mySqlController");
		
		msc.insert("��â��");
		msc.select("��â��");
		msc.delete("1");
	}

}
