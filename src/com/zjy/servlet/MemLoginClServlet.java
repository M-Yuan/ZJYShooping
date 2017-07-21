package com.zjy.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zjy.model.*;
import java.util.*;

public class MemLoginClServlet extends HttpServlet {

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

		/*
		 * 用来验证用户合法性
		 * 获取从客户端传递来的用户名和密码（此处用getParameter获取）
		 */
		String userName = request.getParameter("username");
		String passWord = request.getParameter("password");
		
		// 定义用户信息操作对象
		UserBeanBO userBeanBO = new UserBeanBO();
		
		// 判断用户合法性
		if(userBeanBO.checkUserInfo(userName, passWord)){
			/**
			 * 合法->
			 * 1.跳转至用户信息和购物车信息页面-》purchaserInfo.jsp
			 * 2.显示用户信息传递UserBean
			 * 3.显示购物车信息传递购物车Session
			 */
			
			// 获取UserBean,从获取的userName，使用UserBeanBO的getUserBean()方法获取，并将其UserBean放入Session
			UserBean userBean = userBeanBO.getUserBean(userName);
			request.getSession().setAttribute("UserBeanSession", userBean);
			
			// 从Session获取购物车信息，使用request方法传递给下一页面（session不宜过大）
			MycartBO mycartBO = (MycartBO)request.getSession().getAttribute("MycartSession");
			ArrayList arrList = mycartBO.getMycartInfo();
			request.setAttribute("myCartInfo", arrList);
			
			request.getRequestDispatcher("purchaserInfo.jsp").forward(request, response);
		}else{
			/**
			 * 不合法-> 仍然将页面跳转至登录页面-》memLogin.jsp
			 */
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
