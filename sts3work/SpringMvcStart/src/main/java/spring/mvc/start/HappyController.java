package spring.mvc.start;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HappyController {

	@GetMapping("/naver/board") 
	public ModelAndView result4()
	{	
		//ModelAndView는 request에 저장하기 위한 model과
		//포워드 위한 View를 합쳐 놓은 클래스
		
		ModelAndView mview=new ModelAndView();
		
		//request에 저장
		mview.addObject("age", "26");
		mview.addObject("addr", "경기도 안양시");
		
		//포워드할 jsp파일 지정
		mview.setViewName("result4");
		
		return mview;
	}
	
	@GetMapping("/shop/detail")
	public String imageResult5()
	{
		return "result5";
	}
}
