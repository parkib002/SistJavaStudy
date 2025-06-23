package spring.mvc.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.car.data.CarDaoInter;
import spring.car.data.CarDto;

@Controller
public class MyCarController {

	@Autowired
	CarDaoInter dao;
	
	@GetMapping("/car/list")
	public String list(Model model)
	{
		//전체 리스트 가져오기
		List<CarDto> list=dao.getAllCarList();
		
		//request에 저장
		model.addAttribute("totalCount", list.size());
		model.addAttribute("list", list);
		
		return "myCar/carList";
	}
	
	@GetMapping("/car/writeform")
	public String form1()
	{
		return "myCar/carForm";
	}
	
	@PostMapping("/car/carinfo")
	public String insert(@ModelAttribute CarDto dto)
	{
		dao.insertCar(dto);
		
		return "redirect:list";
	}
	
	@GetMapping("/car/updateform")
	public ModelAndView form2(@RequestParam String num)
	{
		ModelAndView model=new ModelAndView();
		
		CarDto dto=dao.getOneCarData(num);
		
		model.addObject("dto", dto);
		
		model.setViewName("myCar/updateForm");
		
		return model;
	}
	
	@PostMapping("/car/carupdate")
	public String update(@ModelAttribute CarDto dto)
	{
		dao.updateCar(dto);
		
		return "redirect:list";
	}
	
	@GetMapping("/car/delete")
	public String delete(@RequestParam String num)
	{
		dao.deleteCar(num);
		
		return "redirect:list";
	}
}
