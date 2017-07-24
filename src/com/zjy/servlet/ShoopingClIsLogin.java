/**
 * @FileName:    ShoopingClIsLogin.java
 * @Description: TODO(用一句话描述该文件做什么)
 * @Copyright:   Copyright(C) 1998-2017
 * @Createdate:  2017年7月20日 下午23:09:32
 *
 * Modification  History:
 * Date          Author         Version    Discription
 * -----------------------------------------------------------------------------------
 * 2017年7月20日        Administrator  1.0        1.0
 * Why & What is modified: <修改原因描述>
 */
package com.zjy.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zjy.model.*;
import java.util.*;

/**
 * @ClassName:   ShoopingClIsLogin
 * @Description: TODO(这里用一句话描述这个类的作用)
 */
public class ShoopingClIsLogin extends HttpServlet {


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

		/**
		 * 这是一个判断用户是否登录过的控制器
		 * 1.如果登录过了，则进入显示用户信息和购物车信息的界面
		 * 2.如果没登录过，则跳转至登录界面
		 */
		
		System.out.println("ShoopingClIsLogin");
		
		/*
		 * 还是通过session来判断用户是否有登陆过
		 */
		UserBean userBean = (UserBean)request.getSession().getAttribute("UserInfoSession");
		
		if(userBean == null){
			// 说明该用户第一次登录,创建一个登录session
			//userBean = new UserBean();
			//request.getSession().setAttribute("UserInfoSession", userBean);
			
			request.getRequestDispatcher("memLogin.jsp").forward(request, response);
		}else{
			// 说明该用户已经登录过了
			MycartBO mycartBO = (MycartBO)request.getSession().getAttribute("MycartSession");
			
			ArrayList arrList = mycartBO.getMycartInfo();
			
			request.setAttribute("myCartInfo", arrList);
			
			request.getRequestDispatcher("purchaserInfo.jsp").forward(request, response);
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
