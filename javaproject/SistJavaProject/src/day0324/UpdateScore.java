package day0324;

import java.awt.Color;
import java.awt.Container;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;

public class UpdateScore extends JFrame{
	
	Container cp;
	JTextField tfName,tfJava,tfJsp,tfSpring;
	JComboBox<String> cbBan;
	JButton btnMod;
	String num; //수정할 번호
	
	//생성자
	public UpdateScore(String title) {
		super(title); //JFrame부모생성자를 통해서 창제목을 통해서 제목을 보게하자
		
		//위치 너비
		this.setBounds(500, 100, 250, 300);
		
		cp=this.getContentPane();
		//this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		cp.setBackground(new Color(255, 200, 200));
		initDesign();
		//this.setVisible(true);
	}
	
	public void initDesign()
	{
		this.setLayout(null);
		
		JLabel title1=new JLabel("학생명");
		JLabel title2=new JLabel("반");
		JLabel title3=new JLabel("Java");
		JLabel title4=new JLabel("Jsp");
		JLabel title5=new JLabel("Spring");
		
		title1.setBounds(30, 20, 50, 50);
		title2.setBounds(30, 50, 50, 50);
		title3.setBounds(30, 80, 50, 50);
		title4.setBounds(30, 110, 50, 50);
		title5.setBounds(30, 140, 50, 50);
		
		this.add(title1);
		this.add(title2);
		this.add(title3);
		this.add(title4);
		this.add(title5);
		
		tfName=new JTextField(4);
		String [] ban= {"1강의장","2강의장","3강의장","4강의장"};
		cbBan=new JComboBox<String>(ban);
		tfJava=new JTextField(4);
		tfJsp=new JTextField(4);
		tfSpring=new JTextField(4);
		
		tfName.setBounds(90, 35, 70, 20);
		this.add(tfName);
		cbBan.setBounds(90, 65, 70, 20);
		this.add(cbBan);
		tfJava.setBounds(90, 95, 70, 20);
		this.add(tfJava);
		tfJsp.setBounds(90, 125, 70, 20);
		this.add(tfJsp);
		tfSpring.setBounds(90, 155, 70, 20);
		this.add(tfSpring);
		
		//버튼
		btnMod=new JButton("수정");
		btnMod.setBounds(70, 200, 100, 25);
		this.add(btnMod);
	}
	
//	public static void main(String[] args) {
//		// TODO Auto-generated method stub
//    
//		new AddScore("성적 수정폼");
//	}
}
