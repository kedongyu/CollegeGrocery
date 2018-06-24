<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.lyq.bean.*" import="com.lyq.manager.*"
	import="java.util.List" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>我的订单</title>
</head>
<script type="text/javascript">
	function test(test) {
		window.location.href = './Goods.jsp?goodsId=' + test;
	}
</script>
<style type="text/css">
body {
	background-color: #ccffff;
	font-size: 36px;
}

.ys1 {
	font-size: 14px;
}

.ys2 {
	color: #039;
	font-family: "Comic Sans MS", cursive;
}

.ys3 {
	font-size: 18px;
}

.影视 {
	font-size: 24px;
}

.ys4 {
	font-size: 18px;
}body {
	background-color: #ccffff;
	font-size: 24px;
}

.ys1 {
	font-size: 36px;
	color: #003366;
	font-weight: bold;
}

.ys2 {
	font-size: 36px;
	color: #000000;
	font-family: "Comic Sans MS", cursive;
}

.ys1 {
	font-weight: bold;
}

.ys3 {
	font-size: 24px;
	font-family: cantrg;
}

.ys4 {
	
}

body, td, th {
	font-size: 18px;
}

.ys4 {
	
}

a {
	color: blue;
}

a:hover {
	color: red;
}
</style><script type="text/javascript">
	function test(test) {
		window.location.href = '/CollegeGrocery/index.jsp';
	}
</script>
<body>
	<%
		Admin admin = (Admin) session.getAttribute("admin");
		OrderManager orderManager = new OrderManager();
		GoodsManager gManager=new GoodsManager();
		List<Order> list = orderManager.getOrderListByOwerid(admin.getId());
		request.setAttribute("admin", admin);
		request.setAttribute("list", list);
		request.setAttribute("gManager",gManager);
	%>
	<table width="1310" border="0" align="center">
		<tr>
			<td height="59"><table width="1310" border="0">
					<tr valign="middle">
						<td height="40" valign="bottom" onclick="test()">&nbsp;&nbsp;&nbsp;<span
							class="ys2">&nbsp; JYU</span>校园商品网
						</td>
						<%
							if (admin != null) {
						%>
						<td width="120" align="center" valign="bottom"><%=admin.getName()%></td>
						<td width="120" align="center" valign="bottom" class="ys4"><a
							href="http://localhost:8080/CollegeGrocery/source/admin/userInfo.jsp">个人中心</a></td>
						<!-- <td width="120" align="center" valign="bottom"><a>购物车</a></td> -->
							<%
								if(admin.getPower()<2)
								{
							%>
									<td width="120" align="center" valign="bottom"><a href="/CollegeGrocery/source/goods/GoodsMananger.jsp">商品管理</a></td>
							<%
								}
							%>
						<td width="120" align="center" valign="bottom"><a href="http://localhost:8080/CollegeGrocery/source/goods/myOrder.jsp">我的订单</a></td>
						<td width="120" align="center" valign="bottom"><a href="http://localhost:8080/CollegeGrocery/logoutAction ">退出</a></td>
						<%
							}
							else{
						%>
							<td width="0.75"> </td>
							<td align="right">未登录<a href="/CollegeGrocery/index.html">[点击登陆]</a></td>
						<%
							}
						%>
					</tr>
				</table></td>
		</tr>
		<tr align="right">
			<td height="80" valign="middle"></td>
		</tr>
		<tr>


			<td height="911"><table width="1310" border="0">
					<tr>我的订单</tr>
					<%
						for(Order order:list){
							request.setAttribute("order", order);
					%>
						<tr valign="top">
							<td height="219" valign="top"><table width="1310" border="0"
									cellspacing="0">
									<tr>
										<td bgcolor="#FFFFFF" class="ys4">&nbsp;&nbsp;
											&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											${order.date}</td>
									</tr>
								</table>
								<table width="1310" border="0" onclick="test(${order.goodsId})">
									<tr>
										<%
											Goods goods=gManager.GetGoodById(order.getGoodsId());
										%>
										<td width="247" height="186" align="center" bgcolor="#FFFFFF"><table
												width="150" border="1">
												<tr>
													<td width="143" height="150"><img height="200" width="200"
														src="file:///<%=goods.getPath() %>" /></td>
												</tr>
											</table></td>
										<td width="645" bgcolor="#FFFFFF" class="ys4">
											<table height="186">
												<tr height="40">
													<td>商品名称：</td>
													<td><%=goods.getName() %></td>
												</tr>
												<tr height="40">
													<td>订购数量：</td>
													<td><%=order.getGoodsCount() %></td>
												</tr>
												<tr height="40">
													<td>收货地址：</td>
													<td>${order.address }</td>
												</tr>
												<tr height="80">
													<td height="20" align="top|left">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</td>
													<td>${order.remark}</td>
												</tr>
											</table>
											
										</td>
										<td width="200" align="center" bgcolor="#FFFFFF" class="ys4"><%=goods.getPrice()*order.getGoodsCount() %></td>
										<td width="200" align="center" bgcolor="#FFFFFF" class="ys4"><%=order.getState()==0?"正在进行中":"已完成" %></td>
									</tr>
								</table></td>
						</tr>
						<%} %>
					<tr>
						<td height="43"></td>
					</tr>
				</table></td>
		</tr>
	</table>
</body>
</html>