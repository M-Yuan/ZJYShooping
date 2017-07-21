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
	/**
	 * @Description: 定义变量
	 */
	private Connection	conn = null;
	private PreparedStatement prst = null;
	private ResultSet	rest = null;
	
	/**
	 * @Description: 定义一个HashMap集合，用于存放书的id和书的数量---泛型定义（jdk5.0）
	 */
	HashMap<String, String> hsMap = new HashMap<String, String>();
	
	/**
	 * @Description: 定义购买图书量的总价
	 */
	private float totalPrice = 0.0f;
	
	/**
	 * @Description: 增加货物
	 * @param goodsId
	 * @param goodsNum
	 */
	public void addGoods(String goodsId, String goodsNum){
		hsMap.put(goodsId, goodsNum);
	}
	
	/**
	 * @Description: 删除货物
	 * @param goodsId
	 */
	public void deleteGoods(String goodsId){
		hsMap.remove(goodsId);
	}
	
	/**
	 * @Description: 修改货物
	 * @param goodsId
	 * @param goodsNum
	 */
	public void updateGoods(String goodsId, String goodsNum){
		hsMap.put(goodsId, goodsNum);
	}
	
	/**
	 * @Description: 清除货物
	 */
	public void clearGoods(){
		hsMap.clear();
	}
	
	/**
	 * @Description: 获取购物车信息
	 */
	public ArrayList getMycartInfo(){
		ArrayList<GoodsBean> arrList = new ArrayList<GoodsBean>();
		
		try{
			// 组织sql
			String sql = "select * from goods where goodsId in ";//(1,4)
			
			// 使用迭代器完成从hm中取出货物id的要求
			Iterator iter = hsMap.keySet().iterator();
			
			// sql语句补充
			String sqlTemp = "(";
			
			while(iter.hasNext()){
				// 从HashMap中取出goodsId
				String goodsId = (String)iter.next();
				
				if(iter.hasNext()){
					sqlTemp += goodsId + ","; 
				}else{
					sqlTemp += goodsId;
				}
			}
				
			sql += sqlTemp;
			sql += ");";
			//System.out.println("getMycartInfo sql = " + sql);
			
			conn = new ConnectDataBase().getConnectMysql();
			prst = conn.prepareStatement(sql);
			rest = prst.executeQuery();
			
			// 清空总价
			this.zeroTotalPrice();
			
			while(rest.next()){
				GoodsBean goodsBean = new GoodsBean();
				int goodsId=rest.getInt(1);
				goodsBean.set_goodsId(goodsId);
				goodsBean.set_goodsName(rest.getString(2));
				goodsBean.set_goodsIntro(rest.getString(3));
				float unitPrice=rest.getFloat(4);
				goodsBean.set_goodsPrice(unitPrice);
				goodsBean.set_goodsNum(rest.getInt(5));
				goodsBean.set_goodsPublisher(rest.getString(6));
				goodsBean.set_goodsPhoto(rest.getString(7));
				goodsBean.set_goodsType(rest.getString(8));
				
				this.totalPrice = this.totalPrice + unitPrice * Integer.parseInt(this.getGoodsNumByGoodsId(goodsId+""));
				
				arrList.add(goodsBean);
			}
			
			
		}catch(Exception ex){
			ex.printStackTrace();
			System.out.println("获取购物车信息时出现问题！");
		}
		
		return arrList;
	}
	
	/**
	 * @Description: 获取购物车的总价
	 */
	public float getTotalPrice(){
		return this.totalPrice;
	}

	/**
	 * @Description: 清空购物车的总价
	 */
	public void zeroTotalPrice(){
		 this.totalPrice = 0.0f;
	}
	
	/**
	 * @Description: 通过goodsId来获取到goodsNum
	 */
	public String getGoodsNumByGoodsId(String goodsId){
		return (String)hsMap.get(goodsId);
	}
	 
	/**
	 * @Description: 关闭打开的Database资源
	 */
	public void CloseDatabase(){
		
		try{
			if(rest != null){
				rest.close();
			}
			if(prst != null){
				prst.close();
			}
			if(conn != null){
				conn.close();
			}
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("关闭数据库连接信息失败！");
		}finally{
			rest = null;
			prst = null;
			conn = null;
		}
	}
}
