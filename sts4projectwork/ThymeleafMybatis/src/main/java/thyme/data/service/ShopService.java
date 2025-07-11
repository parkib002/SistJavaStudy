package thyme.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import thyme.data.dto.ShopDto;
import thyme.data.mapper.ShopMapperInter;

@Service
public class ShopService implements ShopMapperInter{

	@Autowired
	ShopMapperInter shopinter;
	
	@Override
	public int getTotalCount() {
		
		return shopinter.getTotalCount();
	}

	@Override
	public void insertShop(ShopDto dto) {
		
		
		shopinter.insertShop(dto);
	}

	@Override
	public List<ShopDto> getAllSangpums() {
		
		return shopinter.getAllSangpums();
	}


}
