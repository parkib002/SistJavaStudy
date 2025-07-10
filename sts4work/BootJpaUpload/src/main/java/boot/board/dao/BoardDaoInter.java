package boot.board.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import boot.board.dto.BoardDto;

public interface BoardDaoInter extends JpaRepository<BoardDto, Long>{

}
