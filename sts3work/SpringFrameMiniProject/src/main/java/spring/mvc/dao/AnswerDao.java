package spring.mvc.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.dto.AnswerDto;

@Repository
public class AnswerDao implements AnswerDaoInter {
	
	@Autowired
	SqlSession session;
	
	@Override
	public void insertAnswer(AnswerDto dto) {
		
		session.insert("InsertOfAnswer", dto);
	}

	@Override
	public List<AnswerDto> getAllAnswer(int num) {
		
		return session.selectList("SelectAllOfAnswer", num);
	}

	@Override
	public int getCheckPass(int idx, String pass) {
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		
		map.put("idx", idx);
		map.put("pass", pass);
		
		return session.selectOne("PassCheckOfAnswer", map);
	}

	@Override
	public void deleteAnswer(int idx) {
		
		session.delete("DeleteOfAnswer", idx);
	}

}
