package thyme.data.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpSession;
import thyme.data.dto.ShopDto;
import thyme.data.mapper.ShopMapperInter;

@Service
public class ShopService {

	@Autowired
	ShopMapperInter shopinter;
	
	public int getTotalCount() {
		
		return shopinter.getTotalCount();
	}

	public void insertShop(ShopDto dto,MultipartFile upload,HttpSession session) {
		
		String path=session.getServletContext().getRealPath("/save");
		
		System.out.println(path);
		
		 File dir = new File(path);
		 if (!dir.exists()) dir.mkdirs();
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		
		String fileName=sdf.format(new Date())+"_"+upload.getOriginalFilename();
		
		try {
			upload.transferTo(new File(path+"\\"+fileName));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		dto.setPhoto(fileName);
		
		shopinter.insertShop(dto);
	}

	public List<ShopDto> getAllSangpums() {
		
		return shopinter.getAllSangpums();
	}


}
