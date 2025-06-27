package spring.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.mvc.dao.AnswerDao;
import spring.mvc.dto.AnswerDto;

@Controller
public class AnswerController {

	@Autowired
	AnswerDao dao;
	
	@PostMapping("/board/ainsert")
	public String insert(@ModelAttribute AnswerDto dto,
			@RequestParam int currentPage)
	{
		dao.insertAnswer(dto);
		
		return "redirect:/board/content?num="+dto.getNum()+"&currentPage="+currentPage;
	}
}
