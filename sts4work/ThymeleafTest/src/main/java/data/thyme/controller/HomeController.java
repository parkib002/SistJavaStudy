package data.thyme.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import data.thyme.dto.ShopDto;
import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	
	List<ShopDto> list=new ArrayList<>();
	
	@GetMapping("/")
	public String home()
	{
		return "home";
	}
	
	@GetMapping("/hello1")
	public String hello(Model model)
	{
		model.addAttribute("message", "Have a Nice Day!!!");
		model.addAttribute("today", new Date());
		
		ShopDto dto=ShopDto.builder()
				.num(100)
				.sangpum("아이폰16")
				.su(5)
				.dan(1500000)
				.color("yellow")
				.build();
		
		model.addAttribute("dto", dto);
		
		return "hello1";
	}
	
	@GetMapping("/hello2")
	public String hello2(
			@RequestParam("name") String name,
			@RequestParam("ban") int ban,
			Model model)
	{
		model.addAttribute("studata", name+"님은 "+ban+"강의장 학생입니다");
		
		return "hello2";
	}
	
	@GetMapping("/list")
	public String list(Model model)
	{
		list.add(new ShopDto(1, "귀걸이", 2, 15000, "white"));
		list.add(new ShopDto(2, "모자", 5, 25000, "black"));
		list.add(new ShopDto(3, "상의", 3, 10000, "green"));
		list.add(new ShopDto(4, "하의", 5, 18000, "yellow"));
		list.add(new ShopDto(5, "양말", 10, 8000, "blue"));
		
		ShopDto dto2=ShopDto.builder()
				.num(5)
				.sangpum("장갑")
				.su(7)
				.dan(13000)
				.color("purple")
				.build();
		
		list.add(dto2);
		
		model.addAttribute("list", list);
		
		return "list";
	}
	
	@GetMapping("/detail")
	public String detail(@RequestParam("index") int index,Model model)
	{
		model.addAttribute("dto", list.get(index));
		
		return "detail";
	}
	
	@GetMapping("/login1")
	public String login1(HttpSession session)
	{
		session.setAttribute("myid", "admin");
		
		return "login";
	}
	
	@GetMapping("/login2")
	public String login2(HttpSession session)
	{
		session.setAttribute("myid", "angel");
		
		return "login";
	}
}
