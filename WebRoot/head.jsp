<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="3" height="10" bgcolor="#FFCCCC"></td>
  </tr>
  <tr>
    <td><table width="100%" border="0">
      <tr>
        <td><img src="images/logo.gif" width="128" height="49" /></td>
        <td><img src="images/test.gif" width="500" height="90" /></td>
        <td bordercolor="#F0F0F0">
          <p class="headfont01"><img src="images/account.gif" width="19" height="14" /><a href="AccountClServlet" >【我的账号】</a></p>
          <p class="headfont01"><img src="images/cart.gif" width="20" height="15" /><a href="ShoopingClServlet?type=showGoods">【我的购物车】</a></p>
         </td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td colspan="3" height="10" bgcolor="#FFCCCC"></td>
  </tr>
  <tr>
    <td><table width="100%" border="0">
      <tr align="center">
        <td width="11%">&nbsp;</td>
        <td width="11%" class="headfont02"><a href="index.jsp" >首页</a></td>
        <td width="11%">&nbsp;</td>
        <td width="11%" class="headfont02">香港电影</td>
        <td width="11%">&nbsp;</td>
        <td width="11%" class="headfont02">大陆电影</td>
        <td width="11%">&nbsp;</td>
        <td width="11%" class="headfont02">关于我们</td>
        <td width="11%">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
