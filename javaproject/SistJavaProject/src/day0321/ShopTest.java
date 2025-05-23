package day0321;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

import day0319.DbConnect;

public class ShopTest {

	DbConnect db=new DbConnect();
	Scanner  sc=new Scanner(System.in);
	
	public void insertSangpum()
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		System.out.println("타입(음료 or 과자)?");
		String type=sc.nextLine();
		System.out.println("상품명?");
		String sname=sc.nextLine();
		System.out.println("수량?");
		int su=Integer.parseInt(sc.nextLine());
		System.out.println("단가?");
		int dan=Integer.parseInt(sc.nextLine());
		
		//prepareStatement 객체는 미완의 sql문을 작성할 수 있다
		//변수를 ?로 표시 후 나중에 바인딩 시켜준다
		String sql="insert into shop values(seq_test.nextval,?,?,?,?,sysdate)";
		System.out.println(sql);
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, type);
			pstmt.setString(2, sname);
			pstmt.setInt(3, su);
			pstmt.setInt(4, dan);
			
			int n=pstmt.executeUpdate();
			
			if(n==1)
				System.out.println("인서트 성공");
			
			else
				System.out.println("인서트 실패");
				
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public void selectSangpum()
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from shop order by num asc";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			System.out.println("시퀀스\t카테고리\t상품명\t수량\t단가\t입고날짜");
			System.out.println("======================================================");
			
			while(rs.next()) 
			{
				System.out.println(rs.getInt("num")+"\t"+rs.getString("type")+"\t"+rs.getString("sname")
				+"\t"+rs.getInt("su")+"\t"+rs.getInt("dan")+"\t"+rs.getDate("ipgoday"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
	}
	
	public void deleteSangpum()
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		System.out.println("삭제할 시퀀스는?");
		int num=Integer.parseInt(sc.nextLine());
		
		String sql="delete from shop where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			int n=pstmt.executeUpdate();
			
			if(n==1)
				System.out.println("삭제성공!!!");
			
			else
				System.out.println("삭제실패!!!");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//수정..메서드 2개  1.num을 인자로 받아서 있는지 없는지 반환  2.수정
	public boolean isOneData(int num)
	{
		boolean flag=false;
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from shop where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			
			//if_1개만 조회할 경우는 if
			if(rs.next()==true)  //데이터가 있는 경우
				flag=true;
			else
				flag=false; //데이터가 없는 경우
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return flag;
	}
	
	public void updateSangpum()
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		System.out.println("수정할 시퀀스 번호는?");
		int num=Integer.parseInt(sc.nextLine());
		
		//여기에서 isOneData를 호출해서 그 번호가 존재하는지 확인
		if(!this.isOneData(num))
		{
			System.out.println("해당 번호는 존재하지 않습니다");
			return;  //메서드 종료
		}
		
		System.out.println("수정할 타입은(1.음료 2.과자)?");
		String type=sc.nextLine();
		System.out.println("수정할 상품명은?");
		String sname=sc.nextLine();
		System.out.println("수정할 수량은?");
		int su=Integer.parseInt(sc.nextLine());
		System.out.println("수정할 단가는?");
		int dan=Integer.parseInt(sc.nextLine());
		
		String sql="update shop set type=?,sname=?,su=?,dan=? where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			//?5개 순서대로 바인딩
			pstmt.setString(1, type);
			pstmt.setString(2, sname);
			pstmt.setInt(3, su);
			pstmt.setInt(4, dan);
			pstmt.setInt(5, num);
			
			int a=pstmt.executeUpdate();
			
			if(a==1)
				System.out.println("상품수정성공!!");
			else
				System.out.println("상품수정실패!!");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//상품명의 일부를 검색해서 찾기(상품명이 어디든 포함되면...)
	public void searchSangpum()
	{
		System.out.println("상품명의 일부를 검색하세요");
		String a=sc.nextLine();
		
		String sql="select * from shop where sname like ?";
		System.out.println(sql);
		
		System.out.println("시퀀스\t타입\t상품명\t수량\t단가\t입고날짜");
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,"%"+a+"%");
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				System.out.println(rs.getInt("num")+"\t"+rs.getString("type")+"\t"+rs.getString("sname")
				+"\t"+rs.getInt("su")+"\t"+rs.getInt("dan")+"\t"+rs.getDate("ipgoday"));
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
		
		ShopTest st=new ShopTest();
		Scanner sc=new Scanner(System.in);
		int n;
		
		while(true)
		{
			System.out.println("**상품입고**");
			System.out.println("1. 상품추가  2.상품삭제  3.상품수정  4.재고출력  5.상품명 일부로 검색  9.종료");
			n=Integer.parseInt(sc.nextLine());
			
			if(n==1)
				st.insertSangpum();
			
			else if(n==2)
				st.deleteSangpum();
			
			else if(n==3)
				st.updateSangpum();
			
			else if(n==4)
				st.selectSangpum();
			
			else if(n==5)
				st.searchSangpum();
			
			else if(n==9)
			{
				System.out.println("종료합니다");
				break;
			}
		}

	}

}

