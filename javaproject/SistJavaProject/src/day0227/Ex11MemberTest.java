package day0227;

public class Ex11MemberTest {

	public static void main(String[] args) {
		// 멤버2명 객체 생성 후출력
		
		Ex11Member mem1=new Ex11Member();
		Ex11Member mem2=new Ex11Member();
		
		Ex11Member.ban="우리반";
		
		mem1.setMemberData("홍길동", "남", "서울");
		mem2.setMemberData("김연아", "여", "부산");
		
		mem1.getMemberData();
		mem2.getMemberData();
	}
	

}
