package thyme.my.mini;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import thyme.data.service.ShopService;

@Controller
public class HomeController {
	
	@Autowired
	ShopService service;

	@GetMapping("/")
	public String home()
	{
		return "start";
	}
	
}
