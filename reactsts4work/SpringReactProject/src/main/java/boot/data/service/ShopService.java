package boot.data.service;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import boot.data.dto.ShopDto;
import boot.data.mapper.ShopMapper;
import jakarta.servlet.http.HttpSession;

@Service
public class ShopService implements ShopServiceInter {

	@Autowired
	private ShopMapper shopMapper;

	@Override
	public void insertShop(ShopDto dto) {
		// TODO Auto-generated method stub
		shopMapper.insertShop(dto);

	}

	@Override
	public List<ShopDto> getAllShopDatas() {
		// TODO Auto-generated method stub
		return shopMapper.getAllShopDatas();
	}

	@Override
	public ShopDto getOneShopData(Integer num) {
		// TODO Auto-generated method stub
		return shopMapper.getOneShopData(num);
	}

	@Override
	public void deleteShop(@RequestParam("num") Integer num, HttpSession session) {
		String path = session.getServletContext().getRealPath("/save");

		String old_photo = shopMapper.getOneShopData(num).getPhoto();

		File file = new File(path + "\\" + old_photo);

		if (file.exists())
			file.delete();

		shopMapper.deleteShop(num);
	}

	@Override
	public void updateShop(ShopDto dto) {
		// TODO Auto-generated method stub
	
		
		shopMapper.updateShop(dto);
		
	}

}
