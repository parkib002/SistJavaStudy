package boot.data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.BoardDto;
import boot.data.service.BoardService;
import jakarta.servlet.http.HttpSession;

@Controller
public class BoardController {
	
	@Autowired
	BoardService service;
	
	@GetMapping("/board/list")
	public ModelAndView board(
			@RequestParam(value = "currentPage",defaultValue = "1") int currentPage,
			@RequestParam(value = "searchcolumn",required = false) String sc,
			@RequestParam(value = "searchword",required = false) String sw)
	{
		ModelAndView model=new ModelAndView();
		
		int totalCount=service.getTotalCount(sc, sw);
		
		int perPage=5; 
		int perBlock=5; 
		int startNum; 
		int startPage; 
		int endPage; 
		int totalPage; 
		int no; 

		totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
		
		startPage=(currentPage-1)/perBlock*perBlock+1;
		endPage=startPage+perBlock-1;
		
		if(endPage>totalPage)
			endPage=totalPage;
		
		startNum=(currentPage-1)*perPage;
		
		no=totalCount-(currentPage-1)*perPage;
		
		
		List<BoardDto> list=service.getList(sc, sw, startNum, perPage);
		
		model.addObject("list", list);
		model.addObject("startPage", startPage);
		model.addObject("endPage", endPage);
		model.addObject("totalPage", totalPage);
		model.addObject("totalCount", totalCount);
		model.addObject("no", no);
		model.addObject("currentPage", currentPage);
		
		//System.out.println("totalCount= "+totalCount);
		
		model.setViewName("board/boardList");
		
		return model;
	}
	
	@GetMapping("/board/addform")
	public String form()
	{
		return "board/writeForm";
	}
	
	@PostMapping("/board/insert")
	public String insert(@ModelAttribute BoardDto dto,
			HttpSession session)
	{
		
		service.insertBoard(dto, session);
		
		return "redirect:list";
	}
	
	@GetMapping("/board/detail")
	public String detail(@RequestParam String num,
			@RequestParam String currentPage,
			Model model)
	{
		//조회수
		service.updateReadCount(num);
		
		BoardDto dto=service.getData(num);
		
		model.addAttribute("dto", dto);
		model.addAttribute("currentPage", currentPage);
		
		return "board/detailPage";
	}
	
	

}
