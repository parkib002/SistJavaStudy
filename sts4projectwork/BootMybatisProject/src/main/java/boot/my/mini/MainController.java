package boot.my.mini;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	@GetMapping("/")
	public String goMain()
	{
		return "main/mainPage";
	}
	
	@GetMapping("/member/list")
	public String memList()
	{
		return "member/memberList";
	}
	
	@GetMapping("/board/list")
	public String board()
	{
		return "board/boardList";
	}
	
}
