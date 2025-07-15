package boot.data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import boot.data.dto.BoardAnswerDto;
import boot.data.service.BoardAnswerService;
import boot.data.service.MemberService;
import jakarta.servlet.http.HttpSession;

@RestController
public class BoardAnswerController {
	
	@Autowired
	BoardAnswerService service;
	
	@Autowired
	MemberService mservice;
	
	//insert
	@PostMapping("/board/ainsert")
	public void insert(@ModelAttribute BoardAnswerDto dto,
			HttpSession session)
	{
		String myid=(String)session.getAttribute("myid");
		
		String name=mservice.getName(myid);
		
		dto.setName(name);
		dto.setMyid(myid);
		
		service.insertAnswer(dto);
	}
	
	@GetMapping("/board/alist")
	public List<BoardAnswerDto> alist(@RequestParam String num)
	{
		return service.getAllAnswers(num);
	}
	
	@DeleteMapping("/board/adelete/{idx}")
	public void delete(@PathVariable String idx)
	{
		service.deleteAnswer(idx);
	}
	
}
