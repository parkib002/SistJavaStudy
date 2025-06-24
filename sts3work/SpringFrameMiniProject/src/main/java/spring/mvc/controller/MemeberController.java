package spring.mvc.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.mvc.dao.MemberDaoInter;
import spring.mvc.dto.MemberDto;

@Controller
public class MemeberController {

	@Autowired
	MemberDaoInter dao;
	
	//È¸¿ø°¡ÀÔÆû
	@GetMapping("/member/form")
	public String form1()
	{
		return "/member/memberForm";
	}
	
	@GetMapping("/member/idcheck")
	public @ResponseBody Map<String, Integer> idcheck(
			@RequestParam String id)
	{
		Map<String, Integer> map=new HashMap<String, Integer>();
		
		int count=dao.getIdCount(id);
		
		map.put("count", count);
		
		return map;
	}
	
	@PostMapping("/member/insert")
	public String insert(@ModelAttribute MemberDto dto)
	{
		dao.insertMember(dto);
		
		return "redirect:list";
	}
}
