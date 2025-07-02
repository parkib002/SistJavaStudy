package boot.jpa.data;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MycarController {

	@Autowired
	MycarDao dao;
	
	@GetMapping("/carform")
	public String form()
	{
		return "addForm";
	}
	
	//리스트 ..시작 / or list
	@GetMapping({"/","/list"})
	public ModelAndView list()
	{
		ModelAndView model=new ModelAndView();
		
		List<MycarDto> list=dao.getAllDatas();
		
		model.addObject("count", list.size());
		model.addObject("list", list);
		
		model.setViewName("carList");
		
		return model;
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute MycarDto dto)
	{
		
		dao.insertCar(dto);
		
		return "redirect:list";
	}
	
	@GetMapping("/updateform")
	public ModelAndView form2(@RequestParam long num)
	{

		ModelAndView model=new ModelAndView();
		
		MycarDto dto=dao.getOneData(num);
		
		model.addObject("dto", dto);
		
		model.setViewName("/updateForm");
		
		return model;
	}
	
	@PostMapping("/update")
	public String update(@ModelAttribute MycarDto dto)
	{
		dao.insertCar(dto);
		
		return "redirect:list";
	}
	
	@GetMapping("/deleteform")
	public String delete(@RequestParam long num)
	{
		dao.deleteData(num);
		
		return "redirect:list";
	}
}
