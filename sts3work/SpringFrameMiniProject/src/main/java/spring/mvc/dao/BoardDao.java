package spring.mvc.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.dto.BoardDto;

@Repository
public class BoardDao implements BoardDaoInter {
	
	@Autowired
	SqlSession session;

	@Override
	public int getTotalCount() {
		
		return session.selectOne("TotalCountOfBoard");
	}

	@Override
	public int getMaxNum() {
		
		return session.selectOne("MaxNumOfBoard");
	}

	@Override
	public void updateRestep(int regroup, int restep) {
		
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		
		map.put("regroup", regroup);
		map.put("restep", restep);
		
		session.update("UpdateStepOfBoard", map);
	}

	@Override
	public void insertBoard(BoardDto dto) {
		
		int num=dto.getNum(); //0: 새글  1보다 큰 값: 답글
		int regroup=dto.getRegroup();
		int restep=dto.getRestep();
		int relevel=dto.getRelevel();

		if(num==0) //새글
		{
			regroup=getMaxNum()+1;
			restep=0;
			relevel=0;
		}else {
			//같은 그룹중 전달 받은 restep보다 큰 글들은 모두 +1
			this.updateRestep(regroup, restep);
			
			//전달 받은 step, level +1
			restep++;
			relevel++;
		}
		
		//바뀐 값들을 다시 dto에 담는다
		dto.setRegroup(regroup);
		dto.setRestep(restep);
		dto.setRelevel(relevel);
		
		//insert
		session.insert("InsertOfBoard", dto);
	}

	@Override
	public List<BoardDto> getList(int start, int perpage) {
		
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		
		map.put("start", start);
		map.put("perpage", perpage);
		
		return session.selectList("SelectPagingOfBoard", map);
	}

	@Override
	public BoardDto getOneData(int num) {
		
		return session.selectOne("SelectOneOfBoard", num);
	}

	@Override
	public void updateReadCount(int num) {
		
		session.update("UpdateReadCountOfBoard", num);
	}

	@Override
	public void updateBoard(BoardDto dto) {
		
		session.update("UpdateOfBoard", dto);
	}

	@Override
	public void deleteBoard(int num) {

		session.delete("DeleteOfBoard", num);
	}

	@Override
	public List<BoardDto> getAllList() {
		
		return session.selectList("SelectAllOfBoard");
	}

	@Override
	public List<BoardDto> getAllPhoto() {

		return session.selectList("SelectAllPhotoOfBoard");
	}

}
