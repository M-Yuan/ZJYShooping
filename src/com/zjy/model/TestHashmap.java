package com.zjy.model;

import java.util.*;

public class TestHashmap {

	public static void main(String[] args) {
		//HashMap<String, String> hsMap = new HashMap<String, String>();
		
		HashMap hm=new HashMap();
		
		hm.put("1", "3");
		hm.put("2", "4");
		hm.put("5", "100");
		
		hm.remove("2");
		hm.clear();
		//取出所有key
		
		//使用迭代器
		Iterator it=hm.keySet().iterator();
		
		while(it.hasNext()){
			//取出key
			String key=(String)it.next();
			
			//根据key取出value
			String nums=(String)hm.get(key);
			System.out.println("key===="+key+" num="+nums);
		}
		
	}

}
