package boot.data.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;

import boot.data.dto.BoardDto;
import boot.data.mapper.BoardMapperInter;
import jakarta.servlet.http.HttpSession;

@Service
public class BoardService {

	@Autowired
	BoardMapperInter mapper;
	
	@Autowired
	MemberService mservice;
	
	public int getTotalCount(String searchcolumn,String searchword)
	{
		Map<String, String> map=new HashMap<>();
		
		map.put("searchcolumn", searchword);
		map.put("searchword", searchword);
		
		return mapper.getTotalCount(map);
	}
	
	public void insertBoard(@ModelAttribute BoardDto dto,
			HttpSession session)
	{
		String path=session.getServletContext().getRealPath("/boardsave");
		
		System.out.println(path);
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		
		if(dto.getUpload().getOriginalFilename().equals(""))
			dto.setUploadfile("no");
		else {
			String uploadfile=sdf.format(new Date())+"_"+dto.getUpload().getOriginalFilename();
			
			dto.setUploadfile(uploadfile);
			
			try {
				dto.getUpload().transferTo(new File(path+"\\"+uploadfile));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//세션에서 id가져와서 dto에 저장
		String myid=(String)session.getAttribute("myid");
		
		dto.setMyid(myid);
		
		//이름
		String name=mservice.getName(myid);
		
		dto.setName(name);
		
		mapper.insertBoard(dto);
	}
	
	public int getMaxNum()
	{
		return mapper.getMaxNum();
	}
	
	public List<BoardDto> getList(String searchcolumn,String searchword,int startnum,int perpage)
	{
		Map<String, Object> map=new HashMap<>();
		
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		map.put("startnum", startnum);
		map.put("perpage", perpage);
		
		return mapper.getList(map);
	}
	
	public BoardDto getData(String num)
	{
		return mapper.getData(num);
	}

	public void updateReadCount(String num)
	{
		mapper.updateReadCount(num);
	}
}
