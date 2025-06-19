package spring.mvc.summer;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.dto.SangpumDto;

@Controller
public class ShopController {
	
	@GetMapping("/cat/form2")
	public String form2()
	{
		return "cat/shopForm";
	}
	
	@PostMapping("/cat/process2")
	public String process2(@ModelAttribute SangpumDto dto)
	{	
		return "cat/shopResult";
	}
	
	//¸ÊÆûÀ¸·Î °¡±â
	@GetMapping("/cat/form3")
	public String form3()
	{
		return "cat/mapForm";
	}
	//¸ÊÆû submitÇÑ ÈÄ mapresult·Î ÀÌµ¿
	@PostMapping("/cat/process3")
	public ModelAndView process3(@RequestParam Map<String, String> map)
	{
		ModelAndView model=new ModelAndView();
		
		String name=map.get("name");
		String java=map.get("java");
		String spring=map.get("spring");
		String oracle=map.get("oracle");
		
		model.addObject("name", name);
		model.addObject("java", java);
		model.addObject("spring", spring);
		model.addObject("oracle", oracle);
		
		model.setViewName("cat/mapResult");
		
		return model;
	}
}
