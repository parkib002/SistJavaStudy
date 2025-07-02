package boot.jpa.data;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MycarDao {

	@Autowired
	MycarInter carInter;
	
	//insert
	public void insertCar(MycarDto dto)
	{
		carInter.save(dto); //id타입 유무에 따라서 자동으로 insert 또는 update 구분
	}
	
	//전체출력
	public List<MycarDto> getAllDatas()
	{
		return carInter.findAll();
	}
	
	//num에 대한 dto반환
	public MycarDto getOneData(long num)
	{
		return carInter.getById(num);
	}
	
	//delete
	public void deleteData(long num)
	{
		carInter.deleteById(num);
	}
}
