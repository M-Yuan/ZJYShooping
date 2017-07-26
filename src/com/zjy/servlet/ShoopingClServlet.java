/**
 * @FileName:     ShoopingClServlet.java
 * @Description:  处理购物操作
 * @Copyright:    Copyright(C) 1998-2017
 * @Createdate:	  2017年7月15日 下午3:42:01 
 *
 * Modification  History:
 * Date          Author        Version        Discription
 * -----------------------------------------------------------------------------------
 * 2017年7月15日        Min.Y         1.0             1.0
 * Why & What is modified: <Modify the reason description>
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
 * @ClassName:    ShoopingClServlet
 * @Description:  TODO(Do with a phrase to describe the file)
 * @date:         2017年7月15日 下午3:42:01
 *
 */
public class ShoopingClServlet extends HttpServlet {

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

		// 获得要购物的操作类型
		String type = request.getParameter("type");
		
		// 获得要购物的货物的id
		//String goodsId = request.getParameter("goodsId");
		
		// 解决多个购物车问题 -- 利用session只需一个购物车就足够		
		// 先试图从session中取出一个购物车，如果不存在，创建session来保存第一个购物车（每个用户都有自己独立的session空间）
		MycartBO mycartBO = (MycartBO)request.getSession().getAttribute("MycartSession");
		
		if(mycartBO == null){
			// 说明该用户第一次购物,创建一个购物车，并放入sesion
			mycartBO = new MycartBO();
			request.getSession().setAttribute("MycartSession", mycartBO);
			
			//System.out.println("创建 MycartSession...");
		}
		
		
		if(type.equals("buyGoods")){
			// 获得要购物的货物的id
			String goodsId = request.getParameter("goodsId");
			
			// 默认情况下，购买书的数量是1
			mycartBO.addGoods(goodsId, "1");
			
			//System.out.println("ShoopingClServlet buyGoods");
		}else if(type.equals("deleteGoods")){
			// 获得要购物的货物的id
			String goodsId = request.getParameter("goodsId");
			
			mycartBO.deleteGoods(goodsId);
			
			//System.out.println("ShoopingClServlet deleteGoods");
		}else if(type.equals("updateGoods")){
			//用户希望修改数量
			//怎样在servlet中得到货物的id,和新的数量
			//接收货物id 
			
			String goodsIds[]=request.getParameterValues("goodsId");
			String goodsNums[]=request.getParameterValues("goodsNum");
			
			
			//测试一下看看是否得到新的修改值
			for(int i = 0; i < goodsIds.length; i++){
				
				System.out.println("id==="+goodsIds[i]+"  数量="+goodsNums[i]);
				//修改
				mycartBO.updateGoods(goodsIds[i], goodsNums[i]);
			}
			
		}else if(type.equals("showGoods")){
			//do nothing
			//System.out.println("ShoopingClServlet showGoods");
		}else if(type.equals("clearGoods")){	
			mycartBO.clearGoods();
		}
		
		ArrayList alMycartInfo = mycartBO.getMycartInfo();
		
		request.setAttribute("mycartInfo", alMycartInfo);
		request.getRequestDispatcher("showMycart.jsp").forward(request, response);
		
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
