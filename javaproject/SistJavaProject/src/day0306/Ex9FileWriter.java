package day0306;

import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

public class Ex9FileWriter {
	
	Scanner sc;
	FileWriter fw; //null
	static final String FILENAME="C:\\sist0217\\work\\member1.txt";
	
	public Ex9FileWriter() {
		sc=new Scanner(System.in);
	}
	
	public void dateWrite()
	{
//		FileWriter fw=null;
//		Scanner sc=new Scanner(System.in);
		try {
			fw=new FileWriter(FILENAME, true);
			
			//키보드로 입력
			System.out.println("이름입력");
			String name=sc.nextLine();
			System.out.println("핸드폰번호입력");
			String hp=sc.nextLine();
			System.out.println("주소입력");
			String addr=sc.nextLine();
			
			System.out.println("**파일저장..파일확인하세요!!!**");
			
			
			//파일에 저장
			fw.write("회원명: "+name+"\n");
			fw.write("주소: "+addr+"\n");
			fw.write("휴대폰번호: "+hp+"------------------\n");
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				fw.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Ex9FileWriter ex9=new Ex9FileWriter();
		ex9.dateWrite();
		
	}

}
