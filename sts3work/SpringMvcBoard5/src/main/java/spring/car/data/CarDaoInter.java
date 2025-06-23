package spring.car.data;

import java.util.List;

public interface CarDaoInter {

	public List<CarDto> getAllCarList();
	
	public void insertCar(CarDto dto);
	
	public CarDto getOneCarData(String num);
	
	public void updateCar(CarDto dto);
	
	public void deleteCar(String num);
}
