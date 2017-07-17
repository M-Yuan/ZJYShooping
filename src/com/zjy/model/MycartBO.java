/**
 * @FileName:    MycartBO.java
 * @Description: 处理购物
 * @Copyright:   Copyright(C) 1998-2017
 * @Createdate:  2017年7月17日 上午10:01:14
 *
 * Modification  History:
 * Date          Author         Version    Discription
 * -----------------------------------------------------------------------------------
 * 2017年7月17日        yuanmin        1.0        1.0
 * Why & What is modified: <修改原因描述>
 */
package com.zjy.model;

import java.sql.*;
import java.util.*;

/**
 * @ClassName:   MycartBO
 * @Description: 处理购物操作
 */
public class MycartBO {
	// 定义变量
	private Connection	conn = null;
	private PreparedStatement prst = null;
	private ResultSet	rest = null;
	
	// 定义一个hashmap集合，用于存放书的id和书的数量---泛型定义（jdk5.0）
	HashMap<String, String> hsMap = new HashMap<String, String>();
	
	// 增加货物
	public void addGoods(String goodsId, String goodsNum){
		hsMap.put(goodsId, goodsNum);
	}
	
	// 删除货物
	public void deleteGoods(String goodsId){
		hsMap.remove(goodsId);
	}
	
	// 修改货物
	public void updateGoods(String goodsId, String goodsNum){
		hsMap.put(goodsId, goodsNum);
	}
	
	// 清除货物
	public void clearGoods(){
		hsMap.clear();
	}
	
	

}
