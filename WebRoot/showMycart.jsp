<%@ page language="java" import="java.util.*,com.zjy.model.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

// 取出从ShoopingClServlet传递的购物车信息
ArrayList arrList = (ArrayList)request.getAttribute("mycartInfo");


%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showMycart.jsp' starting page</title>
    
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
<table width="80%" border="1" align="center" class="showMycart01" cellpadding="0" cellspacing="0">
	  <tr>
	    <td height="142" colspan="2" align="center">
			<jsp:include flush="true" page="head.jsp"></jsp:include>
		</td>
	  </tr>
	  <tr>
      	<td height="142" colspan="2" align="center">
          <table width="100%" border="1" cellpadding="0" cellspacing="0" class="showMycart01">
              <tr>
                <td colspan="6" align="center"><img src="images/cartnavi-1.gif" width="599" height="49" /></td>
              </tr>
              <tr>
                <td width="21%" align="center">编号</td>
                <td width="25%" align="center">名称</td>
                <td width="27%" align="center">单价</td>
                <td colspan="3" align="center">数量</td>
              </tr>
              <%
              for(int ilop = 0; ilop < arrList.size(); ilop++){
            	  // 从arrList中取出货物
            	  GoodsBean goodsBean = (GoodsBean)arrList.get(ilop);
              
              
              %>
              
              
              <tr>
                <td align="center"><%=goodsBean.get_goodsId() %></td>
                <td align="center"><%=goodsBean.get_goodsName() %></td>
                <td align="center">￥<%=goodsBean.get_goodsPrice() %></td>
                <td width="9%" align="center"><input type="hidden" name="goodsId" value="1" /><input name="newNum" type="text" size="7" id="newNum" value="1" /></td>
                <td width="9%" align="center"><a href="">删除</a></td>
                <td width="9%" align="center"><a href="">查看</a></td>
              </tr>
              <%
              }
              %>
              <tr>
                <td>&nbsp;</td>
                <td align="center"><input type="button" name="Submit" value="删除全部书籍" /></td>
                <td align="center"><input type="submit" name="Submit2" value="修 改 数 量" /></td>
                <td colspan="3">&nbsp;</td>
              </tr>
              <tr>
                <td colspan="6">&nbsp;</td>
              </tr>
              <tr>
                <td height="44" colspan="6">
                  <table width="100%" border="1" class="showMycart01" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="60%" align="left">您共选择了价值￥100.0的商品,点<a href="index.jsp"> 此处 </a>继续购物。</td>
                        <td width="40%" align="right"><a href="ShoppingCl2"><img border="0" src="images/cartnext.gif" width="87" height="19" /></a></td>
                    </tr>
                  </table>
                </td>
              </tr>
   	      </table>
        </td>
      </tr>
	  <tr>
	    <td height="151" colspan="2" align="center">
			<jsp:include flush="true" page="tail.jsp"></jsp:include>
		</td>
	  </tr>
	</table>
  </center>
  </body>
</html>
