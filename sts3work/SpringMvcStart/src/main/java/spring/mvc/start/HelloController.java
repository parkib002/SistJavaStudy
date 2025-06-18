package spring.mvc.start;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HelloController {

	@GetMapping("/")
	public String hello1(Model model)
	{
		//Model: request�� �����͸� �����ϱ� ���� Ŭ����
		//request.getParameter�� ����
		
		/*model.addAttribute("name", "����");
		model.addAttribute("addr", "���� ���� ����");*/
		
		return "start"; //������(WEB-INF/day0618/start.jsp)
	}
	
	@GetMapping("/sist/list") //list�ڿ� .do, .nhn, .me�� ���̴� �� ȣ��
	public String result1(Model model)
	{
		
		model.addAttribute("name", "�̿���");
		model.addAttribute("juso", "����� ������");
		
		return "result1";
	}
	
	@GetMapping("/apple/insert") 
	public String result2(Model model)
	{
		
		model.addAttribute("java", 88);
		model.addAttribute("spring", 77);
		
		return "result2";
	}
	
	@GetMapping("/samsung/dragon") 
	public ModelAndView result3()
	{	
		//ModelAndView�� request�� �����ϱ� ���� model��
		//������ ���� View�� ���� ���� Ŭ����
		
		ModelAndView mview=new ModelAndView();
		
		//request�� ����
		mview.addObject("html", "��������");
		mview.addObject("react", "���ʼ���");
		
		//�������� jsp���� ����
		mview.setViewName("result3");
		
		return mview;
	}
}
