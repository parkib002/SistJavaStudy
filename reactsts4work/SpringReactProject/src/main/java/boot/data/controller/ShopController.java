package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import boot.data.dto.ShopDto;
import boot.data.service.ShopService;
import jakarta.servlet.http.HttpSession;

@RestController
@CrossOrigin(origins = "http://localhost:5173") // 다른 포트 접속 허용
@RequestMapping("/shop")
public class ShopController {

	@Autowired
	private ShopService shopService;

	String photoName;

	// photo업로드
	@PostMapping("/upload")
	public String fileUpload(@RequestParam("uploadFile") MultipartFile uploadFile, HttpSession session) {
		String fileName = uploadFile.getOriginalFilename();

		String path = session.getServletContext().getRealPath("/save");

		File file = new File(path + "\\" + photoName);

		if (file.exists())
			file.delete();

		// 파일명 변경
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");

		photoName = sdf.format(new Date()) + "_" + uploadFile.getOriginalFilename();

		System.out.println("fileName: " + fileName + "==>" + photoName);

		// save업로드
		try {
			uploadFile.transferTo(new File(path + "\\" + photoName));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return photoName;
	}

	// insert
	// @RequestBody는 json으로 보낸 것을 자바 클래스로 변환해야 하므로 사용
	@PostMapping("/insert")
	public void insertShop(@RequestBody ShopDto dto) {
		// 업로드한 사진명
		dto.setPhoto(photoName);

		shopService.insertShop(dto);

		photoName = null;
	}

	// select
	@GetMapping("/list")
	public List<ShopDto> list() {
		return shopService.getAllShopDatas();
	}

	@GetMapping("/detail")
	public ShopDto detail(@RequestParam("num") Integer num)
	{
		ShopDto dto=shopService.getOneShopData(num);
		
		return dto;
	}

	 
	@DeleteMapping("/delete")
	public void delete(@RequestParam("num") Integer num, HttpSession session)
	{
		shopService.deleteShop(num, session);
	}
	
	@PostMapping("/update")
	public void update(@RequestBody ShopDto dto)
	{
		dto.setPhoto(photoName);
		
		shopService.updateShop(dto);
		
		photoName = null;
	}

}
