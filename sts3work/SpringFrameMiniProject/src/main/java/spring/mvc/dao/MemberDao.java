package spring.mvc.dao;

import java.util.HashMap;
import java.util.List;

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

	@Override
	public List<MemberDto> getAllMembers() {
		
		return session.selectList("AllListOfMember");
	}

	@Override
	public int loginCheck(String id, String pass) {
		
		HashMap<String, String> map=new HashMap<String, String>();
		
		map.put("id", id);
		map.put("pass", pass);
		
		return session.selectOne("loginCheckOfMember", map);
	}

	@Override
	public MemberDto getOneMember(String num) {
		
		return session.selectOne("selectOneOfMember", num);
	}

	@Override
	public int passCheck(String num, String pass) {
		
		HashMap<String, String> map=new HashMap<String, String>();
		
		map.put("num", num);
		map.put("pass", pass);
		
		return session.selectOne("passCheckOfMember", map);
	}

	@Override
	public void updateMember(MemberDto dto) {
		
		session.update("updateOfMember", dto);
	}

	@Override
	public void deleteMember(String num) {
		
		session.delete("deleteOfMember", num);
	}

}
