package day0326;

import java.awt.Canvas;
import java.awt.Color;
import java.awt.Container;
import java.awt.FileDialog;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;
import javax.swing.border.LineBorder;

import oracle.net.aso.j;

public class ShopAdd extends JFrame implements ActionListener{
	
	Container cp;
	JTextField tfSang,tfSu,tfDan;
	JLabel lblPhoto;
	String imageName;
	JButton btnAdd,btnImage;
	
	PhotoDraw pdraw=new PhotoDraw(); //내부클래스
	ShopDbModel db=new ShopDbModel();
	
	//생성자
	public ShopAdd(String title) {
		super(title); //JFrame부모생성자를 통해서 창제목을 통해서 제목을 보게하자
		
		//위치 너비
		this.setBounds(1000, 100, 700, 500);
		
		cp=this.getContentPane();
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		cp.setBackground(Color.white);
		initdesign();
		this.setVisible(true);
	}
	
	//디자인
	public void initdesign()
	{
		this.setLayout(null);
		
		JLabel lbl1=new JLabel("상품명");
		lbl1.setBounds(30, 20, 50, 30);
		this.add(lbl1);
		
		tfSang=new JTextField();
		tfSang.setBounds(90, 25, 100, 20);
		this.add(tfSang);
		
		//이미지 불러오는 버튼
		btnImage=new JButton("사진선택");
		btnImage.setBounds(150, 350, 150, 30);
		this.add(btnImage);
		
		btnImage.addActionListener(this);
		
		//이미지 위치 미리 지정
		pdraw.setBounds(300, 100, 200, 200);
		this.add(pdraw);
		
		lblPhoto=new JLabel("이미지명");
		lblPhoto.setBounds(300, 25, 250, 20);
		lblPhoto.setBorder(new LineBorder(Color.PINK));
		this.add(lblPhoto);
		
		JLabel lbl2=new JLabel("수량");
		lbl2.setBounds(30, 100, 50, 30);
		this.add(lbl2);
		
		tfSu=new JTextField();
		tfSu.setBounds(90, 105, 100, 20);
		this.add(tfSu);
		
		JLabel lbl3=new JLabel("단가");
		lbl3.setBounds(30, 180, 50, 30);
		this.add(lbl3);
		
		tfDan=new JTextField();
		tfDan.setBounds(90, 185, 100, 20);
		this.add(tfDan);
		
		//insert버튼
		btnAdd=new JButton("DB추가");
		btnAdd.setBounds(350, 350, 150, 30);
		btnAdd.addActionListener(this);
		this.add(btnAdd);
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		
		Object ob=e.getSource();
		
		if(ob==btnImage)
		{
			FileDialog dlg=new FileDialog(this, "이미지가져오기", FileDialog.LOAD);
			dlg.setVisible(true);
			
			//이미지명얻기
			imageName=dlg.getDirectory()+dlg.getFile();
			
			//이미지명 라벨에 출력
			lblPhoto.setText(imageName);
			
			//이미지출력
			pdraw.repaint();
		}
		
		else if(ob==btnAdd)
		{
			//shop생성
			ShopDto dto=new ShopDto();
			
			//dto에 4개의 데이터를 넣는다
			dto.setSangpum(tfSang.getText());
			dto.setPhoto(imageName);
			dto.setSu(Integer.parseInt(tfSu.getText()));
			dto.setDan(Integer.parseInt(tfDan.getText()));
			
			//insert
			db.insertShop(dto);
			
			//현재창닫기
			this.setVisible(false);
		}
		
	}
	
	//내부클래스
	class PhotoDraw extends Canvas{
		
		@Override
		public void paint(Graphics g) {
			// TODO Auto-generated method stub
			super.paint(g);
	
			if(imageName!=null)
			{
				Image image=new ImageIcon(imageName).getImage();
				g.drawImage(image, 100, 50, 100, 100, this);
			}
		}
	}
	
//	public static void main(String[] args) {
//		// TODO Auto-generated method stub
//    
//		new ShopAdd("상품입력폼");
//	}
	
}


