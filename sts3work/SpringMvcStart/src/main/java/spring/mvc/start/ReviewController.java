package spring.mvc.start;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReviewController {

	//nice/hi에 리소스의 아무 이미지나 출력할 것
	@GetMapping("/nice/hi")
	public String nice()
	{
		return "review/nice";
	}
	
	//happy에는 msg값 전달...그 아래 WEB-INF의 이미지 하나 출력할 것
	@GetMapping("/happy")
	public String hi(Model model)
	{
		
		model.addAttribute("msg", "안녕하세요");
		
		return "review/hi";
	}
}
