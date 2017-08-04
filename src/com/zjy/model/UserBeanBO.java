/**
 * @FileName:    UserBeanBO.java
 * @Description: 处理用户信息
 * @Copyright:   Copyright(C) 1998-2017
 * @Createdate:  2017年7月21日 上午12:01:14
 *
 * Modification  History:
 * Date          Author         Version    Discription
 * -----------------------------------------------------------------------------------
 * 2017年7月21日        yuanmin        1.0        1.0
 * Why & What is modified: <修改原因描述>
 */
package com.zjy.model;

import java.util.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * @ClassName:   UserBeanBO
 * @Description: 处理用户信息操作
 */
public class UserBeanBO {
	// 声明对象
	Connection conn = null;
	PreparedStatement prst = null;
	ResultSet rest = null;
	
	/**
	 * @Description: 获取UserBean信息
	 * @param	   : username
	 */
	public UserBean getUserBean(String userName){		
		UserBean userBean = new UserBean();
		
		try{
			String sqlContent = "select * from users where username=? limit 1";
			
			conn = new ConnectDataBase().getConnectMysql();
			prst = conn.prepareStatement(sqlContent);
			prst.setString(1, userName);
			rest = prst.executeQuery();
			
			while(rest.next()){
				
				
				userBean.set_userId(rest.getLong(1));
				userBean.set_userName(rest.getString(2));
				userBean.set_userTruename(rest.getString(3));
				userBean.set_userPasswd(rest.getString(4));
				userBean.set_userEmail(rest.getString(5));
				userBean.set_userPhone(rest.getString(6));
				userBean.set_userAddress(rest.getString(7));
				userBean.set_userPostcode(rest.getString(8));
				userBean.set_userGrade(rest.getInt(9));
			}
			
		}catch(Exception ex){
			ex.printStackTrace();
			System.out.println("获取User信息时出现问题！");
		}finally{
			this.CloseDatabase();
		}
		
		return userBean;
	}

	/**
	 * @Description: 验证UserBean信息是否存在于users表
	 * @param	   : username
	 * @param	   : password
	 */
	public boolean checkUserExist(String userName, String passWord){
		// 初始化返回值为false
		boolean result = false;
		try{
			String sqlContent = "select passwd from users where username=? limit 1";
			
			conn = new ConnectDataBase().getConnectMysql();
			prst = conn.prepareStatement(sqlContent);
			prst.setString(1, userName);
			rest = prst.executeQuery();
			
			while(rest.next()){
				// 获取查询结果
				String pw = rest.getString(1);
				
				if(pw.equals(passWord)){	// 存在用户信息
					result = true;
				}
			}
			
		}catch(Exception ex){
			ex.printStackTrace();
			System.out.println("验证UserBean信息时出现问题！");
		}finally{
			this.CloseDatabase();
		}
	
		return result;
}
	
	/**
	 * @Description: 验证UserBean信息
	 * @param	   : username
	 * @param	   : password
	 */
	public boolean checkUserInfo(String userName, String passWord){
		// 初始化返回值为false
		boolean result = false;
		try{
			String sqlContent = "select passwd from users where username=? limit 1";
			
			conn = new ConnectDataBase().getConnectMysql();
			prst = conn.prepareStatement(sqlContent);
			prst.setString(1, userName);
			rest = prst.executeQuery();
			
			while(rest.next()){
				// 获取查询结果
				String pw = rest.getString(1);
				
				if(pw.equals(passWord)){	// 存在用户信息
					result = true;
				}
			}
			
		}catch(Exception ex){
			ex.printStackTrace();
			System.out.println("验证UserBean信息时出现问题！");
		}finally{
			this.CloseDatabase();
		}
	
		return result;
	}
	
	/**
	 * @Description: 验证UserBean两次输入的密码是否相同
	 * @param	   : stPassword
	 * @param	   : ndPassword
	 */
	/*
	public boolean checkUserPassword(String stPassword, String ndPassword){
		boolean bRes = true;
		
		
		return bRes;
	}
	*/
	
	
	/**
	 * @Description: 通过username来获取到userId
	 */
	public String getUserIdByUserName(String username){
		String userId = "";
		try{
			// 定义sql语句
			String sqlContent = "select userId from users where username=?;";
			
			
			conn = new ConnectDataBase().getConnectMysql();
			prst = conn.prepareStatement(sqlContent);
			prst.setString(1, username);
			rest = prst.executeQuery();
			
			while(rest.next()){
				// 获取查询结果
				userId = rest.getString(1);	
			}
		}catch(Exception ex){
			System.out.println("getUserIdByUserName时出现了错误！");
			ex.printStackTrace();
		}
		
		return userId;
	}
	
	/**
	 * @Description: 插入UserBean信息
	 * @param	   : userBean详细信息
	 */
	public boolean InsertUserBean(UserBean userBean){
		boolean bRes = true;	
		try{
			// 定义sql语句
			String sqlContent = "insert into users (username, truename, passwd, email, phone, address, postcode, grade) values(?, ?, ?, ?, ?, ?, ?, ?);";
			
			// 执行数据库操作
			conn = new ConnectDataBase().getConnectMysql();
			prst = conn.prepareStatement(sqlContent);
			prst.setString(1, userBean.get_userName());
			prst.setString(2, userBean.get_userTruename());
			prst.setString(3, userBean.get_userPasswd());
			prst.setString(4, userBean.get_userEmail());
			prst.setString(5, userBean.get_userPhone());
			prst.setString(6, userBean.get_userAddress());
			prst.setString(7, userBean.get_userPostcode());
			prst.setInt(8, userBean.get_userGrade());
			
			// 返回操作数据库成功记录条数
			int iRes = prst.executeUpdate();
			
			if(iRes <= 0){
				/**
				 * sql语句执行失败，用户注册失败
				 */
				bRes = false;
			}
		}catch(Exception ex){
			bRes = false;
			System.out.println("InsertUserBean时出现了错误！");
			ex.printStackTrace();
		}finally{
			this.CloseDatabase();
		}
		return bRes;
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
