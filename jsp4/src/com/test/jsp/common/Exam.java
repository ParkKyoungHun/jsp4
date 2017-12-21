package com.test.jsp.common;

import java.util.HashMap;

public class Exam {

	public static void main(String[] args) {
		int[] nums = new int[2];
		for(int i=0;i<2;i++) {
			nums[i] = i;
		}
		HashMap<String,String> h = new HashMap<String,String>();
		h.put("A", "123");
		System.out.println(h.get("a"));
		
	}
}
