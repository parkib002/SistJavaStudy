package thyme.data.repository;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

import lombok.AllArgsConstructor;
import thyme.data.dto.CarDto;

@Repository
@AllArgsConstructor
public class CarDao {
	
	CarDaoInter daointer;
	
	//db저장
	public void insertCar(CarDto dto)
	{
		daointer.save(dto);
	}
	
	//전체출력
	public List<CarDto> getAllDatas()
	{
		//return daointer.findAll();
		return daointer.findAll(Sort.by(Sort.Direction.ASC,"carprice")); //가격인 싼순
	}
	
	//dto
	public CarDto getData(long num)
	{
		return daointer.getById(num);
	}
	
	//수정
	public void updateCar(CarDto dto)
	{
		daointer.save(dto);
	}
	
	//삭제
	public void deleteCar(long num)
	{
		daointer.deleteById(num);
	}
	
	public void updateCarNoPhoto(CarDto dto)
	{
		long num=dto.getNum();
		String carname=dto.getCarname();
		String carprice=dto.getCarprice();
		String carcolor=dto.getCarcolor();
		
		daointer.updateCarNoPhoto(num, carname, carprice, carcolor);
	}
}
