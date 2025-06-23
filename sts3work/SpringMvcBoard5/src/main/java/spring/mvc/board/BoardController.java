package spring.mvc.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import spring.board.data.BoardDaoInter;
import spring.board.data.BoardDto;

@Controller
public class BoardController {

	@Autowired
	private BoardDaoInter dao;
	
	@GetMapping("/list")
	public ModelAndView list()
	{
		ModelAndView model=new ModelAndView();
		
		//총개수
		int totalCount=dao.getTotalCount();
		
		//리스트
		List<BoardDto> list=dao.getAllDatas();
		
		model.addObject("totalCount", totalCount);
		model.addObject("list", list);
		
		model.setViewName("board/boardList");
		
		return model;
	}
	
	@GetMapping("/writeform")
	public String form1()
	{
		return "board/writeForm";
	}
	
	@PostMapping("/write")
	public String insert(@ModelAttribute BoardDto dto)
	{
		dao.insertBoard(dto);
		
		return "redirect:list";
	}
	
	@GetMapping("/content")
	public ModelAndView content(@RequestParam String num)
	{
		ModelAndView model=new ModelAndView();
		
		BoardDto dto=dao.getData(num);
		
		model.addObject("dto", dto);
		
		model.setViewName("board/content");
		
		return model;
	}
	
	@GetMapping("/updateform")
	public ModelAndView form2(@RequestParam String num)
	{
		ModelAndView model=new ModelAndView();
		
		BoardDto dto=dao.getData(num);
		
		model.addObject("dto", dto);
		
		model.setViewName("board/updateForm");
		
		return model;
	}
	
	@PostMapping("/update")
	public String update(@ModelAttribute BoardDto dto)
	{
		dao.updateBoard(dto);
		
		return "redirect:content?num="+dto.getNum();
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam String num)
	{
		dao.deleteBoard(num);
		
		return "redirect:list";
	}
}
