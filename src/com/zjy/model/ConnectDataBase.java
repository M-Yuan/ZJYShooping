/**
 * @FileName:    ConnectDataBase.java
 * @Description: connect the Database to use
 * @Copyright:   Copyright(C) 1998-2017
 * @Createdate:  2017年7月13日 上午10:01:14

 * Modification  History:
 * Date          Author         Version    Discription
 * -----------------------------------------------------------------------------------
 * 2017年7月13日        yuanmin        1.0        1.0
 * Why & What is modified: <修改原因描述>
 */
package com.zjy.model;

import java.sql.*;

/**
 * @ClassName:   ConnectDataBase
 * @Description: 
 */
public class ConnectDataBase {
	// 声明Connect对象
	private Connection	conn = null;
	
	/**
	 * @see		Connect the mysql database
	 * @return	conn
	 * @throws	SQLException
	 */
	public Connection getConnectMysql() throws SQLException{
		String url = "jdbc:mysql://localhost:3306/zjyshooping";
        String user = "root";  
        String password = "123456"; 
		
        try{
        	Class.forName("com.mysql.jdbc.Driver"); 
        	conn = DriverManager.getConnection(url, user, password);
        }catch (ClassNotFoundException e) {  
            e.printStackTrace();
            System.out.println("连接数据库时ClassNotFoundException出现错误");
        }catch(SQLException e){
        	e.printStackTrace();
        	System.out.println("连接数据库时SQLException出现错误");
        }
		return conn;
	}
}
