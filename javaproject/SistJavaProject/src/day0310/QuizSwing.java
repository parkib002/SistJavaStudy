package day0310;

import java.awt.Color;
import java.awt.Container;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;
import javax.swing.border.TitledBorder;

public class QuizSwing extends JFrame implements ActionListener{
	
	JLabel lblnum1,lblnum2,lblTitle,lblResult;
	JTextField su1,su2;
	JButton btn1,btn2,btn3,btn4;

	Container cp;

	//생성자
	public QuizSwing(String title) {
		super(title); //JFrame부모생성자를 통해서 창제목을 통해서 제목을 보게하자
		
		//위치 너비
		this.setBounds(500, 100, 400, 700);
		
		cp=this.getContentPane();
		cp.setBackground(new Color(255,255,200));
		initDesign();
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.setVisible(true);
	}
	
	public void initDesign()
	{
		this.setLayout(null);
		
		lblTitle=new JLabel("간단한 사칙연산");
		lblnum1=new JLabel("숫자1");
		lblnum2=new JLabel("숫자2");
		
		lblTitle.setBounds(120, 50, 150, 50);
		lblTitle.setFont(new Font("", Font.BOLD, 20));
		lblnum1.setBounds(50, 125, 100, 50);
		lblnum2.setBounds(50, 205, 100, 50);
		
		this.add(lblTitle);
		this.add(lblnum1);
		this.add(lblnum2);
		
		su1=new JTextField();
		su2=new JTextField();
		
		su1.setBounds(100, 135, 200, 35);
		su2.setBounds(100, 215, 200, 35);
		
		this.add(su1);
		this.add(su2);
		
		btn1=new JButton("더하기");
		btn2=new JButton("빼기");
		btn3=new JButton("곱하기");
		btn4=new JButton("나누기");
		
		btn1.setBounds(0, 300, 384, 35);
		btn2.setBounds(0, 350, 384, 35);
		btn3.setBounds(0, 400, 384, 35);
		btn4.setBounds(0, 450, 384, 35);
		
		this.add(btn1);
		this.add(btn2);
		this.add(btn3);
		this.add(btn4);
		
		lblResult=new JLabel("계산결과");
		lblResult.setBounds(100, 550, 200, 50);
		lblResult.setBorder(new TitledBorder("결과확인"));
		lblResult.setFont(new Font("", Font.BOLD, 20));
		this.add(lblResult);
		
		btn1.addActionListener(this);
		btn2.addActionListener(this);
		btn3.addActionListener(this);
		btn4.addActionListener(this);
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		
		Object ob=e.getSource();
		
		int a=Integer.parseInt(su1.getText().trim());
		int b=Integer.parseInt(su2.getText().trim());
		
		int sum=a+b;
		
		String s=a+"+"+b+"="+sum;
		
		int minus=a-b;
		
		String m=a+"-"+b+"="+minus;
		
		int multiple=a*b;
		
		String mul=a+"*"+b+"="+multiple;
		
		int na=a/b;
		
		String n=a+"/"+b+"="+na;
		
		if(ob==btn1)
			lblResult.setText(s);
		
		else if(ob==btn2)
			lblResult.setText(m);
		
		else if(ob==btn3)
			lblResult.setText(mul);
		
		else if(ob==btn4)
			lblResult.setText(n);
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		new QuizSwing("QuizSwing");
	}

}
	

