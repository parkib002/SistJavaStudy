package boot.jpa.data;

import java.sql.Timestamp;

import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

//자동으로 mycar라는 테이블이 mysql에 만들어진다
//만약 변수가 변경될 경우 자동 수정
@Entity
@Table(name = "mycar")
@Data
public class MycarDto {

	@Id //각 엔티티를 구별할 수 있도록 식별 아이디 갖도록 설계(시퀀스)
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long num;
	
	@Column(name = "carname")
	private String carname;

	@Column //이름이 같으면 생략 가능
	private int carprice;
	
	@Column
	private String carcolor;
	
	@Column
	private String guipday;
	
	@CreationTimestamp //엔티티 생성 시점의 시간이 자동 등록
	@Column(updatable = false) //수정시 이 컬럼은 수정하지 않겠다라는 것
	private Timestamp writeday;
}
