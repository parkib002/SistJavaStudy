package day0219;

import java.util.Scanner;

public class Quiz0219_13 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc=new Scanner(System.in);
		
		String name;
		int amount,price,tot;
		int dc=0; //결과값이 있을 수도 있고 없을 수도 있을 때는 초기값 설정(main안에서)
		
		System.out.print("입고된 상품명은?");
		name=sc.nextLine();
		System.out.print("수량은?");
		amount=sc.nextInt();
		System.out.print("단가는?");
		price=sc.nextInt();
		
		tot=amount*price;
		
		System.out.println("================");
		System.out.println(name+" "+amount+"개는 총"+tot+"입니다");
		
		if(amount>=5)
		{
			dc=tot*9/10;
			System.out.println("(단 5개 이상은 10프로 DC됩니다)");
			System.out.println("================");
			System.out.println("dc된 최종금액: "+dc+"원");
		}
				
		
		

	}

}
