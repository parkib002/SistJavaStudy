package spring.di.ex5;

import java.util.ArrayList;

public class SawonInfo {
	
	private String sname;
	private ArrayList<String> buseo;
	private int pay;
	private String position;
	
	//name, postion 积己磊 林涝
	public SawonInfo(String name,String position) {

		this.sname=name;
		this.position=position;
	}

	//buseo, pay setter 林涝
	public void setBuseo(ArrayList<String> buseo) {
		this.buseo = buseo;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	//葛电 getter
	public String getSname() {
		return sname;
	}

	public String getPosition() {
		return position;
	}

	public ArrayList<String> getBuseo() {
		return buseo;
	}

	public int getPay() {
		return pay;
	}
	
}
