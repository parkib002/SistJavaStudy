package spring.di.anno2;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Anno2Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		ApplicationContext context=new ClassPathXmlApplicationContext("anno.xml");
		
		Fruit tm=(Tmanggo)context.getBean("tmgo");
		
		tm.writeFruitName();
		
		MyFruit mf=(MyFruit)context.getBean("myFruit");
		
		mf.writeFruit();
		
		Fruit pm=(PhiManggo)context.getBean("pmgo");
		
		pm.writeFruitName();
	}

}
