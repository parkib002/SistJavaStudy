package thyme.data.dto;

import java.sql.Timestamp;

import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@Table(name = "jpacar")
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CarDto {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long num;
	
	@Column(name = "carname",length = 30)
	private String carname;
	
	@Column
	private String carprice;
	
	@Column(length = 30) //생략시 255
	private String carcolor;
	
	@Column(length = 100)
	private String carphoto;
	
	@Column(length = 30)
	private String guipday;
	
	@CreationTimestamp
	@Column(updatable = false)
	private Timestamp writeday;
	
	@Transient //테이블의 컬럼으로는 생성되지 않고 객체에서만 사용가능한 멤버변수
	private int commentcount;
}
