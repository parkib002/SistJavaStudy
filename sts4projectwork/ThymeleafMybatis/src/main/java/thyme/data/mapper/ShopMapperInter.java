package thyme.data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import thyme.data.dto.ShopDto;

@Mapper
public interface ShopMapperInter {

	public int getTotalCount();
	
	public void insertShop(ShopDto dto);
	
	public List<ShopDto> getAllSangpums();
	
}
