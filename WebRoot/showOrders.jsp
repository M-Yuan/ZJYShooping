<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showOrders.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<!-- 引入css样式 -->
	<link href="css/shopping.css" rel="stylesheet" type="text/css" />

  </head>
  
  <body>
   <center>
   	<table width="80%" height="255" border="1">
	  <tr align="center">
	    <td>
		 <jsp:include flush="true" page="head.jsp"></jsp:include>
		</td>
	  </tr>
	  <tr>
	    <td height="141"><table width="100%" border="1" class="showOrders01" cellpadding="0" cellspacing="0">
	      <tr align="center">
	        <td colspan="9"><img src="images/cartnavi-4.gif" width="599" height="49" /></td>
	        </tr>
	      <tr align="center">
	        <td colspan="9">订单详细信息</td>
	        </tr>
	      <tr align="center">
	        <td width="7%">订单号</td>
	        <td width="8%">收货人</td>
	        <td width="24%">收货地址</td>
	        <td width="6%">邮编</td>
	        <td width="11%">电话</td>
	        <td width="7%">总价</td>
	        <td width="10%">用户名</td>
	        <td width="19%">电子邮箱</td>
	        <td width="8%">&nbsp;</td>
	      </tr>
	      <tr align="center">
	        <td>2</td>
	        <td>张三</td>
	        <td>南山区西丽镇</td>
	        <td>75533</td>
	        <td>0755-88888888</td>
	        <td>￥49.0</td>
	        <td>zhangsan</td>
	        <td>zhangsan@tsinghua.org.cn</td>
	        <td><a href="" >查看详情</a></td>
	      </tr>
	      <tr align="center">
	        <td height="34" colspan="9">您的订单已完成，服务器将在稍后将在您的电子邮箱发送通讯信息，并确定订单信息。</td>
	        </tr>
	    </table></td>
	  </tr>
	  <tr align="center">
	    <td>
	     <jsp:include flush="true" page="tail.jsp"></jsp:include>
	    </td>
	  </tr>
	</table>
   </center>
  </body>
</html>
