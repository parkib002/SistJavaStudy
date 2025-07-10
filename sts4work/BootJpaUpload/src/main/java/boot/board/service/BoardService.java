package boot.board.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import boot.board.dao.BoardDao;
import boot.board.dto.BoardDto;
import jakarta.servlet.http.HttpSession;

@Service
public class BoardService implements BoardServiceInter {

	@Autowired
	BoardDao dao;
	
	@Override
	public void insertBoard(BoardDto dto, MultipartFile upload, HttpSession session) {

		//업로드 경로
		String path=session.getServletContext().getRealPath("/save");
		
		System.out.println(path);
		
		//파일명 생성
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		
		String fileName=sdf.format(new Date())+"_"+upload.getOriginalFilename();
		
		//dto에 파일명 저장
		if(upload.isEmpty())
		dto.setPhoto("no");
		
		else {
		dto.setPhoto(fileName);
		
		//실제 파일 업로드
		try {
			upload.transferTo(new File(path+"\\"+fileName));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		
		dao.insertBoard(dto);
	}

	@Override
	public List<BoardDto> getAllDatas() {
		
		return dao.getAllDatas();
	}

	@Override
	public BoardDto getOneData(long num) {
		
		return dao.getOneData(num);
	}

	@Override
	public void updateBoard(BoardDto dto,MultipartFile upload,HttpSession session) {
		
		//업로드 경로
		String path = session.getServletContext().getRealPath("/save");

		//이전 사진 삭제
		String old_photo=dao.getOneData(dto.getNum()).getPhoto();
		
		if(!"no".equals(old_photo) && !upload.isEmpty()) {
		File file=new File(path+"\\"+old_photo);
		file.delete();
		}
		
		if(!upload.isEmpty()) {
		// 파일명 생성
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");

		String fileName = sdf.format(new Date()) + "_" + upload.getOriginalFilename();

			dto.setPhoto(fileName);

			// 실제 파일 업로드
			try {
				upload.transferTo(new File(path + "\\" + fileName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			dto.setPhoto(old_photo);
		}
		dao.updateBoard(dto);
	}

	@Override
	public void deleteBoard(long num,HttpSession session) {
		
		String path=session.getServletContext().getRealPath("/save");
		
		String photo=dao.getOneData(num).getPhoto();
		
		File file=new File(path+"\\"+photo);
		file.delete();
		
		dao.deleteBoard(num);
	}

	@Override
	public void deleteFile(String path, String oldFileName) {
		// TODO Auto-generated method stub
		
	}

}
