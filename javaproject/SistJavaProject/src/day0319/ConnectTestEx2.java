package day0319;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectTestEx2 {

	static final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	
	public void connectBoardAnswer()
	{
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		String sql="select b.bno,writer,subject,nickname,content,writeday "
				+ "from board b,answer a where b.bno=a.bno";
		
		try {
			conn=DriverManager.getConnection(URL, "parkib002", "a1234");
			System.out.println("\t\t오라클 연결 성공!!!");
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			System.out.println("\t\t게시판 댓글 리스트");
			System.out.println("---------------------------------------------------------------");
			
			while(rs.next())
			{
				int bno=rs.getInt("bno");
				String writer=rs.getString("writer");
				String subject=rs.getString("subject");
				String nick=rs.getString("nickname");
				String content=rs.getString("content");
				
				System.out.println(bno+"\t\t"+writer+"\t"+subject+"\t\t"+nick+"\t\t"+content);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("오라클 연결 실패!!!");
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
	
	//sawon_부서별 평균급여 최고급여 최저급여 화폐기호 천단위 구분 기호
	public void connetSawon()
	{
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		String sql="select buseo,avg(pay),to_char(max(pay),'l999,999,999') ,to_char(min(pay),'l999,999,999')"
				+ "from sawon group by buseo";
		
		try {
			conn=DriverManager.getConnection(URL, "parkib002", "a1234");
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			System.out.println("\t\t\t오라클 연결 성공!!!");
			System.out.println("부서\t평균급여\t\t최고급여\t\t\t최저급여");
			while(rs.next())
			{
			
				String buseo=rs.getString("buseo");
				int ap=rs.getInt("avg(pay)");
				String mxp=rs.getString("to_char(max(pay),'l999,999,999')");
				String mnp=rs.getString("to_char(min(pay),'l999,999,999')");
				
				System.out.println(buseo+"\t"+ap+"\t"+mxp+"\t"+mnp);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("오라클 연결 실패!!!");
		}finally {
			try {
				if(rs!=null) rs.close();
				if(stmt!=null);
				if(conn!=null);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	//emp_직급별 평균급여 최고급여 최저급여 화폐기호 천단위 구분 기호
	public void connectEmp()
	{
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		String sql="select job,avg(sal),to_char(max(sal),'l999,999,999'),to_char(min(sal),'l999,999,999')"
				+ "from emp group by job";
		
		try {
			conn=DriverManager.getConnection(URL, "parkib002", "a1234");
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			System.out.println("오라클 연결 성공!!!");
			System.out.println("직업\t평균급여\t최고급여\t최저급여");
			System.out.println("-------------------------------------");
			
			while(rs.next())
			{
				String job=rs.getString("job");
				int ap=rs.getInt("avg(sal)");
				String mxp=rs.getString("to_char(max(sal),'l999,999,999')");
				String mnp=rs.getString("to_char(min(sal),'l999,999,999')");
				
				System.out.println(job+"\t\t"+ap+"\t\t"+mxp+"\t"+mnp);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("오라클 연결 실패!!!");
			e.printStackTrace();
		}finally {
			
				try {
					if(rs!=null) rs.close();
					if(stmt!=null); stmt.close();
					if(conn!=null); 
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		
	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

			ConnectTestEx2 ct2=new ConnectTestEx2();
			//ct2.connectBoardAnswer();
			//ct2.connetSawon();
			//ct2.connectEmp();
	}

}
