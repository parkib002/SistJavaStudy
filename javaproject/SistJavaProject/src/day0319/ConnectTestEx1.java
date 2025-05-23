package day0319;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectTestEx1 {

	static final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	
	public void connectSawon()
	{
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		String sql="select * from Sawon order by num"; //사원테이블을 num의 오름차순으로 조회
		
		try {
			conn=DriverManager.getConnection(URL, "parkib002", "a1234");
			
			System.out.println("오라클서버에 연결 성공!!!");
			
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			while(rs.next())
			{
				//db로부터 데이터 가져오기
				int num=rs.getInt("num"); //1열도 가능
				String name=rs.getString("name");
				String gender=rs.getString("gender");
				String buseo=rs.getString("buseo");
				int pay=rs.getInt("pay");
				
				System.out.println(num+"\t"+name+"\t"+gender+"\t"+buseo+"\t"+pay);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("오라클서버에 연결 실패!!!");
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	//음식명의 오름차순 정렬
	public void connectFoodmenu()
	{
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		String sql="select * from foodmenu order by food_name";
		
		try {
			conn=DriverManager.getConnection(URL, "parkib002", "a1234");
			
			System.out.println("오라클서버에 연결 성공!!!");
			
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			System.out.println("\t\t**가게 목록**");
			
			System.out.println("주문번호"+"\t"+"음식명"+"\t"+"가게위치"+"\t\t"+"가격"+"\t"+"가게명");
			System.out.println("---------------------------------------------------------");
			
			while(rs.next())
			{
				int fno=rs.getInt("fno");
				String food_name=rs.getString("food_name");
				String loc=rs.getString("loc");
				int price=rs.getInt("price");
				String shop_name=rs.getString("shop_name");
				
				System.out.println(fno+"\t"+food_name+"\t"+loc+"\t"+price+"\t"+shop_name);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("오라클서버에 연결 실패!!!");
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ConnectTestEx1 ct=new ConnectTestEx1();
		//ct.connectSawon();
		ct.connectFoodmenu();
	}

}
