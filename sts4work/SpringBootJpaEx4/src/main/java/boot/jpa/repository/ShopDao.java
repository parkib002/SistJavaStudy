package boot.jpa.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import boot.jpa.dto.ShopDto;

@Repository
public class ShopDao {

	@Autowired
	ShopDaoInter shopInter;
	
	public void insertFood(ShopDto dto)
	{
		shopInter.save(dto);
	}
	
	public List<ShopDto> getAllFood()
	{
		return shopInter.findAll();
	}
}
