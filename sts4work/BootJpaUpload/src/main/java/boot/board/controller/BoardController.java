package boot.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.board.dto.BoardDto;
import boot.board.service.BoardService;
import jakarta.servlet.http.HttpSession;

@Controller
public class BoardController {

	@Autowired
	BoardService service;
	
	@GetMapping("/")
	public String home()
	{
		return "redirect:board/list";
	}
	
	@GetMapping("/board/list")
	public ModelAndView list()
	{
		ModelAndView model=new ModelAndView();
		
		List<BoardDto> list=service.getAllDatas();
		
		model.addObject("list", list);
		model.addObject("count", list.size());
		
		model.setViewName("board/boardList");
		
		return model;
	}
	
	//폼
	@GetMapping("/board/form")
	public String form()
	{
		return "/board/addForm";
	}
	
	//insert
	@PostMapping("/board/insert")
	public String insert(@ModelAttribute BoardDto dto,
			MultipartFile upload,
			HttpSession session)
	{	
		service.insertBoard(dto, upload, session);
		
		return "redirect:list";
	}
	
	//detailPage
	@GetMapping("/board/detailform")
	public ModelAndView detail(long num)
	{
		ModelAndView model=new ModelAndView();
		
		BoardDto dto=service.getOneData(num);
		
		model.addObject("dto", dto);
		
		model.setViewName("board/detailPage");
		
		return model;
	}
	
	//delete
	@GetMapping("/board/delete")
	public String delete(long num,HttpSession session)
	{
		service.deleteBoard(num,session);
		
		return "redirect:list";
	}
	
	//updateform
	@GetMapping("/board/update")
	public ModelAndView form2(long num)
	{
		ModelAndView model=new ModelAndView();
		
		BoardDto dto=service.getOneData(num);
		
		model.addObject("dto", dto);
		
		model.setViewName("board/updateForm");
		
		return model;
	}
	
	//update
	@PostMapping("/board/updateProc")
	public String update(@ModelAttribute BoardDto dto,
			MultipartFile upload,
			HttpSession session)
	{
		service.updateBoard(dto, upload, session);
		
		return "redirect:detailform?num="+dto.getNum();
	}
	
}
