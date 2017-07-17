/**
 * @FileName:    ShowGoodsClServlet.java
 * @Description: TODO(用一句话描述该文件做什么)
 * @Copyright:   Copyright(C) 1998-2017
 * @Createdate:  2017年7月13日 下午1:43:32
 *
 * Modification  History:
 * Date          Author         Version    Discription
 * -----------------------------------------------------------------------------------
 * 2017年7月13日        Administrator  1.0        1.0
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
 * @ClassName:   ShowGoodsClServlet
 * @Description: TODO(这里用一句话描述这个类的作用)
 */
public class ShowGoodsClServlet extends HttpServlet {

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

		String type = request.getParameter("type");
		
		if(type.equals("showDetail"))
		{
			// 得到要显示的货物的id，此处的id通过页面链接传递(right.jsp)
			String goodsId = request.getParameter("goodsID");
			
			// 调用model函数来获取此ID的货物信息
			GoodsBeanBO goodsbb = new GoodsBeanBO();
			GoodsBean goodsBean = goodsbb.getGoodsBean(goodsId);
			
			//把goodsBean放入request中，进行跳转
			request.setAttribute("goodsInfo", goodsBean);
			request.getRequestDispatcher("showDetail.jsp").forward(request, response);
			
		}else if(type.equals("fenye")){
			// 通过翻页超链接获取到当时是第几页
			String pageNow = request.getParameter("pageNow");
			
			//把pageNow放入request中，进行跳转
			request.setAttribute("s_pageNow", pageNow);
			request.getRequestDispatcher("index.jsp").forward(request, response);
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
