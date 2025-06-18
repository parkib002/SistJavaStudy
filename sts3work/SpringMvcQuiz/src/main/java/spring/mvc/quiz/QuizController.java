package spring.mvc.quiz;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.sawon.dto.SawonDto;

@Controller
public class QuizController {
	
	@GetMapping
	public String start()
	{
		return "/start";
	}
	
	@GetMapping("/sawon/form")
	public String sawonform()
	{
		return "/sawonForm";
	}
	
	@PostMapping("/sawon/info")
	public ModelAndView sawoninfo(@ModelAttribute SawonDto dto)
	{
		ModelAndView model=new ModelAndView();
		
		model.addObject("dto", dto);
		
		model.setViewName("/sawonInfo");
		
		return model;
	}
	
}
