package spring.mvc.summer;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	
	@GetMapping("/board/form1")
	public String form1()
	{
		return "board/writeForm";
	}
	
	@PostMapping("/board/process")
	public ModelAndView process1(
			@RequestParam String name,
			@RequestParam String date,
			@RequestParam String gender,
			/*require는 true가 기본값, 항목이 없어도 에러가 안나려면 false*/
			@RequestParam(required = false) String msg,
			/*또는 defaultValue값을 주면 된다 int는 null값이 들어갈 수 없는 기본형이므로 required를 쓸려면
			 * 래퍼 클래스인 Integer형식으로 선언하거나 defaultValue로 기본값 지정해야됨*/
			@RequestParam(defaultValue = "1") int currentPage)
	{
		ModelAndView model=new ModelAndView();
		
		model.addObject("name", name);
		model.addObject("date", date);
		model.addObject("gender", gender);
		model.addObject("msg", msg);
		model.addObject("currentPage", currentPage);
		
		model.setViewName("board/result1");
		
		return model;
	}
	
	@GetMapping("/board/result2")
	public String result2(Model model)
	{
		model.addAttribute("myimg1", "../image/logoImg/img1.gif");
		model.addAttribute("title", "내가 좋아하는 향수");
				
		
		return "board/result2";
	}
	
	@GetMapping("/board/list")
	public String result3()
	{
		return "board/result3";
	}
}
