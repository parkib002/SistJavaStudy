package day0319;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

public class ConnectTestEx3 {

	static final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	
	//shop+cart
	//카트담긴일련번호 idx, 상품명, 색상, 갯수, 구입한 날짜
	
	public void connectShopCart()
	{
		Date d=new Date();
		
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		String sql="select idx,sangpum,color,cnt,guipday from shop s,cart1 c where s.num=c.num";
		
		try {
			conn=DriverManager.getConnection(URL, "parkib002", "a1234");
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			System.out.println("\t\t\t오라클 연결 성공!!!");
			System.out.println("\t\t\t상품 입고 목록");
			System.out.println("상품일련번호\t상품명\t색상\t입고갯수\t입고날짜");
			System.out.println("---------------------------------------------------------------------------");
			
			while(rs.next())
			{
			int idx=rs.getInt("idx");
			String sangpum=rs.getString("sangpum");
			String color=rs.getString("color");
			int cnt=rs.getInt("cnt");
			
			System.out.println(idx+"\t\t"+sangpum+"\t"+color+"\t"+cnt+"\t"+rs.getDate("guipday"));
			}
			} catch (SQLException e) {
			// TODO Auto-generated catch block
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

			ConnectTestEx3 ct3=new ConnectTestEx3();
			ct3.connectShopCart();
	}

}
