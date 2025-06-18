package spring.mvc.start;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReviewController {

	//nice/hi�� ���ҽ��� �ƹ� �̹����� ����� ��
	@GetMapping("/nice/hi")
	public String nice()
	{
		return "review/nice";
	}
	
	//happy���� msg�� ����...�� �Ʒ� WEB-INF�� �̹��� �ϳ� ����� ��
	@GetMapping("/happy")
	public String hi(Model model)
	{
		
		model.addAttribute("msg", "�ȳ��ϼ���");
		
		return "review/hi";
	}
}
