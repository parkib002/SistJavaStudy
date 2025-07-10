package boot.board.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import boot.board.dto.BoardDto;
import jakarta.servlet.http.HttpSession;

public interface BoardServiceInter {

	public void insertBoard(BoardDto dto,MultipartFile upload,HttpSession session);
	
	public List<BoardDto> getAllDatas();
	
	public BoardDto getOneData(long num);
	
	public void updateBoard(BoardDto dto,MultipartFile upload,HttpSession session);
		
	public void deleteBoard(long num,HttpSession session);
	
	//파일삭제
	public void deleteFile(String path,String oldFileName);
}
