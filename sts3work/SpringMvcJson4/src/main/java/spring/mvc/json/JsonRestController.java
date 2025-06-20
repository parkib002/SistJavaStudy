package spring.mvc.json;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import spring.mvc.dto.FoodDto;

//json����_�Ϲݸ޼��� �ȵ�_5.0���Ŀ� �߰��� ���
@RestController
public class JsonRestController {

	@GetMapping("/list3")
	public Map<String, String> list3(@RequestParam String name)
	{
		List<FoodDto> list=new ArrayList<FoodDto>();
		
		list.add(new FoodDto("������ġ", "1.jpg"));
		list.add(new FoodDto("��ġ����", "2.jpg"));
		list.add(new FoodDto("«��", "3.jpg"));
		list.add(new FoodDto("����", "4.jpg"));
		list.add(new FoodDto("��ġ��", "5.jpg"));
		list.add(new FoodDto("���Ƕ��̽�", "6.jpg"));
		list.add(new FoodDto("������", "7.jpg"));
		
		Map<String, String> map=new HashMap<String, String>();
		
		map.put("name", "���¸޴�");
		map.put("photo", "8.jpg");
		
		for(FoodDto dto:list)
		{
			if(name.equals(dto.getName()))
			{
				map.put("name", dto.getName());
				map.put("photo", dto.getPhoto());
			}
		}
		
		return map;
	}
}
