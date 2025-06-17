package spring.di.anno;

import org.springframework.stereotype.Component;

//@Component : XML ���� ���� �ڵ� �� ��� @Component("name") �̸� ���� ����
//()���� ������ �����ϸ� Ŭ�������̰� �� �� �ѱ��ڴ� �ҹ��ڷ�(myDao)
@Component
public class MyDao implements DaoInter{

	@Override
	public void insertData(String str) {
		// TODO Auto-generated method stub
		System.out.println(str+"_�����͸� db�� �߰� ����!!");
	}

	@Override
	public void deleteData(String num) {
		// TODO Auto-generated method stub
		System.out.println(num+"�� �ش��ϴ� ������ ���� ����!!");
	}

}
