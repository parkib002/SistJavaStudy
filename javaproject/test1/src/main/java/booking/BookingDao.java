package booking;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import db.DbConnect;

public class BookingDao {
	
  DbConnect db=new DbConnect();
  
  public void insertBooking(BookingDto dto)
  {
	  Connection conn=db.getConnection();
	  PreparedStatement pstmt=null;
	  
	  String sql="insert into booking values (seq_hello.nextval,?,?,?,?,?,?,?,sysdate)";
	  
	  try {
		pstmt=conn.prepareStatement(sql);
		//바인딩
		pstmt.setString(1, dto.getName());
		pstmt.setString(2, dto.getGender());
		pstmt.setString(3, dto.getBookday());
		pstmt.setInt(4, dto.getInwon());
		pstmt.setString(5, dto.getFoodphoto());
		pstmt.setString(6, dto.getFoodprice());
		pstmt.setString(7, dto.getMessage());
		
		pstmt.execute();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		db.dbClose(pstmt, conn);
	}
	  
  }
  
  //전체출력
  public Vector<BookingDto> getAllBookings()
  {
	  Vector<BookingDto> list=new Vector<BookingDto>();
	  
	  Connection conn=db.getConnection();
	  PreparedStatement pstmt=null;
	  ResultSet rs=null;
	  
	  String sql="select * from booking order by num asc";
	  
	  try {
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		while(rs.next())
		{
			BookingDto dto=new BookingDto();
			
			dto.setNum(rs.getString("num"));
			dto.setName(rs.getString("name"));
			dto.setBookday(rs.getString("bookday"));
			dto.setFoodphoto(rs.getString("foodphoto"));
			dto.setFoodprice(rs.getString("foodprice"));
			dto.setGender(rs.getString("gender"));
			dto.setInwon(rs.getInt("inwon"));
			dto.setMessage(rs.getString("message"));
			dto.setWriteday(rs.getTimestamp("writeday"));
			
			list.add(dto);
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		db.dbClose(rs, pstmt, conn);
	}
	  
	  
	  return list;
  }
  
//num  에 해당하는 부킹정보 반환
	public BookingDto getBooking(String num)
	{
		BookingDto dto=new BookingDto();
		String sql="select * from booking where num=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, num);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setBookday(rs.getString("bookday"));
				dto.setFoodphoto(rs.getString("foodphoto"));
				dto.setFoodprice(rs.getString("foodprice"));
				dto.setGender(rs.getString("gender"));
				dto.setInwon(rs.getInt("inwon"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				dto.setMessage(rs.getString("message"));				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;
	}
	
	public void deleteBooking(String num)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="delete from booking where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, num);
			
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	public void updateBooking(String num)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="update booking set name=?,gender=?,bookday=?,inwon=?,message=?,foodphoto=?,foodprice=? where num=?";
		
		try {
			BookingDto dto=new BookingDto();
			
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getGender());
			pstmt.setString(3, dto.getBookday());
			pstmt.setInt(4, dto.getInwon());
			pstmt.setString(5, dto.getMessage());
			pstmt.setString(6, dto.getFoodphoto());
			pstmt.setString(7, dto.getFoodprice());
			pstmt.setString(8, num);
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
		
	}
  
  
}