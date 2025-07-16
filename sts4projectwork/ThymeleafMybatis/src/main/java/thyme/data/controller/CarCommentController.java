package thyme.data.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import thyme.data.dto.CarCommentDto;
import thyme.data.dto.CarDto;
import thyme.data.repository.CarCommentDao;

@RestController
@RequiredArgsConstructor
public class CarCommentController {

	private final CarCommentDao commentDao;
	
	@GetMapping("/board/addcomment")
	public void addComment(
			@RequestParam("num") long num,
			@RequestParam("comment") String comment)
	{
		//먼저 CarDto에 num값을 넣고 CarCommentDto에 넣는다(외부키로 지정된 값)
		CarDto dto=CarDto.builder().num(num).build();
		
		//dto에 값 지정
		CarCommentDto commnetDto=CarCommentDto.builder()
					.comment(comment)
					.car(dto)
					.build();
		
		//insert
		commentDao.insertCommentCar(commnetDto);
	}
	
	//특정 글에달린 댓글 반환
	@GetMapping("/board/commentlist")
	public List<CarCommentDto> commentList(@RequestParam("num") long num)
	{
		return commentDao.getJpaCarCommentList(num);
	}
}
