package day0307;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class Ex2Set {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Set<Integer> set1=new HashSet<Integer>();
		
		set1.add(5);
		set1.add(11);
		set1.add(11);
		set1.add(29);
		set1.add(22);
		
		System.out.println("데이터갯수: "+set1.size());
		
		System.out.println("출력 #1");
		for(Integer s:set1)
			System.out.println(s);
		
		System.out.println("출력 #2");
		Iterator<Integer> iter=set1.iterator();
		
		while(iter.hasNext())
		{
			Integer s=iter.next();
			System.out.println(s);
		}
		
		System.out.println("출력 #3");
		Object [] ob=set1.toArray();
		
		for(int i=0;i<ob.length;i++)
			System.out.println(ob[i]);
	}

}
