/**
 * @FileName:    GoodsBeanBO.java
 * @Description: To deal with goods table
 * @Copyright:   Copyright(C) 1998-2017
 * @Createdate:  2017年7月13日 上午10:01:14
 *
 * Modification  History:
 * Date          Author         Version    Discription
 * -----------------------------------------------------------------------------------
 * 2017年7月13日        yuanmin        1.0        1.0
 * Why & What is modified: <修改原因描述>
 */
package com.zjy.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * @ClassName:   GoodsBeanBO
 * @Description: 
 */
public class GoodsBeanBO {
	// 声明对象
	private Connection	conn = null;
	private ResultSet	rest = null;
	private Statement	stat = null;
	private PreparedStatement prst = null;
	
	/**
	 * Get the total number of pages
	 */
	public int getPageCount(int pageSize){
		int pageCount	= 0;
		int rowCount	= 0;
		
		try{
			// 防止sql注入漏洞
			conn = new ConnectDataBase().getConnectMysql();
			prst = conn.prepareStatement("select count(*) from goods;");
			rest = prst.executeQuery();
			if(rest.next()){
				rowCount = rest.getInt(1);
			}
			
			if(rowCount%pageSize == 0){
				pageCount = rowCount/pageSize;
			}else{
				pageCount = rowCount/pageSize + 1;
			}
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("获取分页时出现错误！");
		}finally{
			this.CloseDatabase();
		}
		return pageCount;
	}
	
	/**
	 * Paging processing
	 */
	public ArrayList getGoodsByPage(int pageSize, int pageNow){
		// 声明ArrayList对象
		ArrayList arrList = new ArrayList();
			
		try{
			// 防止sql注入漏洞
			conn = new ConnectDataBase().getConnectMysql();
			prst = conn.prepareStatement("select * from goods limit " + (pageNow-1)*pageSize + "," + pageSize + ";");
			rest = prst.executeQuery();
			while(rest.next()){
				GoodsBean goodsBean = new GoodsBean();
				goodsBean.set_goodsId(rest.getInt(1));
				goodsBean.set_goodsName(rest.getString(2));
				goodsBean.set_goodsIntro(rest.getString(3));
				goodsBean.set_goodsPrice(rest.getFloat(4));
				goodsBean.set_goodsNum(rest.getInt(5));
				goodsBean.set_goodsPublisher(rest.getString(6));
				goodsBean.set_goodsPhoto(rest.getString(7));
				goodsBean.set_goodsType(rest.getString(8));
				
				arrList.add(goodsBean);
			}
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("分页处理时出现问题！");
		}finally{
			this.CloseDatabase();
		}
		
		return arrList;
	}
	
	/**
	 * Obtain detailed information on GoodsBean
	 */
	public GoodsBean getGoodsBean(String goodsId){
		// 声明GoodsBean对象
		GoodsBean goodsBean = new GoodsBean();
		
		try{
			// 防止sql注入漏洞
			conn = new ConnectDataBase().getConnectMysql();
			prst = conn.prepareStatement("select * from goods where goodsId=?;");
			prst.setString(1, goodsId);
			rest = prst.executeQuery();
			while(rest.next()){
				goodsBean.set_goodsId(rest.getInt(1));
				goodsBean.set_goodsName(rest.getString(2));
				goodsBean.set_goodsIntro(rest.getString(3));
				goodsBean.set_goodsPrice(rest.getFloat(4));
				goodsBean.set_goodsNum(rest.getInt(5));
				goodsBean.set_goodsPublisher(rest.getString(6));
				goodsBean.set_goodsPhoto(rest.getString(7));
				goodsBean.set_goodsType(rest.getString(8));
			}

		}catch(Exception e){
			e.printStackTrace();
			System.out.println("获取GoodsBean时出现问题！");
		}finally{
			this.CloseDatabase();
		}
	
		return goodsBean;
	}
	
	public void CloseDatabase(){
		
		try{
			if(rest != null){
				rest.close();
			}
			if(stat != null){
				stat.close();
			}
			if(conn != null){
				conn.close();
			}
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("关闭数据库连接信息失败！");
		}finally{
			rest = null;
			stat = null;
			conn = null;
		}
	}
	
}
