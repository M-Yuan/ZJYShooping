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

		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();

		String type = request.getParameter("type");
		
		/*
		 * 用来验证用户合法性
		 * 获取从客户端传递来的用户名和密码（此处用getParameter获取）
		 */
		String userName = request.getParameter("username");
		String passWord = request.getParameter("password");
		
		// 定义用户信息操作对象
		UserBeanBO userBeanBO = new UserBeanBO();
		
		if(type.equals("")){
			System.out.println("type = " + type);
			
			// 判断用户是否存在
			if(userBeanBO.checkUserExist(userName, passWord)){
				// 用户已存在，直接跳转到purchaserInfo.jsp页面
				
				// 获取UserBean,从获取的userName，使用UserBeanBO的getUserBean()方法获取，并将其UserBean放入Session
				UserBean userBean = userBeanBO.getUserBean(userName);
				request.getSession().setAttribute("UserBeanSession", userBean);
				
				// 从Session获取购物车信息，使用request方法传递给下一页面（session不宜过大）
				MycartBO mycartBO = (MycartBO)request.getSession().getAttribute("MycartSession");
				ArrayList arrList = mycartBO.getMycartInfo();
				request.setAttribute("myCartInfo", arrList);
				
				request.getRequestDispatcher("purchaserInfo.jsp").forward(request, response);
			}else{
				// 用户还未登录，请先登录
				request.getRequestDispatcher("memLogin.jsp").forward(request, response);
			}
		}else if(type.equals("userLogin")){
			System.out.println("type = " + type);
			
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
				//request.getRequestDispatcher("memLogin.jsp").forward(request, response);
				request.getRequestDispatcher("memRegister.jsp").forward(request, response);
			}
		}else if(type.equals("userRegister")){
			System.out.println("type = " + type);
			
			UserBean userBean = new UserBean();
			
			//(username, truename, passwd, email, phone, address, postcode, grade)
			String userTrueName = new String(request.getParameter("usertruename").getBytes("ISO-8859-1"),"utf-8");
			System.out.println("userTrueName = " + userTrueName);
			String repassWord = new String(request.getParameter("repassword").getBytes("ISO-8859-1"),"utf-8");
			String userEmail = new String(request.getParameter("email").getBytes("ISO-8859-1"),"utf-8");
			String userPhone = new String(request.getParameter("phone").getBytes("ISO-8859-1"),"utf-8");
			String userAddress = new String(request.getParameter("address").getBytes("ISO-8859-1"),"utf-8");
			System.out.println("userAddress = " + userAddress);
			String userPostcode = new String(request.getParameter("postcode").getBytes("ISO-8859-1"),"utf-8");
			String userGrade = new String(request.getParameter("grade").getBytes("ISO-8859-1"),"utf-8");
			
			userBean.set_userName(userName);
			userBean.set_userTruename(userTrueName);
			userBean.set_userPasswd(passWord);
			userBean.set_userEmail(userEmail);
			userBean.set_userPhone(userPhone);
			userBean.set_userAddress(userAddress);
			userBean.set_userPostcode(userPostcode);
			userBean.set_userGrade(Integer.parseInt(userGrade));
			
			/**
			 * 判断UserBean两次输入的密码是否相同
			 */
			if(!passWord.equals(repassWord)){
				//登陆失败，我有的是转发，转发request作用域是连续的，所以我这里可以用request传递失败的信息给JSp页面
				request.setAttribute("message", "两次输入的密码不相同！");
				request.getRequestDispatcher("memRegister.jsp").forward(request, response);
			}
			
			/**
			 * 将memRegister.jsp页面传递过来的用户信息插入到users表中
			 * 此时存在一个问题：userId还没存放在userBean中
			 */
			if(userBeanBO.InsertUserBean(userBean)){
				/**
				 * 插入数据成功，则跳转至purchaserInfo.jsp
				 * 插入数据失败，则跳转至memRegister.jsp
				 */
				
				// 将userId存放至userBean
				userBean.set_userId(Integer.parseInt(userBeanBO.getUserIdByUserName(userName)));
				
				// 将其UserBean放入Session
				request.getSession().setAttribute("UserBeanSession", userBean);
				
				// 从Session获取购物车信息，使用request方法传递给下一页面（session不宜过大）
				MycartBO mycartBO = (MycartBO)request.getSession().getAttribute("MycartSession");
				ArrayList arrList = mycartBO.getMycartInfo();
				request.setAttribute("myCartInfo", arrList);
				
				request.getRequestDispatcher("purchaserInfo.jsp").forward(request, response);
			}else{
				request.getRequestDispatcher("memRegister.jsp").forward(request, response);
			}
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
