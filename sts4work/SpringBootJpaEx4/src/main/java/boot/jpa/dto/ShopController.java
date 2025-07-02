package boot.jpa.dto;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boot.jpa.repository.ShopDao;

@Controller
public class ShopController {

	@Autowired
	ShopDao dao;
	
	@GetMapping({"/","/food/list"})
	public ModelAndView form()
	{
		ModelAndView model=new ModelAndView();
		
		List<ShopDto> list=dao.getAllFood();
		
		model.addObject("count", list.size());
		model.addObject("list", list);
		
		model.setViewName("/shop/foodList");
		
		return model;
	}
	
	@GetMapping("/food/addForm")
	public String form2()
	{
		return "/shop/addForm";
	}
	
	@PostMapping("/food/form")
	public String insert(@ModelAttribute ShopDto dto)
	{
		
		dao.insertFood(dto);
		
		return "redirect:/food/list";
	}
	
	@GetMapping("/food/updateform")
	public ModelAndView form2(@RequestParam int num)
	{
		ModelAndView model=new ModelAndView();
		
		ShopDto dto=dao.getOneData(num);
		
		model.addObject("dto", dto);
		
		model.setViewName("/shop/updateForm");
		
		return model;
	}
	
	@PostMapping("/food/update")
	public String update(@ModelAttribute ShopDto dto)
	{
		dao.insertFood(dto);
		
		return "redirect:/food/list";
	}
	
	@GetMapping("/food/deleteform")
	public String delete(@RequestParam int num)
	{
		dao.deleteData(num);
		
		return "redirect:list";
	}
	
}
