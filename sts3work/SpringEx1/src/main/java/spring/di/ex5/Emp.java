package spring.di.ex5;

import spring.di.ex4.Sawon;

public class Emp {

	SawonInfo sawon;
	String empName;
	String empLoc;
	
	//empName생성자 주입
	public Emp(String name) {
	
		this.empName=name;
	}
	
	//sawon, empLoc setter 주입
	public void setSawon(SawonInfo sawon) {
		this.sawon = sawon;
	}

	public void setEmpLoc(String empLoc) {
		this.empLoc = empLoc;
	}
	
	//사원정보출력 메서드
	public void writeEmp() {
		
		System.out.println("회사명: "+empName);
		System.out.println("회사위치: "+empLoc);
		System.out.println("사원명: "+sawon.getSname());
		System.out.println("급여: "+sawon.getPay());
		System.out.println("직급: "+sawon.getPosition());
		System.out.print("부서: ");
		
		for(String b:sawon.getBuseo()) {
			System.out.print(b+" ");
		}
	}
}
