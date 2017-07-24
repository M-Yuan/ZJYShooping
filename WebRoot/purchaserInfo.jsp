<%@ page language="java" import="java.util.*, com.zjy.model.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

// From:MemLoginClServlet->获取UserBean信息
UserBean userBean = (UserBean)session.getAttribute("UserBeanSession");

// From:MemLoginClServlet->获取购物车信息
ArrayList arrList = (ArrayList)request.getAttribute("myCartInfo");

// 定义MycartBO对象，用来根据goodsId,获取goodsNum
MycartBO mycartBO = (MycartBO)session.getAttribute("MycartSession");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'purchaserInfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<!-- 引入css样式 -->
	<link href="css/shopping.css" rel="stylesheet" type="text/css" />
	
	
  </head>
  
  <body topmargin="0" background="images/bg.bmp">
    <center>
    	<table width="80%" border="1" cellpadding="0" cellspacing="0">
		  <tr>
		    <td align="center">
				<jsp:include flush="true" page="head.jsp"></jsp:include>
			</td>
		  </tr>
		  <tr>
		    <td align="center"><table width="100%" border="1" cellpadding="0" cellspacing="0">
		      <tr>
		        <td align="center"><img src="images/cartnavi-3.gif" width="599" height="49" /></td>
		      </tr>
		      <tr>
		        <td align="center"><table width="70%" border="1" class="purchaserInfo01" cellpadding="0" cellspacing="0">
		          <tr>
		            <td colspan="2" align="center">购买人信息</td>
		            </tr>
		          <tr>
		            <td width="50%" align="right">用&nbsp;&nbsp;户&nbsp;&nbsp;名</td>
		            <td width="50%" align="left"><input type="text" name="textfield" id="textfield" value="<%=userBean.get_userName() %>" /></td>
		          </tr>
		          <tr>
		            <td align="right">*真实姓名</td>
		            <td align="left"><input type="text" name="textfield2" id="textfield2" value="<%=userBean.get_userTruename() %>" /></td>
		          </tr>
		          <tr>
		            <td align="right">*家庭住址</td>
		            <td align="left"><input type="text" name="textfield3" id="textfield3" value="<%=userBean.get_userAddress() %>" /></td>
		          </tr>
		          <tr>
		            <td align="right">*联系电话</td>
		            <td align="left"><input type="text" name="textfield4" id="textfield4" value="<%=userBean.get_userPhone() %>" /></td>
		          </tr>
		          <tr>
		            <td align="right">*电子邮件</td>
		            <td align="left"><input type="text" name="textfield5" id="textfield5" value="<%=userBean.get_userEmail() %>" /></td>
		          </tr>
		          <tr>
		            <td align="right">*邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;编</td>
		            <td align="left"><input type="text" name="textfield6" id="textfield6" value="<%=userBean.get_userPostcode() %>" /></td>
		          </tr>
		          <tr>
		            <td align="right"><input type="button" name="button" id="button" value="完成订单" /></td>
		            <td align="left"><input type="button" name="button2" id="button2" value="修改个人信息" /></td>
		          </tr>
		        </table></td>
		      </tr>
		      <tr>
		        <td align="center">
		        <table width="70%" border="1" align="center" class="purchaserInfo01" cellpadding="0" cellspacing="0">
		          <tr align="center">
		            <td colspan="4">我的购物车信息</td>
		            </tr>
		          <tr align="center">
		            <td width="19%">编号</td>
		            <td width="40%">商品名称</td>
		            <td width="22%">单价</td>
		            <td width="19%">数量</td>
		          </tr>
		          <%
		          for(int ilop = 0; ilop < arrList.size(); ilop++){
		        	  GoodsBean goodsBean = (GoodsBean)arrList.get(ilop);
		          %>
		          <tr align="center">
		            <td><%=goodsBean.get_goodsId() %></td>
		            <td><%=goodsBean.get_goodsName() %></td>
		            <td>￥<%=goodsBean.get_goodsPrice() %></td>
		            <td><%=mycartBO.getGoodsNumByGoodsId(goodsBean.get_goodsId()+"") %></td>
		          </tr>
		          <%
		          }
		          %>
		          <tr align="center">
		            <td colspan="4" align="left">您共选择了价值￥<%=mycartBO.getTotalPrice() %> 的商品</td>
		            </tr>
		          <tr align="center">
		            <td colspan="4"><input type="submit" name="BackMycart" value="返回修改我的购物车" /></td>
		            </tr>
		        </table>
		        </td>
		      </tr>
		      <tr align="right">
		        <td><img src="images/cartpre.gif" width="87" height="19" />&nbsp;&nbsp;<img src="images/cartnext.gif" width="87" height="19" /></td>
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
