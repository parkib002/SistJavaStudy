package day0305;

import java.util.Scanner;

class SawonOuter{
	
	private String sawonName;
	private int gibonPay,timeSu,familySu;
	
	//입력할 클래스_내부클래스
	class InputInner{
		
		//입력메서드
		public void inputData()
		{
			Scanner sc=new Scanner(System.in);
			System.out.println("사원명은?");
			sawonName=sc.nextLine();
			System.out.println("기본급은?");
			gibonPay=sc.nextInt();
			System.out.println("초과시간수는?");
			timeSu=sc.nextInt();
			System.out.println("가족수는?");
			familySu=sc.nextInt();
		}
	}
	
	class SudangInner{
		
		//수당에 관한 여러 메서드
		public int getTimeSudang()
		{
			return timeSu*20000;
		}
		
		public int getFamilySudang()
		{
			return familySu*50000;
		}
		
		public int totalPay()
		{
			return gibonPay+getFamilySudang()+getTimeSudang();
		}
		
		//출력
		public void wirteSawonDatas()
		{
			System.out.println("사원명\t기본급\t초과시간수\t가족수\t초과시간수당\t가족수당\t총급여");
			System.out.println("==============================================================");
			System.out.println(sawonName+"\t"+gibonPay+"\t"+timeSu+"\t"+familySu+"\t"+getTimeSudang()+"\t"
					+getFamilySudang()+"\t"+totalPay());
		}
	}
}

public class Ex8InnerClassSawon {

	public static void main(String[] args) {
		
		//키보드 입력(내부클래스)
		SawonOuter sawon=new SawonOuter();
		
		SawonOuter.InputInner input=sawon.new InputInner();
		input.inputData(); 
		
		SawonOuter.SudangInner sudang=sawon.new SudangInner();
		sudang.wirteSawonDatas();
	}

}
