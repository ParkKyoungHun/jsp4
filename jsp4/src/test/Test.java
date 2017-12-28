package test;

import java.util.*;

public class Test {
	Person p = new Person();
	
	public String getString() {
		return this.p.getName();
	}
	
	public static void main(String[] args) {
		HashMap<String, String> hm
		 = new HashMap<String, String>();
		hm.put("uiName", "테스트");
		System.out.println(hm.get("uiName"));
		ArrayList<String> al = new ArrayList<String>();
	}
}
