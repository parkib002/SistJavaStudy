package thyme.data.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import thyme.data.dto.CarDto;
import thyme.data.repository.CarDao;

@Service
@AllArgsConstructor
public class CarService {

	CarDao dao;
	
	public void insertCar(
			CarDto dto,
			@RequestParam MultipartFile carupload,
			HttpSession session)
	{
		String path=session.getServletContext().getRealPath("/carsave");
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		
		String uploadName=sdf.format(new Date())+"_"+carupload.getOriginalFilename();
		
		dto.setCarphoto(uploadName);
		
		try {
			carupload.transferTo(new File(path+"\\"+uploadName));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		dao.insertCar(dto);
	}
	
	public List<CarDto> getAllDatas()
	{
		return dao.getAllDatas();
	}
	
	public CarDto getData(long num)
	{
		return dao.getData(num);
	}
	
	public void updateCar(
			CarDto dto,
			@RequestParam MultipartFile upload,
			HttpSession session)
	{
		String old_photo=dao.getData(dto.getNum()).getCarphoto();
		
		String path=session.getServletContext().getRealPath("/carsave");
		
		File file=new File(path+"\\"+old_photo);
		
		if(file.exists()) {
			file.delete();
		}
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		
		String uploadName=sdf.format(new Date())+"_"+upload.getOriginalFilename();
		
		dto.setCarphoto(uploadName);
		
		try {
			upload.transferTo(new File(path+"\\"+uploadName));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		dao.updateCar(dto);
	}
	
	public void deleteCar(long num,HttpSession session)
	{
		String old_photo=dao.getData(num).getCarphoto();
		
		String path=session.getServletContext().getRealPath("/carsave");
		
		File file=new File(path+"\\"+old_photo);
		
		if(file.exists()) {
			file.delete();
		}
		
		dao.deleteCar(num);
	}
	
	//사진빼고수정
	public void updateCarNoPhoto(CarDto dto)
	{
		dao.updateCarNoPhoto(dto);
	}
}
