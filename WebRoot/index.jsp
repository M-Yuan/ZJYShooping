<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<!-- 引入css样式 -->
	<link href="css/shopping.css" rel="stylesheet" type="text/css" />
	
	
	<style type="text/css">

　　 </style>

  </head>
  
	<body topmargin="0" background="images/bg.bmp">
	<table width="80%" border="1" align="center" cellpadding="0" cellspacing="0">
	  <tr align="center" valign="middle">
	    <td height="94" colspan="2">
	    	<jsp:include flush="true" page="head.jsp"></jsp:include>
	    </td>
	  </tr>
	  <tr align="center">
	    <td width="21%" height="185" valign="middle">
			<jsp:include flush="true" page="left.jsp"></jsp:include>
		</td>
		<td width="73%" height="185" valign="top">
			<jsp:include flush="true" page="right.jsp"></jsp:include>
		</td>
	  </tr>
	  <tr align="center" valign="middle">
	    <td height="62" colspan="2">
			<jsp:include flush="true" page="tail.jsp"></jsp:include>
		</td>
	  </tr>
	</table>
	</body>
</html>
