/**
 * @FileName:     ShoopingClServlet.java
 * @Description:  TODO(Do with a phrase to describe the file)
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

		String type = request.getParameter("type");
		
		if(type.equals("")){
			
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
