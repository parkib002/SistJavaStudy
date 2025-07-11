package thyme.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
		String path=session.getServletContext().getRealPath("/save");
		
		System.out.println(path);
		
		 File dir = new File(path);
		 if (!dir.exists()) dir.mkdirs();
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		
		String fileName=sdf.format(new Date())+"_"+upload.getOriginalFilename();
		
		try {
			upload.transferTo(new File(path+"\\"+fileName));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		dto.setPhoto(fileName);
		
		service.insertShop(dto);
		
		return "redirect:list";
	}
}
