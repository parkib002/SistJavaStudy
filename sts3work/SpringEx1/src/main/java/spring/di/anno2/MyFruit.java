package spring.di.anno2;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MyFruit {

	//@Autowired //error: ��Ī�� Fruit�� 2���� ������ ��..��Ȯ�� �̸��� ���� @Resource�ʿ�
	@Resource(name = "pmgo")
	Fruit fruit;
	
	public void writeFruit() {
		
		System.out.println("***���� �����ϴ� ������***");
		fruit.writeFruitName();
	}
}
