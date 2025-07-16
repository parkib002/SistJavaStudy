package thyme.data.repository;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import thyme.data.dto.CarCommentDto;

@Repository
@AllArgsConstructor
public class CarCommentDao {

	private CarCommentDaoInter commentInter;
	
	//댓글저장
	public void insertCommentCar(CarCommentDto dto)
	{
		commentInter.save(dto);
	}
	
	//댓글
	public List<CarCommentDto> getJpaCarCommentList(@RequestParam("num") long num)
	{
		return commentInter.getJpaCarCommentList(num);
	}
}
