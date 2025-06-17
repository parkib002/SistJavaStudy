package spring.di.anno;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("logic")
public class LogicController {

	//@Autowired: �ڵ����� �Ȱ��� �̸��� ���� ã�Ƽ� �������ش�. (Ÿ������ ã��)
	@Autowired
	DaoInter daoInter;
	
	//������
	public LogicController(MyDao dao) {
		
		this.daoInter=dao;
	}
	
	//insert
	public void insert(String str) {
		
		daoInter.insertData(str);
	}
	
	//delete
	public void delete(String num) {
		
		daoInter.deleteData(num);
	}
}
