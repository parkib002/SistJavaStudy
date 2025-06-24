package spring.mvc.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.dto.MemberDto;

@Repository
public class MemberDao implements MemberDaoInter {

	@Autowired
	SqlSession session;
	
	@Override
	public int getIdCount(String id) {
	
		return session.selectOne("idCheckOfMember", id);
	}

	@Override
	public void insertMember(MemberDto dto) {
		
		session.insert("insertOfMember", dto);
	}

}
