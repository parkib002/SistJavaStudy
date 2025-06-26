package spring.mvc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.dao.MemberDaoInter;
import spring.mvc.dto.MemberDto;

@Controller
public class MemeberController {

	@Autowired
	MemberDaoInter dao;
	
	//회원가입폼
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
	
	//멤버리스트
	@GetMapping("/member/list")
	public String member(Model model)
	{
		List<MemberDto> list=dao.getAllMembers();
		
		model.addAttribute("list", list);
		
		return "/member/memberList";
	}
	
	//마이페이지 가기
	@GetMapping("/member/myinfo")
	public String mypage(Model model) 
	{
		List<MemberDto> list = dao.getAllMembers();

		model.addAttribute("list", list);

		return "/member/myInfo";
	}
	
	@GetMapping("/member/updateform")
	public ModelAndView updateform(@RequestParam String num)
	{
		ModelAndView model=new ModelAndView();
		
		MemberDto dto=dao.getOneMember(num);
		
		model.addObject("dto", dto);
		
		model.setViewName("/member/updateForm");
		
		return model;
	}
	
	@PostMapping("/member/update")
	public String update(@RequestParam String num,
			@RequestParam String pass,
			@ModelAttribute MemberDto dto)
	{
		int chk=dao.passCheck(num, pass);
		
		if(chk==1)
		{
			dao.updateMember(dto);
			
			return "redirect:/member/myinfo";
		}else {
			
			return "/member/passFail";
		}
	}
	
	@GetMapping("/member/deleteinfo")
	public String deleteInfo(@RequestParam String num,
			HttpSession session)
	{
		dao.deleteMember(num);
		
		session.removeAttribute("loginok");
		session.removeAttribute("myid");
		
		return "redirect:../home";
	}
	
	@GetMapping("/member/delete")
	@ResponseBody
	public void delete(@RequestParam String num)
	{
		dao.deleteMember(num);
	}
}
