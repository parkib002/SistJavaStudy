package day0326;

import java.awt.Color;
import java.awt.Container;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

import day0319.DbConnect;

public class ShopList extends JFrame{
	
	Container cp;
	JTable table;
	DefaultTableModel model;
	
	Vector<ShopDto> list=new Vector<ShopDto>();
	ShopDbModel db=new ShopDbModel();
	DbConnect db1=new DbConnect();

	//생성자
	public ShopList (String title) {
		super(title); //JFrame부모생성자를 통해서 창제목을 통해서 제목을 보게하자
		
		//위치 너비
		this.setBounds(1000, 100, 700, 500);
		
		cp=this.getContentPane();
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		cp.setBackground(Color.white);
		initdesign();
		this.setVisible(true);
	}
	
	public void initdesign()
	{
		this.setLayout(null);
		
		list=db.getAllSangpums();
		
		//table
		String [] title= {"번호","상품명","수량","단가","총금액","구입날짜"};
		model=new DefaultTableModel(title,0);
		table=new JTable(model);
		JScrollPane js=new JScrollPane(table);
		js.setBounds(100, 50, 500, 300);
		this.add(js);
		
		dataWrite();
		
		//익명내부클래스
	
	}
	
	//리스트에 데이터를 추가
	public void dataWrite()
	{
		//테이블의 기존 데이터 삭제
		model.setRowCount(0);
	
		//테이블에 추가
		for(ShopDto dto:list)
		{
			Vector<String> data=new Vector<String>();
			
			data.add(dto.getNum());
			data.add(dto.getSangpum());
			data.add(String.valueOf(dto.getSu()));
			data.add(String.valueOf(dto.getDan()));
			data.add(String.valueOf(dto.getSu()*dto.getDan()));
			data.add(String.valueOf(dto.getGuipday()));
			
			//테이블모델에 추가
			model.addRow(data);
		}
		
	}
	
//	public static void main(String[] args) {
//		// TODO Auto-generated method stub
//    
//		new ShopList("상품조회");
//	}
}




