package day0307;

public class Ex7Board {

	private String wirter;
	private String subject;
	private String content;
	
	public Ex7Board() {
		// TODO Auto-generated constructor stub
	}
	
	public Ex7Board(String wirter,String subject,String content) {
		this.wirter=wirter;
		this.subject=subject;
		this.content=content;
	}

	public String getWirter() {
		return wirter;
	}

	public void setWirter(String wirter) {
		this.wirter = wirter;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	
}
