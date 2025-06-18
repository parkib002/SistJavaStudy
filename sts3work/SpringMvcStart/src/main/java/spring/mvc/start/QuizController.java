package spring.mvc.start;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class QuizController {
	
	@GetMapping("/quiz/lunch/burger") 
	public String quiz1(Model model)
	{
		
		model.addAttribute("title", "�̹�����°���");
		model.addAttribute("stuName", "��â��");
		
		return "quiz1";
	}
}
