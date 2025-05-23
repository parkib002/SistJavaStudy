package day0321;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

import day0319.DbConnect;

public class StuInfoTest {

	DbConnect db=new DbConnect();
	Scanner sc=new Scanner(System.in);
	
	public void insertStuinfo()
	{
		System.out.println("이름을 입력하세요");
		String sname=sc.nextLine();
		System.out.println("주소 입력하세요");
		String saddr=sc.nextLine();
		System.out.println("혈액형을 입력하세요");
		String sblood=sc.nextLine();
		System.out.println("전화번호를 입력하세요");
		String shp=sc.nextLine();
		System.out.println("학년을 입력하세요");
		int sgrade=Integer.parseInt(sc.nextLine());
		System.out.println("나이를 입력하세요");
		int sage=Integer.parseInt(sc.nextLine());
		System.out.println("생년월일을 입력하세요");
		String sbirth=sc.nextLine();
		
		String sql="insert into stuinfo values(seq_test.nextval,?,?,?,?,?,?,?,sysdate)";
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, sname);
			pstmt.setString(2, saddr);
			pstmt.setString(3, sblood);
			pstmt.setString(4, shp);
			pstmt.setInt(5, sgrade);
			pstmt.setInt(6, sage);
			pstmt.setString(7, sbirth);
			
			int a=pstmt.executeUpdate();
			
			if(a==1)
				System.out.println("학생정보입력성공!!!");
			else
				System.out.println("학생정보입력실패!!!");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	public void selectStuinfo()
	{
		String sql="select * from stuinfo order by stu_no";
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		System.out.println("\t\t\t\t\t[학생정보]");
		System.out.println("학생번호\t이름\t주소\t\t혈액형\t전화번호\t\t학년\t나이\t생년월일\t\t등록날짜");
		System.out.println("===================================================================================="
				+ "===============================================");
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				System.out.println(rs.getInt("stu_no")+"\t"+rs.getString("stu_name")+"\t"+rs.getString("stu_addr")
				+"\t"+rs.getString("stu_blood")+"\t"+rs.getString("stu_hp")+"\t"+rs.getInt("stu_grade")+"\t"
				+rs.getInt("stu_age")+"\t"+rs.getString("birth")+"\t"+rs.getDate("writeday"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
	}
	
	public void deleteStuinfo()
	{
		System.out.println("삭제할 학생번호를 입력해주세요");
		int num=Integer.parseInt(sc.nextLine());
		
		String sql="delete from stuinfo where stu_no=?";
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			int a=pstmt.executeUpdate();
			
			if(a==1)
				System.out.println("학생정보삭제성공!!!");
			else
				System.out.println("학생정보삭제실패!!!");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	public boolean isOneData(int num)
	{
		boolean flag=false;
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from Stuinfo where stu_no=?";

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next())
				flag=true;
		
			else
				flag=false;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return flag;
	}
	
	public void updateStuinfo()
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		System.out.println("수정할 학생번호를 입력하세요");
		int num=Integer.parseInt(sc.nextLine());
		
		if(!this.isOneData(num))
		{
			System.out.println("존재하지 않는 학생번호입니다");
			return;
		}
		System.out.println("수정할 이름을 입력하세요");
		String name=sc.nextLine();
		System.out.println("수정할 주소 입력하세요");
		String addr=sc.nextLine();
		System.out.println("수정할 혈액형을 입력하세요");
		String blood=sc.nextLine();
		System.out.println("수정할 전화번호를 입력하세요");
		String hp=sc.nextLine();
		System.out.println("수정할 학년을 입력하세요");
		int grade=Integer.parseInt(sc.nextLine());
		System.out.println("수정할 나이를 입력하세요");
		int age=Integer.parseInt(sc.nextLine());
		System.out.println("수정할 생년월일을 입력하세요");
		String birth=sc.nextLine();
		
		String sql="update stuinfo set stu_name=?,stu_addr=?,stu_blood=?,stu_hp=?,stu_grade=?,stu_age=?"
				+ ",birth=? where stu_no=?";
		System.out.println(sql);
		
		
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, addr);
			pstmt.setString(3, blood);
			pstmt.setString(4, hp);
			pstmt.setInt(5, grade);
			pstmt.setInt(6, age);
			pstmt.setString(7, birth);
			pstmt.setInt(8, num);
			
			int a=pstmt.executeUpdate();
			
			if(a==1)
				System.out.println("학생정보수정성공!!!");
			else
				System.out.println("학생정보수정실패!!!");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public void searchStuinfo()
	{
		System.out.println("검색할 학생의 성을 입력하세요");
		String sung=sc.nextLine();
		
		String sql="select * from stuinfo where stu_name like ? order by stu_no";
		
		System.out.println("\t\t\t\t\t[학생정보]");
		System.out.println("학생번호\t이름\t주소\t\t혈액형\t전화번호\t\t학년\t나이\t생년월일\t\t등록날짜");
		System.out.println("===================================================================================="
				+ "===============================================");
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, sung+"%");
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				System.out.println(rs.getInt("stu_no")+"\t"+rs.getString("stu_name")+"\t"+rs.getString("stu_addr")
				+"\t"+rs.getString("stu_blood")+"\t"+rs.getString("stu_hp")+"\t"+rs.getInt("stu_grade")+"\t"
				+rs.getInt("stu_age")+"\t"+rs.getString("birth")+"\t"+rs.getDate("writeday"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
				
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		StuInfoTest sit=new StuInfoTest();
		Scanner sc=new Scanner(System.in);
		int n;
		
		while(true)
		{
		
		System.out.println("1.학생정보입력  2.학생정보출력  3.학생정보삭제  4.학생정보수정  5.학생검색(성)  9.종료");
		n=Integer.parseInt(sc.nextLine());
			
		if(n==1)
			sit.insertStuinfo();
		
		else if(n==2)
			sit.selectStuinfo();
		
		else if(n==3)
			sit.deleteStuinfo();
		
		else if(n==4)
			sit.updateStuinfo();
		
		else if(n==5)
			sit.searchStuinfo();
		
		else if(n==9)
		{
			System.out.println("검색을 종료합니다");
			break;
		}
		}
	}

}
