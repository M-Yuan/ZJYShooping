/**
 * @FileName:    OrderClServlet.java
 * @Description: TODO(用一句话描述该文件做什么)
 * @Copyright:   Copyright(C) 1998-2017
 * @Createdate:  2017年7月24日下午9:53:44
 *
 * Modification  History:
 * Date          Author         Version    Discription
 * -----------------------------------------------------------------------------------
 * 2017年7月24日       Administrator  1.0        1.0
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

/**
 * @author M.Yuan
 *
 */
public class OrderClServlet extends HttpServlet {

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
		
		// 处理完成订单
		OrderBeanBO orderBeanBO = new OrderBeanBO();
		
		// 得到购物车
		MycartBO mycartBO = (MycartBO)request.getSession().getAttribute("MycartSession");
		
		// 得到用户Id
		long userId = ((UserBean)request.getSession().getAttribute("UserBeanSession")).get_userId();
		
		OrderBeanInfo orderBeanInfo = orderBeanBO.getOrderBeanInfo(mycartBO, (userId+""));
		
		if(orderBeanInfo != null){
			//添加ok
			//准备显示订单的详细信息的数据,给下个页面shopping4.jsp
			request.setAttribute("OrderBeanInfomation", orderBeanInfo);
			request.getRequestDispatcher("showOrders.jsp").forward(request, response);
		}else{
			//添加订单失败
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
