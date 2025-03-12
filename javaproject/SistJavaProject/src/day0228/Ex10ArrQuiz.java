package day0228;

class StuInfos{
	private String stuName;
	private String mbti;
	private int age;
	
	//3가지 인자 초기화하는 명시적 생성자
	public StuInfos(String stuName,String mbti,int age) 
	{
		this.stuName=stuName;
		this.mbti=mbti;
		this.age=age;
	}
	//제목메서드 showTitle 이름 mbti 나이
	public static void showTitle()
	{
		System.out.println("이름\tmbti\t나이");
		System.out.println("---------------------------");
	}
	//출력 showInfo      이름 mbti 나이
	public void showInfo()
	{
		System.out.println(stuName+"\t"+mbti+"\t"+age+"세");
	}
}

public class Ex10ArrQuiz {

	public static void main(String[] args) {
		// 클래스 배열로 생성과 동시에 3명 이상 초기화(이름,mbti,나이는 자유)

		StuInfos [] info= {
				new StuInfos("김민지", "ISFP", 33),
				new StuInfos("이민호", "ISTJ", 25),
				new StuInfos("홍미호", "INTP", 22)
		};
		//총 5명의 정보를 출력합니다
		System.out.println("총"+info.length+"명의 정보를 출력합니다");
		//타이틀 호출
		StuInfos.showTitle();
		//출력문 호출
		for(StuInfos in:info)
			in.showInfo();
		
		System.out.println();
		for(int i=0;i<info.length;i++)
		{
			info[i].showInfo();
		}
		
	}

}
