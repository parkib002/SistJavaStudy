package day0306;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.StringTokenizer;

public class Ex5FruitRead {

		//메서드 만든 후 출력하시오  		제목은 과일입고현황 		과일명	입고수량	입고단가
	public static void read()
	{
		String fileName="C:\\sist0217\\work\\fruit.txt";
		FileReader fr=null;
		BufferedReader br=null;
		int tot;
		
		 try {
			fr=new FileReader(fileName);
			br=new BufferedReader(fr);

			
			System.out.println("\t[과일입고현황]");
			System.out.println("번호\t과일명\t입고수량\t입고단가\t총금액");
			System.out.println("-------------------------------");
			
			int n=0;
			while(true)
			{
				String s=br.readLine();
				
				if(s==null)
					break;
				
//				StringTokenizer st=new StringTokenizer(s,":");
//				String sangname=st.nextToken();
//				int su=Integer.parseInt(st.nextToken());
//				int dan=Integer.parseInt(st.nextToken());
//				int total=su*dan;
//				
//				System.out.println(++n +"\t"+sangname+"\t"+su+"개\t"+dan+"원\t"+total+"원");
				
				String [] s1=s.split(":");
				tot=Integer.parseInt(s1[1])*Integer.parseInt(s1[2]);
				System.out.println(++n+"\t"+s1[0]+"\t"+s1[1]+"\t"+s1[2]+"\t"+tot);
				
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (IOException e) {
			// TODO: handle exception
		}finally {
			try {
				br.close();
				fr.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		read();
	}

}
