package day0307;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;


//ArrayList(Vector)로 생성해서 할 것!!!
//MyShop은 디폴트 생성자로 생성할 것
//메인에서 추가를 누르면 입력메서드 호출..
//전체출력을 선택하면 출력메서드 호출됨
//출력모양:	번호		입고상품		수량		가격		총금액
class MyShop{
	
	private String sangName;
	private int su;
	private int price;
	
	public MyShop() {
		// TODO Auto-generated constructor stub
	}

	//setters & getters
	
	public String getSangName() {
		return sangName;
	}

	public void setSangName(String sangName) {
		this.sangName = sangName;
	}

	public int getSu() {
		return su;
	}

	public void setSu(int su) {
		this.su = su;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
}

////////////////////////////
public class QuizList {
	
	List<MyShop> list=new ArrayList<MyShop>();
	
	public void inputData()
	{
		Scanner sc=new Scanner(System.in);
		System.out.println("상품명을 입력하세요");
		String sangname=sc.nextLine();
		System.out.println("수량을 입력하세요");
		int su=Integer.parseInt(sc.nextLine());
		System.out.println("가격을 입력하세요");
		int price=Integer.parseInt(sc.nextLine());
		
		MyShop ms=new MyShop();
		ms.setSangName(sangname);
		ms.setSu(su);
		ms.setPrice(price);
		
		list.add(ms);
		
		System.out.println("데이터 총 갯수: "+list.size()+"개");
	}
	
	public void showData()
	{
		System.out.println("**상품재고현황**");
		System.out.println("-------------------------------------------");
		System.out.println("번호\t입고상품\t수량\t가격\t총금액");
		System.out.println("===========================================");
		for(int i=0;i<list.size();i++)
		{
			MyShop s=list.get(i);
			
			System.out.println((i+1)+"\t"+s.getSangName()+"\t"+s.getSu()+"\t"+s.getPrice()+
					"\t"+(s.getPrice()*s.getSu()));
			System.out.println("===========================================");
		}
	
	}

	public static void main(String[] args) {
		
		Scanner sc=new Scanner(System.in);
		QuizList quiz=new QuizList();
		int num=0;
		
		while(true)
		{
			System.out.println("1.상품정보추가  2.상품정보출력  3.종료");
			num=Integer.parseInt(sc.nextLine());
			
			if(num==1)
			quiz.inputData();
			
			else if(num==2)
			quiz.showData();
			
			else if(num==3)
				{System.out.println("종료");
				break;
				}
		}

	}

}
