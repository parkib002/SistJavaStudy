package boot.mvc.ex1;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

	@GetMapping("/test")
	public TestDto hello()
	{
		TestDto dto=new TestDto();
		
		dto.setName("박창배");
		dto.setAddr("경기도 안양시");
		
		return dto;
	}
}
