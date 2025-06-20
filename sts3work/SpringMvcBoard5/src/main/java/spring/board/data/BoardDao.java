package spring.board.data;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

//dao를 자동으로 xml에 bean등록
@Repository
public class BoardDao implements BoardDaoInter{

	@Autowired
	private SqlSession session;
	
	@Override
	public int getTotalCount() {
		
		return session.selectOne("selectCountOfBoard");
	}
	
	@Override
	public void insertBoard(BoardDto dto) {
		
		session.insert("insertOfBoard",dto);
	}		
	
	@Override
	public List<BoardDto> getAllDatas(){
		
		return session.selectList("selectAllOfBoard");
	}
	
	@Override
	public BoardDto getData(String num) {
		
		return session.selectOne("selectOneOfBoard",num);
	}

	@Override
	public void updateBoard(BoardDto dto) {

		session.update("updateOfBoard",dto);
	}

	@Override
	public void deleteBoard(String num) {
		
		session.delete("deleteOfBoard",num);
	}
	
}


