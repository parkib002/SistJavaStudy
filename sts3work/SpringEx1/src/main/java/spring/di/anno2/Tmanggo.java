package spring.di.anno2;

import org.springframework.stereotype.Component;

@Component("tmgo")
public class Tmanggo implements Fruit{

	@Override
	public void writeFruitName() {
		// TODO Auto-generated method stub
		System.out.println("ÅÂ±¹¸Á°í");
	}

}
