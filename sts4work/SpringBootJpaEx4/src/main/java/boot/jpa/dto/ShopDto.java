package boot.jpa.dto;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "jpashop")
@Data
public class ShopDto {

	//테이블 이름은 jpashop으로 만들 것
	//seq없이 auto인걸로
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int num;
	
	@Column
	private String foodname;
	
	@Column
	private int foodprice;
	
	@Column
	private String foodphoto;
	
	@Column
	private String ipgoday;
	
}
