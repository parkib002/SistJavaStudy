package boot.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.dto.BoardAnswerDto;
import boot.data.mapper.BoardAnswerMapperInter;

@Service
public class BoardAnswerService {
	
	@Autowired
	BoardAnswerMapperInter mapper;

	public void insertAnswer(BoardAnswerDto dto)
	{
		mapper.insertAnswer(dto);
	}
	
	public List<BoardAnswerDto> getAllAnswers(String num)
	{
		return mapper.getAllAnswers(num);
	}
	
	public BoardAnswerDto getAnswer(String idx)
	{
		return mapper.getAnswer(idx);
	}
	
	public void updateAnswer(BoardAnswerDto dto)
	{
		mapper.updateAnswer(dto);
	}
	
	public void deleteAnswer(String idx)
	{
		mapper.deleteAnswer(idx);
	}
}
