package boot.data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.BoardDto;

@Mapper
public interface BoardMapperInter {

	public int getTotalCount(Map<String, String> map);
	
	public void insertBoard(BoardDto dto);
	
	public int getMaxNum();
	
	public List<BoardDto> getList(Map<String, Object> map);
	
	public BoardDto getData(String num);

	public void updateReadCount(String num);
}
