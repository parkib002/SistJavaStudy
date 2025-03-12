package day0228;

import java.util.Scanner;

class StudentScore{
	
	String stuName;
	private int java;
	private int html;
	private int mysql;
	
	public String getStuName() {
		return stuName;
	}
	public void setStuName(String stuName) {
		this.stuName = stuName;
	}
	public int getJava() {
		return java;
	}
	public void setJava(int java) {
		this.java = java;
	}
	public int getHtml() {
		return html;
	}
	public void setHtml(int html) {
		this.html = html;
	}
	public int getMysql() {
		return mysql;
	}
	public void setMysql(int mysql) {
		this.mysql = mysql;
	}
	
	public int getTotal()
	{
		int tot=getJava()+getHtml()+getMysql();
		return tot;
	}
	
	public double getAverage()
	{
		double avg=getTotal()/3.0;
		return avg;
	}
	
	public String getPungga()
	{
		String p;
		if(getAverage()>=90)
			p="장학생";
		else if(getAverage()>=80)
			p="우수생";
		else
			p="재수강";
		return p;
	}
	
	public static void showTitle()
	{
		System.out.println("이름\tJava\tHtml\tMysql\t총점\t평균\t평가");
		System.out.println("====================================================================");
	}
}

public class StudentScoreResult {
	
	public static void showDatas(StudentScore[] stu)
	{
		StudentScore.showTitle();
		for(StudentScore s:stu)
		{
			System.out.println(s.getStuName()+"\t"+s.getJava()+"\t"+s.getHtml()+"\t"+s.getMysql()+"\t"+s.getTotal()
			+"\t"+s.getAverage()+"\t"+s.getPungga());
		}
			
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int a;
		StudentScore [] stu;

		Scanner sc=new Scanner(System.in);
		System.out.println("인원을 입력하세요");
		a=Integer.parseInt(sc.nextLine());
		
		stu=new StudentScore[a];
		
		for(int i=0;i<a;i++)
		{
			stu[i]=new StudentScore();
			System.out.println("이름");
			String name=sc.nextLine();
			System.out.println("Java");
			int java=Integer.parseInt(sc.nextLine());
			System.out.println("Html");
			int html=Integer.parseInt(sc.nextLine());
			System.out.println("Mysql");
			int mysql=Integer.parseInt(sc.nextLine());
			
			stu[i].setStuName(name);
			stu[i].setJava(java);
			stu[i].setHtml(html);
			stu[i].setMysql(mysql);
		}
		showDatas(stu);
	}

}
