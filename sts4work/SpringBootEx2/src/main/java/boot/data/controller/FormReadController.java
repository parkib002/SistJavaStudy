package boot.data.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.InfoDto;
import ch.qos.logback.core.model.Model;

@Controller
public class FormReadController {
	
	@PostMapping("/read1")
	public ModelAndView read1(@RequestParam String name,
			@RequestParam int java,
			@RequestParam int spring)
	{
		ModelAndView model=new ModelAndView();

		int tot=java+spring;
		double avg=tot/2;
		
		model.addObject("name", name);
		model.addObject("java", java);
		model.addObject("spring", spring);
		model.addObject("tot", tot);
		model.addObject("avg", avg);
		
		
		model.setViewName("/result/result1");
		
		return model;
	}
	
	@PostMapping("/read2")
	public String read2(@ModelAttribute InfoDto dto)
	{
		
		return "result/result2";
	}
	
	@PostMapping("/read3")
	public ModelAndView read3(@RequestParam Map<String, String> map)
	{
		ModelAndView model=new ModelAndView();
		
		model.addObject("irum", map.get("irum"));
		model.addObject("mbti", map.get("mbti"));
		model.addObject("major", map.get("major"));
		
		model.setViewName("/result/result3");
		
		return model;
	}
}
