package spring.mvc.dto;

public class FoodDto {

	private String name;
	private String photo;
	
	public FoodDto(String name, String photo) {
		this.name=name;
		this.photo=photo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}
}
