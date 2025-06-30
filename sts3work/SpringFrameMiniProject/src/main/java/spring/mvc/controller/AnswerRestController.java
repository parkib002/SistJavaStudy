package spring.mvc.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import spring.mvc.dao.AnswerDao;
import spring.mvc.dao.BoardDao;
import spring.mvc.dto.BoardDto;

@RestController
public class AnswerRestController {

	@Autowired
	AnswerDao dao;
	@Autowired 
	BoardDao bdao;
	
	@GetMapping("/board/delete")
	public Map<String, Integer> delete(@RequestParam int idx,
			@RequestParam String pass)
	{
		Map<String, Integer> map=new HashMap<String, Integer>();
		
		int chk=dao.getCheckPass(idx, pass);
		
		if(chk==1) {
			dao.deleteAnswer(idx);
		}
		
		map.put("result", chk);
		
		return map;
	}
	

	
	@GetMapping("/rest/list1")
	public Map<String, Object> allList()
	{
		Map<String, Object> map=new HashMap<String, Object>();
		
		List<BoardDto> list=bdao.getAllList();
		
		map.put("list", list);
		
		return map;
	}
	
	@GetMapping("/rest/list2")
	public Map<String, Object> allList2()
	{
		
		Map<String, Object> map=new HashMap<String, Object>();
		
		List<BoardDto> list=bdao.getAllPhoto();
		
		String photo="";
		
		List<String> list2=new ArrayList<String>();
		
		for(BoardDto d:list)
		{
			
			if(!"no".equals(d.getPhoto()))
			{
				String [] photos=d.getPhoto().split(",");
				
				photo=photos[0];
				
				list2.add(photo);
			}
			
		}
		
		map.put("photo", list2);
		
		return map;
	}
	
}
