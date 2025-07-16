package thyme.data.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import jakarta.transaction.Transactional;
import thyme.data.dto.CarDto;

public interface CarDaoInter extends JpaRepository<CarDto, Long>{

	//직접 쿼리문 작성
	//자동차명, 가격, 색상만 수정하는 메서드를 만들어보기
	@Query(value = "update jpacar set carname=:carname,carprice=:carprice,carcolor=:carcolor where num=:num",nativeQuery = true)
    //@Query(value = "update jpacar c set c.carname=:carname,c.carprice=:carprice,c.carcolor=:carcolor where c.num=:num")
	@Modifying
	@Transactional
	public void updateCarNoPhoto(@Param("num") long num,
			@Param ("carname") String carname,
			@Param("carprice") String carpirce,
			@Param("carcolor") String carcolor);
		
}
