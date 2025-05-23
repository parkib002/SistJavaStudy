package day0304;

import java.util.Scanner;

/*	보너스는 개발부만 백만 나머지 부서는 50만원 특별지급
 * 사원명?
 * 홍길동
 * 부서
 * 개발부
 * 기본급?
 * 2000000
 * =======================================
 * 사원명		부서		기본급	보너스	총급여
 * 홍길동		개발부	2000000	1000000	3000000
 * 
 */

class Sawon{
	
	private String sawonName,buseo;
	private int gibonPay;
	
	
	//명시적 생성자(3가지 인자 초기화하는 값 넘기기)
	public Sawon(String sawonName,String buseo,int gibonPay) 
	{
		this.sawonName=sawonName;
		this.buseo=buseo;
		this.gibonPay=gibonPay;
		
	}
	
	//메서드_getBonus
	public int getBonus()
	{
		int a;
		if(buseo.equals("개발부"))
			a=1000000;
		else
			a=500000;
		return a;
	}
	//메서드_getTotalPay
	public int getTotalPay()
	{
		int tot;
		tot=gibonPay+getBonus();
		return tot;
	}
	
	//최종급여출력_
	public void writeSawonPay()
	{
		System.out.println("=============================================");
		System.out.println("사원명\t부서\t기본급\t보너스\t총급여");
		System.out.println(sawonName+"\t"+buseo+"\t"+gibonPay+"\t"+getBonus()+"\t"+getTotalPay());
	}
	
}
///////////////////////////////
public class QuizSawon {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String name,buseo;
		Sawon sawon;
		int gibonPay;
		
		Scanner sc=new Scanner(System.in);
		
		System.out.println("사원명?");
		name=sc.nextLine();
		System.out.println("부서명?");
		buseo=sc.nextLine();
		System.out.println("기본급?");
		gibonPay=sc.nextInt();
		
		sawon=new Sawon(name, buseo, gibonPay);
		sawon.writeSawonPay();
	}

}
