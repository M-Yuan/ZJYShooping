<%@ page language="java" import="java.util.*, com.zjy.model.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

// 获取goodsBean来显示Detail信息，先定义GoodsBeanBO
GoodsBean goodsBean = new GoodsBean();

goodsBean = (GoodsBean)request.getAttribute("goodsInfo");

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showDetail.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<!-- 引入css样式 -->
	<link href="css/shopping.css" rel="stylesheet" type="text/css" />


	<script type="text/javascript">
		//响应点击返回购物大厅的事件
		function BacktoHall(){
			// 默认open函数，是打开一个新页面,如果在后面加入一个"_self",则在原页面显示
			window.open("index.jsp", "_self");
		}
		
		// 响应点击购物事件
		function BuyGoods(goodsId){
			//System.out.println("javascript function BuyGoods(goodsId)");
			window.open("ShoopingClServlet?type=buyGoods&goodsId="+goodsId, "_self");
			//window.alert(goodsId);
		}
	</script>
	
  </head>
  
<body topmargin="0" background="images/bg.bmp">
<center>
<table width="80%" border="1" >
  <tr>
    <td align="center">
		<jsp:include flush="true" page="head.jsp"></jsp:include>
	</td>
  </tr>
  <tr>
    <td height="388" align="center"><table class="showDetail01" width="100%" border="1">
      <tr>
        <td colspan="2">&nbsp;</td>
        </tr>
      <tr>
        <td width="32%" rowspan="8"><img src="images/<%=goodsBean.get_goodsPhoto() %>" width="136" height="169" /></td>
        <td width="68%" align="center" ><%=goodsBean.get_goodsName() %></td>
      </tr>
      <tr>
        <td>价格：$<%=goodsBean.get_goodsPrice() %></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>ISBN：<%=goodsBean.get_goodsId() %></td>
      </tr>
      <tr>
        <td>类型1：<%=goodsBean.get_goodsType() %></td>
      </tr>
      <tr>
        <td>出版商：<%=goodsBean.get_goodsPublisher() %></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="142" valign="top"><%=goodsBean.get_goodsIntro() %></td>
      </tr>
      <tr>
        <td colspan="2">
          <input type="button" name="Submit" onclick="BuyGoods(<%=goodsBean.get_goodsId() %>);" value="购物" />
          <input type="button" name="Submit2" onclick="BacktoHall();" value="返回购物大厅" /></td>
      </tr>
      <tr>
        <td colspan="2">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="102" align="center">
    	<jsp:include flush="true" page="tail.jsp"></jsp:include>
    </td>
  </tr>
</table>
</center>
</body>
</html>
