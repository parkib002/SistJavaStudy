package spring.di.ex5;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class EmpMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		ApplicationContext context=new ClassPathXmlApplicationContext("appContext5.xml");
		
		Emp emp=(Emp)context.getBean("emp");
		
		emp.writeEmp();
	}

}
