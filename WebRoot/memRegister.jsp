<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'memRegister.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<!-- 引入css样式 -->
	<link href="css/shopping.css" rel="stylesheet" type="text/css" />
	
	
	<%
		Object message = request.getAttribute("message");
		if(message!=null && !"".equals(message)){
	
	%>
		<script type="text/javascript">
			alert("<%=message%>");
		</script>
	<%
		} 
	%>
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
		    <td height="209" align="center">
		    	<!-- 通过submit提交form表单 -->
		        <form action="MemLoginClServlet?type=userRegister" method="post">
		          <table width="60%" border="1" bordercolor="#9999FF" class="memberLogin01" cellspacing="0" cellpadding="0">
					<tr align="center">
						<td colspan="2"><img src="images/zc.gif" width="149" height="63"></td>
					</tr>
					<tr>
						<td width="40%" align="right" class="memRegister01">用户名:</td>
						<td width="60%" align="left" class="memRegister01">
						  <input type="text" name="username" value="user3" size="15">
						</td>
					</tr>
					<tr>
						<td width="40%" align="right" class="memRegister01">真实姓名:</td>
						<td width="60%" align="left" class="memRegister01">
						  <input type="text" name="usertruename" value="刘才" size="15">
						</td>
					</tr>
					<tr>
					  <td align="right" class="memRegister01">密码(6位以上) :</td>
					  <td align="left" class="memRegister01">
					    <input type="password" name="password" value="777777" size="15" />
					  </td>
					  </tr>
					<tr>
					  <td align="right" class="memRegister01">再次输入密码:</td>
					  <td align="left" class="memRegister01">
					    <input type="password" name="repassword" value="777777" size="15" />
					  </td>
					  </tr>
					<tr>
					  <td align="right" class="memRegister01">您的电子邮箱:</td>
					  <td align="left" class="memRegister01">
					    <input type="text" name="email" value="licai@sina.com" size="15" />
					  </td>
					</tr>
					<tr>
						<td width="40%" align="right" class="memRegister01">手机号码:</td>
						<td width="60%" align="left" class="memRegister01">
						  <input type="text" name="phone" value="15566667777" size="15">
						</td>
					</tr>
					<tr>
						<td width="40%" align="right" class="memRegister01">用户住址:</td>
						<td width="60%" align="left" class="memRegister01">
						  <input type="text" name="address" value="华润小区1单元1003室" size="15">
						</td>
					</tr>
					<tr>
						<td width="40%" align="right" class="memRegister01">邮编:</td>
						<td width="60%" align="left" class="memRegister01">
						  <input type="text" name="postcode" value="733000" size="15">
						</td>
					</tr>
					<tr>
						<td width="40%" align="right" class="memRegister01">用户级别:</td>
						<td width="60%" align="left" class="memRegister01">
						  <input type="text" name="grade" value="4" size="15">
						</td>
					</tr>
					<tr>
						<td align="right">&nbsp;</td>
						<td align="left" valign="middle" class="memRegister02"><input type="checkbox" name="checkbox" id="checkbox" />
						  我已看过并同意注册协议内容</td>
					</tr>
					<tr>
						<td height="38" align="right">&nbsp;</td>
		            	<td align="left"><input name="Submit2" type="submit" class="memRegister01" value="用户注册" /></td>
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
