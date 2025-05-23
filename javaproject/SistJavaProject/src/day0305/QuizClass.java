package day0305;

import java.text.NumberFormat;
import java.util.Scanner;

class Company{
	
	 private String staff,position; //직원명,직급
	 private int famSu; //가족수
	 
	 //디폴트 생성자
	 public Company() {
		// TODO Auto-generated constructor stub
	}
	 
	 //사원명,직급,가족수를 인자로 받는 생성자
	 public Company(String staff,String position,int famsu)
	 {
		 this.staff=staff;
		 this.position=position;
		 this.famSu=famsu;
	 }
	 
	//각각의 setter & getter
	public String getStaff() {
		return staff;
	}

	public void setStaff(String staff) {
		this.staff = staff;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public int getFamSu() {
		return famSu;
	}

	public void setFamSu(int famSu) {
		this.famSu = famSu;
	}
	 
	 //직급에 따라 기본급:  부장->450  과장->350  대리->280  사원->220  getGibonPay()
	public int getGibonPay()
	{
		int gibon=switch(position)
			{
				case "부장"->4500000;
				case "과장"->3500000;
				case "대리"->2800000;
				case "사원"->2200000;
				default->0;
			};
			return gibon;
		
		/*int a=0;
		if(position.equals("부장"))
			a=450;
		else if(position.equals("과장"))
			a=350;
		else if(position.equals("대리"))
			a=280;
		else
			a=220;
		return a;*/
	}
	
	 //직급에 따라 수당:  부장,과장==>100  대리,사원==>70  getSudangPay()
	 public int getSudangPay()
	 {
		 int b=0;
		 if(position.equals("부장") || position.equals("과장"))
			 b=1000000;
		 else 
			 b=700000;
		 return b;
				 
	 }
	 //가족수가 5인이상:  30만 5인미만2인이상은 10만원 나머지는 0  getFamSudang()
	 public int getFamSudang()
	 {
		 int c=0;
		 if(famSu>=5)
			 c=3000000;
		 else if(famSu>=2)
			 c=1000000;
		 else
			 c=0;
		 return c;
	 }
	 //세금:  기본급의 5%를 반환 받아서 세금  getTax()
	 public double getTax()
	 {
		 double tax;
		 tax=getGibonPay()*0.05;
		 return tax;
	 }
	 //실수령액:  기본급+수당+가족수당-세금  getNetPay()
	 public double getNetPay()
	 {
		 double tot;
		 tot=getGibonPay()+getSudangPay()+getFamSudang()-getTax();
		 return tot;
	 }
}
///////////////////////////
public class QuizClass {
	
	
	//제목출력 메서드(showTitle())
	public static void showTitle()
	{
		System.out.println("사원명"+"\t"+"직급"+"\t"+"기본급"+"\t"+"수당"+"\t"+"가족수당"+"\t"+
							"세금"+"\t"+"실수령액");
		System.out.println("=========================================================================");
	}
	
	public void writeSawon(Company[] company)
	{
		showTitle();
		NumberFormat nf=NumberFormat.getInstance();
		for(Company c:company)
		{
			System.out.println(c.getStaff()+"\t"+c.getPosition()+"\t"+nf.format(c.getGibonPay())+"\t"+nf.format(c.getSudangPay())+"\t"
								+nf.format(c.getFamSudang())+"\t"+nf.format(c.getGibonPay())+"\t"
								+nf.format(c.getTax())+"\t"+nf.format(c.getNetPay()));
			
		}
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 인원수를 입력 후 인원수만큼 배열 메모리에 할당
		int inwon;
		Company [] myCompany;
		Scanner sc=new Scanner(System.in);
		
		System.out.println("인원수를 입력하시오");
		inwon=Integer.parseInt(sc.nextLine());
		
		myCompany=new Company[inwon];
		
		for(int i=0;i<inwon;i++)
		{	
			System.out.println("직원명을 입력하시오");
			String a=sc.nextLine();
			System.out.println("직급을 입력하시오");
			String b=sc.nextLine();
			System.out.println("가족수를 입력하시오");
			int c=Integer.parseInt(sc.nextLine());
			
			myCompany[i]=new Company(a, b, c);
		}
			
		QuizClass a=new QuizClass();
		a.writeSawon(myCompany);
		
		
		
	}

}
