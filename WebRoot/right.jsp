<%@ page language="java" import="java.util.*,com.zjy.model.*,com.zjy.servlet.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

/** 动态显示
 * 1.pageNow必须要知道
 * 2.获取goodsbean
 */

 
// 获取goodsbean
GoodsBeanBO goodsbb= new GoodsBeanBO();
//GoodsBean goodsBean = goodsbb.getGoodsBean("");

/** 分页显示必须要先做
 * 1.计算pageCount，pageNow，前提条件获取到GoodsBeanBo
 */

// 初始化,网页第一次打开
int pageNow = 1;
int pageSize = 6;

// 跳转页面时获取pageNow, 从哪儿获取？->从ShowGoodsClServlet中获取
String s_pageNow = (String)request.getAttribute("s_pageNow");

if(s_pageNow != null){
	pageNow = Integer.parseInt(s_pageNow);
}

// 获取pageCount
int pageCount = goodsbb.getPageCount(pageSize);

// ArrayList存储从GoodsBeanBO中取出的数据，默认显示第一页
ArrayList arrList = goodsbb.getGoodsByPage(6,pageNow);

%>

<table width="100%" border="1">
  <tr>
    <td colspan="3"><img src="images/hotlist.bmp" /></td>
  </tr>
  <%
  	// 对goods分两大行来打印
  	int irow = 2;
	//定义变量表示打印table的次数
	int itimes = 0;
  	for(int ilop = 0; ilop < irow; ilop++){
	
  %>
  <tr>
  	<%
		// 每行打印三个goods信息的table
	   	int icol = 3;
  		for(int jlop = 0; jlop < icol; jlop++)
  		{
  			GoodsBean goodsBean = new GoodsBean();
  	  		//goodsBean = goodsbb.getGoodsBean(goodsId);
  			if(itimes >= arrList.size()){	// 此时，goods表的元素总数不足
  				goodsBean.set_goodsId(0);
  				goodsBean.set_goodsName("无图书");
  				goodsBean.set_goodsIntro("图书没有库存了");
  				goodsBean.set_goodsNum(0);
  				goodsBean.set_goodsPrice(0.0f);
  				goodsBean.set_goodsPhoto("none.jpg");
			
  			}else{							// 获取此时的goodsBean
  				goodsBean = (GoodsBean)arrList.get(itimes);
  				//System.out.println("goodsBean[");
  				//System.out.println(itimes);
  				//System.out.println("] = ");
  				//System.out.println(goodsBean);
  				//System.out.println("\r");
  				
  				itimes++;
  			}
  			
  			
  	%>
    <td width="33%" height="174" topMargin="0">
		<table width="100%" height="170" border="1" cellpadding="0" cellspacing="0">
		  <tr>
			<td width="32%" rowspan="3" align="left">				
					<img src="images/<%=goodsBean.get_goodsPhoto() %>" width="112" height="112" />
			</td>
			<td width="68%" height="39">&nbsp;</td>
		  </tr>
		  <tr>
			<td height="41" class="rightstyle01"><a href="ShowGoodsClServlet?type=showDetail&goodsID=<%=goodsBean.get_goodsId() %>"><%=goodsBean.get_goodsName() %></a></td>
		  </tr>
		  <tr>
			<td height="17" class="rightstyle01">价格：$<%=goodsBean.get_goodsPrice() %>></td>
		  </tr>
		  <tr>
			<td height="83" colspan="2" class="rightstyle01">简单介绍： <%=goodsBean.get_goodsIntro() %></td>
		  </tr>
		 </table>
	</td>
	<%
			
  		}
	%>

  </tr>
  <%
  	// 该行只在中间打印一次
  	if(ilop == 0)
  	{
  %>
  <tr>
    <td colspan="3" height="10" bgcolor="#FFCCCC"></td>
  </tr>
  <%
  	}
  %>
  <%
  	}
  %>

  <tr>
    <td height="44" colspan="3" align="center">
    <%
    	for(int ilop = 1; ilop <= pageCount; ilop++){
    %>
    	<a href="ShowGoodsClServlet?type=fenye&pageNow=<%=ilop %>">【<%=ilop %>】</a>
    <%
    	}
    %>
    </td>
  </tr>
</table>


