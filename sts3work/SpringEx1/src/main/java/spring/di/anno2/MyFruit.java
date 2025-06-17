package spring.di.anno2;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MyFruit {

	//@Autowired //error: 매칭할 Fruit이 2개라서 에러가 남..정확한 이름을 쓰는 @Resource필요
	@Resource(name = "pmgo")
	Fruit fruit;
	
	public void writeFruit() {
		
		System.out.println("***내가 좋아하는 과일은***");
		fruit.writeFruitName();
	}
}
