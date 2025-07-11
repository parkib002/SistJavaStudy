package thyme.data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;
import thyme.data.dto.ShopDto;
import thyme.data.service.ShopService;

@Controller
public class ShopController {

	@Autowired
	ShopService service;
	
	@GetMapping("/shop/list")
	public ModelAndView shopList()
	{
		ModelAndView model=new ModelAndView();
	
		List<ShopDto> list=service.getAllSangpums();
		
		int count=service.getTotalCount();
		
		model.addObject("count", count);
		model.addObject("list", list);
		
		model.setViewName("shop/list");
		
		return model;
	}
	
	@GetMapping("/shop/addform")
	public String addform()
	{
		return "shop/addForm";
	}
	
	@PostMapping("/shop/insert")
	public String insert(@ModelAttribute ShopDto dto,
			@RequestParam("upload") MultipartFile upload,
			HttpSession session)
	{
		
		
		service.insertShop(dto,upload,session);
		
		return "redirect:list";
	}
}
