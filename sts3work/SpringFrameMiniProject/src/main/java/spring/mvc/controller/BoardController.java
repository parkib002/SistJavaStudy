package spring.mvc.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.dao.BoardDao;
import spring.mvc.dto.BoardDto;

@Controller
public class BoardController {
	
	@Autowired
	BoardDao dao;
	
	@GetMapping("/board/list")
	public ModelAndView blist(
			@RequestParam(value = "currentPage",
					defaultValue = "1") int currentPage)
	{
		ModelAndView model=new ModelAndView();
		
		int totalCount=dao.getTotalCount();
		
		int perPage=5; //한페이지에 보여질 글의 개수
		int perBlock=5; //한블럭당 보여질 페이지의 개수
		int startNum; //db에서 가져올 글의 시작번호(mysql:0 오라클:1번)
		int startPage; //각 블럭당 보여질 시작 페이지
		int endPage; //각 블럭당 보여질 끝 페이지
		int totalPage; //총 페이지
		int no; //각 페이지당 출력할 시작번호

		//총 페이지수를 구한다
		//총 글의 개수/한 페이지당 보여질 개수로 나눔(7/5=1)
		//나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2페이지가 필요)
		totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
		
		//각 블럭당 보여질 시작 페이지
		//perBlock=5일 경우 현재 페이지가 1~5 시작1, 끝5
		//만약 현재 페이지가 13일 경우는 시작11, 끝15
		startPage=(currentPage-1)/perBlock*perBlock+1;
		endPage=startPage+perBlock-1;
		
		//총 페이지가 23개일 경우 마지막 블럭은 25가 아니라 23이다
		if(endPage>totalPage)
			endPage=totalPage;
		
		//각 페이지에서 보여질 시작 번호
		//예: 1페이지-->0 2페이지-->5 3페이지-->10
		startNum=(currentPage-1)*perPage;
		
		//각 페이지당 출력할 시작번호
		//예를들어 총 글 개수가 23 1페이지:23 2페이지:18 3페이지:13...
		no=totalCount-(currentPage-1)*perPage;
		
		List<BoardDto> list=dao.getList(startNum, perPage);
		
		model.addObject("list", list);
		model.addObject("startPage", startPage);
		model.addObject("endPage", endPage);
		model.addObject("totalPage", totalPage);
		model.addObject("totalCount", totalCount);
		model.addObject("no", no);
		model.addObject("currentPage", currentPage);
		
		model.setViewName("/board/boardList");
		
		return model;
	}
	
	//글쓰기 폼으로 이동
	@GetMapping("/board/form")
	public ModelAndView form1(
			@RequestParam(defaultValue = "0") int num,
			@RequestParam(defaultValue = "0") int regroup,
			@RequestParam(defaultValue = "0") int restep,
			@RequestParam(defaultValue = "0") int relevel,
			@RequestParam(defaultValue = "1") int currentPage)
	{

		ModelAndView model=new ModelAndView();
		
		//답글일때만 넘오는 값(4개)
		//새글일때는 모두 null이므로 defaultValue값으로 전달
		model.addObject("num", num);
		model.addObject("regroup", regroup);
		model.addObject("restep", restep);
		model.addObject("relevel", relevel);
		model.addObject("currentPage", currentPage);
		
		//제목에 답글일 경우 해당 제목 넣어보기
		/*
		 * String subject=""; if(num>0) {
		 * 
		 * }
		 */
		
		model.setViewName("/board/writeForm");
		
		return model;
	}
	
	//insert
	@PostMapping("/board/insert")
	public String insert(@ModelAttribute BoardDto dto,
			@RequestParam ArrayList<MultipartFile> upload,
			HttpSession session)
	{
		//업로드할 실제 경로
		String path=session.getServletContext().getRealPath("/WEB-INF/photo");
		//System.out.println(path);
	
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		
		String photo="";
		
		//사진선택 안하면 "no", 하면 날짜 붙인 파일에 db에는 ,로 나열
		
		if(upload.get(0).getOriginalFilename().equals("")) 
			photo="no";
		
		else {
			
			for(MultipartFile f:upload)
			{
				String fname=sdf.format(new Date())+"_"+f.getOriginalFilename();
				photo+=fname+",";
				
				//업로드
				try {
					f.transferTo(new File(path+"\\"+fname));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			//photo마지막 컴마 제거
			photo=photo.substring(0, photo.length()-1);
		}
		
		//dto에 photo넣어주기
		dto.setPhoto(photo);
		
		//dao insert
		dao.insertBoard(dto);
		
		return "redirect:list";
	}
	
	//제목 누르면 디테일 페이지로 가기
	@GetMapping("/board/content")
	public ModelAndView content(
			@RequestParam int num,
			@RequestParam int currentPage)
	{
		ModelAndView model=new ModelAndView();
		
		//조회수
		dao.updateReadCount(num);
		
		//dto
		BoardDto dto=dao.getOneData(num);
		
		model.addObject("dto", dto);
		model.addObject("currentPage", currentPage);
		
		model.setViewName("/board/content");
		
		return model;
	}
		
}
