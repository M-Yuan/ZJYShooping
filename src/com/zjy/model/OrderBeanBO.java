/**
 * @FileName:    OrdersBean.java
 * @Description: TODO(用一句话描述该文件做什么)
 * @Copyright:   Copyright(C) 1998-2017
 * @Createdate:  2017年7月25日下午1:31:08
 *
 * Modification  History:
 * Date          Author         Version    Discription
 * -----------------------------------------------------------------------------------
 * 2017年7月25日        Administrator  1.0        1.0
 * Why & What is modified: <修改原因描述>
 */
package com.zjy.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;

/**
 * @ClassName:   OrderBeanBO
 * @Description: 处理订单操作
 */
public class OrderBeanBO {
	/**
	 * @Description: 定义变量
	 */
	private Connection	conn = null;
	private Statement	stmt = null;
	private PreparedStatement prst = null;
	private ResultSet	rest = null;
	
	/**
	 * @Description: 获取一个orderBeanInfo, 是否成功
	 * @param goodsId
	 */
	public OrderBeanInfo getOrderBeanInfo(MycartBO mycartBO, String userId){
		OrderBeanInfo orderBeanInfo = new OrderBeanInfo();
		
		boolean bRes = true;
		
		/**
		 * 分别往orders和orderDetail表中添加信息
		 * 1.如果添加成功，则跳转到showOrders.jsp页面
		 * 2.如果添加失败，则跳回至purchaseInfo.jsp页面
		 */
		
		try{
			// 组合sql语句
			String sqlCont = "insert into orders (userid, isPayed, totalPrice) value(?, ?, ?);";
			conn = new ConnectDataBase().getConnectMysql();
			prst = conn.prepareStatement(sqlCont);
			prst.setString(1, userId);
			prst.setByte(2, (byte)0);
			prst.setFloat(3, mycartBO.getTotalPrice());
			// executeUpdate返回数据更新的结果数
			int iRes = prst.executeUpdate();
			if(iRes == 1){	// 在orders表中插入数据成功
				// 取出刚添加进去的最后的一条orders的ordersId（orders表中主键是以自增的形式定义的）
				sqlCont = "select max(ordersId) from orders;";
				prst = conn.prepareStatement(sqlCont);
				rest = prst.executeQuery();
				int ordersId = 0;
				while(rest.next()){
					ordersId = rest.getInt(1);
				}
				
				
				// 添加ordersDetail表，需要ordersId, goodsId, goodsNums
				ArrayList arrList = mycartBO.getMycartInfo();
				
				stmt = conn.createStatement();
				// 循环的添加到orderDetail表，会影响效率, 在此使用批量操作数据库的方法，提高效率
				for(int ilop = 0; ilop < arrList.size(); ilop++){
					GoodsBean goodsBean = (GoodsBean)arrList.get(ilop);
					stmt.addBatch("insert into orderDetail (ordersId, goodsId, nums) value(" + ordersId +
							", " + goodsBean.get_goodsId() + 
							", " + mycartBO.getGoodsNumByGoodsId(goodsBean.get_goodsId()+"") +");");
				}
				
				// 开始批量执行
				stmt.executeBatch();
				
				// 获取orderBeanInfo, 多表查询
				sqlCont ="select ordersId ,truename,address,postcode,phone,totalPrice,username,email from users,orders"+
						" where ordersId=? and users.userid =(select orders.uesrid from orders where ordersId=?)";
				
				prst = conn.prepareStatement(sqlCont);
				prst.setInt(1, ordersId);
				prst.setInt(2, ordersId);
				rest = prst.executeQuery();
				while(rest.next()){
					// 将rest封装到OrderInfoBean
					orderBeanInfo.setOrdersId(rest.getInt(1));
					orderBeanInfo.setTruename(rest.getString(2));
					orderBeanInfo.setAddress(rest.getString(3));
					orderBeanInfo.setPostcode(rest.getString(4));
					orderBeanInfo.setPhone(rest.getString(5));
					orderBeanInfo.setTotalPrice(rest.getFloat(6));
					orderBeanInfo.setUsername(rest.getString(7));
					orderBeanInfo.setEmail(rest.getString(8));
				}
			}
			
			
		}catch(Exception ex){
			bRes = false;	// 插入表数据失败
			System.out.println("获取一个orderBeanInfo时出现错误！");
			ex.printStackTrace();
		}finally{
			this.CloseDatabase();
		}
		
		if(bRes == false){
			return null;
		}
		
		return orderBeanInfo;
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
