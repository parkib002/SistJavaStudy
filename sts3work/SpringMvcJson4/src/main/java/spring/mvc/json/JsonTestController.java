package spring.mvc.json;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.mvc.dto.FoodDto;

@Controller
public class JsonTestController {

	@GetMapping("/list1")
	@ResponseBody
	public Map<String, String> list1()
	{
		Map<String, String> map=new HashMap<String, String>();
		
		map.put("name", "ȫ�浿");
		map.put("hp", "010-222-3333");
		map.put("addr", "���� ���� ����");
		
		return map;
	}
	
	@GetMapping("/list2")
	@ResponseBody
	public List<FoodDto> list2()
	{
		List<FoodDto> list=new Vector<FoodDto>();
		
		list.add(new FoodDto("������ġ", "1.jpg"));
		list.add(new FoodDto("��ġ����", "2.jpg"));
		list.add(new FoodDto("«��", "3.jpg"));
		list.add(new FoodDto("����", "4.jpg"));
		list.add(new FoodDto("��ġ��", "5.jpg"));
		
		return list;
	}
}
