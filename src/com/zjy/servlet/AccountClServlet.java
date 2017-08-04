/**
 * @FileName:    AccountClServlet.java
 * @Description: TODO(用一句话描述该文件做什么)
 * @Copyright:   Copyright(C) 1998-2017
 * @Createdate:  2017年8月3日下午11:19:05
 *
 * Modification  History:
 * Date          Author         Version    Discription
 * -----------------------------------------------------------------------------------
 * 2017年8月3日       Administrator  1.0        1.0
 * Why & What is modified: <修改原因描述>
 */
package com.zjy.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zjy.model.MycartBO;
import com.zjy.model.UserBean;
import com.zjy.model.UserBeanBO;

/**
 * @author M.Yuan
 *
 */
public class AccountClServlet extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		// 定义用户信息操作对象
		//UserBeanBO userBeanBO = new UserBeanBO();
		
		//From:MemLoginClServlet->获取UserBean信息
		UserBean userBean = (UserBean)request.getSession().getAttribute("UserBeanSession");
		
		if(userBean != null){
			// 从Session获取购物车信息，使用request方法传递给下一页面（session不宜过大）
			//MycartBO mycartBO = (MycartBO)request.getSession().getAttribute("MycartSession");
			//ArrayList arrList = mycartBO.getMycartInfo();
			//request.setAttribute("myCartInfo", arrList);
			
			request.getRequestDispatcher("purchaseInfo.jsp").forward(request, response);
		}else{
			request.getRequestDispatcher("memLogin.jsp").forward(request, response);
		}

	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
