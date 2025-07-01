package boot.data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {

	@GetMapping("/")
	public ModelAndView list()
	{
		ModelAndView model=new ModelAndView();
		
		model.addObject("name", "박창배");
		model.addObject("addr", "안양시");
		model.addObject("hp", "010-6651-4771");
		
		model.setViewName("list");
		
		return model;
	}
}
