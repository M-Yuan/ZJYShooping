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
	
	<script type="text/javascript">  
		function Login(){  
			window.open("MemLoginClServlet", "_self"); 
		}  
		function Register(){  
			window.open("memRegister.jsp", "_self"); 
		}  
		     
	</script>  
</head>

<body topmargin="0" background="images/bg.bmp">
<center>
<table width="80%" border="1">
  <tr>
	<td align="center">
		<jsp:include flush="true" page="head.jsp"></jsp:include>
	</td>
  </tr>
  <tr>
    <td><table width="100%" border="1">
      <tr>
        <td align="center"><img src="images/cartnavi-2.gif" width="599" height="49" /></td>
      </tr>
      <tr align="center">
	    <td align="center">
	    	<!-- 通过submit提交form表单 -->
	        <form action="MemLoginClServlet?type=userLogin" method="post">
	          <table width="40%" border="1" bordercolor="#9999FF" class="memberLogin01" cellspacing="0" cellpadding="0">
				<tr align="center">
					<td colspan="2"><img src="images/dl.gif" width="149" height="63"></td>
				</tr>
				<tr>
					<td align="right" width="40%">用户名:</td>
					<td width="60%" align="left"><input type="text" name="username" size="15"></td>
				</tr>
				<tr>
					<td align="right">密&nbsp;码:</td>
					<td align="left"><input type="password" name="password" size="15"></td>
				</tr>
				<tr>
					<!-- 
					<td align="right"><input type="submit" name="Submit" value="用户登录" /></td>
	            	<td align="left"><input type="submit" name="Submit2" value="用户注册" /></td>
	            	 -->
	            	<td align="right"><input type="submit" name="login" value="用户登录" /></td>
	            	<td align="left"><input type="button" name="register" value="用户注册" onclick="Register()" /></td>
				</tr>
	           </table>
	         </form>
	     </td>
		
      </tr>
      <tr>
        <td><img src="images/cartnext.gif" width="87" height="19" align="right" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
	<td align="center">
		<jsp:include flush="true" page="tail.jsp"></jsp:include>
	</td>
  </tr>
</table>
</center>
</body>
</html> 



