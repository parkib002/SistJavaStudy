package spring.di.ex5;

import spring.di.ex4.Sawon;

public class Emp {

	SawonInfo sawon;
	String empName;
	String empLoc;
	
	//empName������ ����
	public Emp(String name) {
	
		this.empName=name;
	}
	
	//sawon, empLoc setter ����
	public void setSawon(SawonInfo sawon) {
		this.sawon = sawon;
	}

	public void setEmpLoc(String empLoc) {
		this.empLoc = empLoc;
	}
	
	//���������� �޼���
	public void writeEmp() {
		
		System.out.println("ȸ���: "+empName);
		System.out.println("ȸ����ġ: "+empLoc);
		System.out.println("�����: "+sawon.getSname());
		System.out.println("�޿�: "+sawon.getPay());
		System.out.println("����: "+sawon.getPosition());
		System.out.print("�μ�: ");
		
		for(String b:sawon.getBuseo()) {
			System.out.print(b+" ");
		}
	}
}
