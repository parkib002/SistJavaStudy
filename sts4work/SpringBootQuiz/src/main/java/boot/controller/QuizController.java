package boot.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class QuizController {

	@GetMapping("/")
	public String home()
	{
		return "quizForm";
	}
	
	@PostMapping("/foodshow")
	public ModelAndView result2(@RequestParam String fname,
			@RequestParam int fprice,
			@RequestParam ArrayList<String> fphoto)
	{
		ModelAndView model=new ModelAndView();
		
		model.addObject("fname", fname);
		model.addObject("fprice", fprice);
		model.addObject("fphoto", fphoto);
		
		model.setViewName("show");
		
		return model;
	}
	
}
	
