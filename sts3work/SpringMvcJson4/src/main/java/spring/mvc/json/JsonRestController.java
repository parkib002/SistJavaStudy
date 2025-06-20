package spring.mvc.json;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import spring.mvc.dto.FoodDto;

//json전용_일반메서드 안됨_5.0이후에 추가된 기능
@RestController
public class JsonRestController {

	@GetMapping("/list3")
	public Map<String, String> list3(@RequestParam String name)
	{
		List<FoodDto> list=new ArrayList<FoodDto>();
		
		list.add(new FoodDto("샌드위치", "1.jpg"));
		list.add(new FoodDto("꼬치구이", "2.jpg"));
		list.add(new FoodDto("짬뽕", "3.jpg"));
		list.add(new FoodDto("갈비", "4.jpg"));
		list.add(new FoodDto("콘치즈", "5.jpg"));
		list.add(new FoodDto("오므라이스", "6.jpg"));
		list.add(new FoodDto("볶음밥", "7.jpg"));
		
		Map<String, String> map=new HashMap<String, String>();
		
		map.put("name", "없는메뉴");
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
