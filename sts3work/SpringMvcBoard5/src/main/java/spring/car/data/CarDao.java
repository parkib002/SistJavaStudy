package spring.car.data;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CarDao implements CarDaoInter{

	@Autowired
	SqlSession session;
	
	@Override
	public List<CarDto> getAllCarList() {
		
		return session.selectList("getAllOfMyCar");
	}

	@Override
	public void insertCar(CarDto dto) {
		
		session.insert("insertOfMyCar",dto);
	}

	@Override
	public CarDto getOneCarData(String num) {
		
		return session.selectOne("getOneOfMyCar", num);
	}

	@Override
	public void updateCar(CarDto dto) {
		
		session.update("updateOfMyCar", dto);
	}

	@Override
	public void deleteCar(String num) {
		
		session.delete("deleteOfMyCar", num);
	}

}
