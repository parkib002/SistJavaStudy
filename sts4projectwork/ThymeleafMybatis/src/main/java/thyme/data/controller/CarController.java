package thyme.data.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import thyme.data.dto.CarDto;
import thyme.data.service.CarService;

@Controller
@RequiredArgsConstructor
public class CarController {

	private final CarService service;
	
	@GetMapping("/board/list")
	public String boardList(Model model)
	{
		List<CarDto> list=service.getAllDatas();
		
		model.addAttribute("list", list);
		model.addAttribute("totalCount", list.size());
		
		return "board/list";
	}
	
	@GetMapping("/board/addform")
	public String form()
	{
		return "board/addForm";
	}
	
	@PostMapping("/board/insert")
	public String insert(
			@ModelAttribute("dto") CarDto dto,
			@RequestParam(name = "carupload") MultipartFile carupload,
			HttpSession session)
	{
		service.insertCar(dto, carupload, session);
		
		return "redirect:list";
	}
	
	@GetMapping("/board/detail")
	public ModelAndView detail(@RequestParam(name = "num") long num)
	{
		ModelAndView model=new ModelAndView();
		
		CarDto dto=service.getData(num);
		
		model.addObject("dto", dto);
		
		model.setViewName("board/detailPage");
		
		return model;
	}
	
	@GetMapping("/board/carupdate")
	public String form2(Model model,
			@RequestParam("num") long num)
	{
		CarDto dto=service.getData(num);
		
		model.addAttribute("dto", dto);
		
		return "board/updateForm";
	}
	
	@PostMapping("/board/update")
	public String update(
			@ModelAttribute("dto") CarDto dto,
			@RequestParam(name = "upload") MultipartFile upload,
			HttpSession session)
	{
		if(upload.getOriginalFilename().equals("")) {
			
			service.updateCarNoPhoto(dto);
		}else {
			
		service.updateCar(dto, upload, session);
		}
		
		return "redirect:detail?num="+dto.getNum();
	}
	
	@GetMapping("/board/delete")
	public String delete(@RequestParam("num") long num,
			HttpSession session)
	{
		service.deleteCar(num, session);
		
		return "redirect:list";
	}
}
