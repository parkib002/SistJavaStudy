package spring.mvc.coffee;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.dto.TestDto;

@Controller
public class FormController {

	@GetMapping("/data/myform")
	public String form1()
	{
		return "data/form1";
	}
	
	@GetMapping("/data/read1")
	public ModelAndView read1(@RequestParam String name,
			@RequestParam int age,
			@RequestParam String addr,
			//@RequestParam(value = "msg", defaultValue="Happy Day!!")String msg
			@RequestParam(required = false)String msg)
	{
		ModelAndView model=new ModelAndView();
		
		//request에 저장
		model.addObject("name", name);
		model.addObject("age", age);
		model.addObject("addr", addr);
		model.addObject("msg", msg);
		
		//포워드
		model.setViewName("data/process1");
		
		return model;
	}
	
	@PostMapping("/data/read2")
	public ModelAndView read2(@ModelAttribute TestDto dto)
	{
		ModelAndView model=new ModelAndView();
		
		model.addObject("dto", dto);
		model.setViewName("data/process2");
		
		return model;
	}
	
	@PostMapping("/data/read3")
	public ModelAndView read3(@RequestParam Map<String, String> map)
	{
		ModelAndView model=new ModelAndView();
		
		String sang=map.get("sang");
		String cate=map.get("category");
		String price=map.get("price");
		
		String data=sang+"의 카테고리는 "+cate+"이며 가격은 "+price+"원입니다.";
		
		model.addObject("data", data);
		
		model.setViewName("data/process3");
		
		return model;
	}
	
}
