package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.lang.annotation.Repeatable;
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

import boot.data.dto.MarketDto;
import boot.data.mapper.MarketMapperInter;
import jakarta.servlet.http.HttpSession;

@Controller
public class MarketController {

	@Autowired
	MarketMapperInter mapper;
	
	@GetMapping({"/","list"})
	public ModelAndView list()
	{
		ModelAndView model=new ModelAndView();
		
		int totalCount=mapper.getTotalCount();
		
		List<MarketDto> list=mapper.getAllSangpums();
		
		model.addObject("count", totalCount);	
		model.addObject("list", list);
		
		model.setViewName("market/marketList");
		
		return model;
	}
	
	@GetMapping("/addform")
	public String form()
	{
		return "market/addForm";
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute MarketDto dto,
			@RequestParam MultipartFile photo,
			HttpSession session)
	{
		String path=session.getServletContext().getRealPath("/photo");
		
		System.out.println(path);
		
		if(photo.getOriginalFilename().equals("")) { 
			dto.setPhotoname(null);
		}
		else { 
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
			
			String photoname=sdf.format(new Date())+"_"+photo.getOriginalFilename();
			
			dto.setPhotoname(photoname);
			
			//실제 업로드
			try {
				photo.transferTo(new File(path+"\\"+photoname));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		mapper.insertMarket(dto);
		
		return "redirect:list";
	}
	
	@GetMapping("/updateform")
	public ModelAndView form2(@RequestParam String num)
	{
		ModelAndView model=new ModelAndView();
		
		MarketDto dto=mapper.getOneData(num);
		
		model.addObject("dto", dto);
		
		model.setViewName("market/updateForm");
		
		return model;
		
	}
	
	@PostMapping("/update")
	public String update(@ModelAttribute MarketDto dto,
			@RequestParam MultipartFile photo,
			HttpSession session)
	{
		String path=session.getServletContext().getRealPath("/photo");

		
		if(photo.getOriginalFilename().equals("")) { 
			dto.setPhotoname(null);
		}
		else { 
			
			//이전사진 지우기
			String pre_photo=mapper.getOneData(dto.getNum()).getPhotoname();
					
			File file=new File(path+"\\"+pre_photo);
			file.delete(); 
			
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
			
			String photoname=sdf.format(new Date())+"_"+photo.getOriginalFilename();
			
			dto.setPhotoname(photoname);
			
			//실제 업로드
			try {
				photo.transferTo(new File(path+"\\"+photoname));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}		
		
		mapper.updateMarket(dto);
		
		return "redirect:list";
	}
	
	@GetMapping("/deleteform")
	public String delete(@RequestParam String num,
			HttpSession session)
	{
		String photo=mapper.getOneData(num).getPhotoname();
		
		if(!"null".equals(photo))
		{
				String uploadPath=session.getServletContext().getRealPath("/photo");
				
				File file=new File(uploadPath+"\\"+photo);
				file.delete(); 
		}
		
		mapper.deleteMarket(num);
		
		return "redirect:list";
	}
}
