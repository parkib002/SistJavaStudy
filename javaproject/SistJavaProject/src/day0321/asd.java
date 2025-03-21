package day0321;

import java.awt.Color;
import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;

import javax.swing.JFrame;

public class asd extends JFrame implements ItemListener,ActionListener{

	Container cp;
	//생성자
	public asd(String title) {
		super(title); //JFrame부모생성자를 통해서 창제목을 통해서 제목을 보게하자
		
		//위치 너비
		this.setBounds(1000, 100, 700, 500);
		
		cp=this.getContentPane();
	this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		cp.setBackground(Color.white);
		
		this.setVisible(true);
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
    
		new asd("사원테이블 DB");
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void itemStateChanged(ItemEvent e) {
		// TODO Auto-generated method stub
		
	}
}