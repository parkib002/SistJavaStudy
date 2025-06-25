package spring.mvc.mini;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
  
	@GetMapping("/home")
	public String mainView()
	{
		//타일즈에서 지정한 레이아웃으로 출력
		//return "home.tiles";
		
		return "/layout/main";
	}
	
	@GetMapping("/board/list")
	public String blist()
	{
		//return "input.tiles";
		
		return "/board/boardList";
	}
	
	@GetMapping("/shop/list")
	public String slist()
	{
		//return "list.tiles";
	
		return "/sub/myshop/shopList";
	}
	
	//로그인폼
	@GetMapping("/login/form")
	public String login()
	{
		return "/login/loginMain";
	}
	
}
