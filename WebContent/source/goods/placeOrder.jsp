<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.lyq.bean.Goods"
	import="com.lyq.manager.GoodsManager" import="com.lyq.bean.Admin" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增订单</title>
</head>
<style type="text/css">
body {
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
</style>
<%
	int id = Integer.valueOf(request.getParameter("id"));
	int count = Integer.valueOf(request.getParameter("count"));
	System.out.println(id + " " + count);
	GoodsManager gManager = new GoodsManager();
	Goods goods = gManager.GetGoodById(id);
	Admin admin = (Admin) session.getAttribute("admin");
	request.setAttribute("goods", goods);
	request.setAttribute("admin", admin);
	request.setAttribute("count", count);
%><script type="text/javascript">
	function test(test) {
		window.location.href = '/CollegeGrocery/index.jsp';
	}
</script>
<body>
	<form method="post" action="/CollegeGrocery/addOrderAction">
		<table width="1200" border="0" align="center">
			<tr>
				<td>
					<table width="1310" border="0" align="center" cellspacing="0">

						<tr valign="middle">
							<td width="684" height="40" valign="bottom" onclick="test()"><span
								class="ys1">&nbsp;&nbsp;&nbsp; JYU<span class="ys2">校园商品网</span>
							</span></td>

							<%
								if (admin != null) {
							%>
							<td width="120" align="center" valign="bottom"><%=admin.getName()%></td>
							<td width="120" align="center" valign="bottom"><a
								href="http://localhost:8080/CollegeGrocery/source/admin/userInfo.jsp">个人中心</a></td>
							<!-- <td width="120" align="center" valign="bottom"><a>购物车</a></td> -->
							<%
								if (admin.getPower() < 2) {
							%>
							<td width="120" align="center" valign="bottom"><a
								href="/CollegeGrocery/source/goods/GoodsMananger.jsp">商品管理</a></td>
							<%
								}
							%>
							<td width="120" align="center" valign="bottom"><a
								href="http://localhost:8080/CollegeGrocery/source/goods/myOrder.jsp">我的订单</a></td>
							<td width="120" align="center" valign="bottom"><a
								href="http://localhost:8080/CollegeGrocery/logoutAction ">退出</a></td>
							<%
								} else {
							%>
							<td width="0.75"></td>
							<td align="right">未登录<a href="/CollegeGrocery/index.html">[点击登陆]</a></td>
							<%
								}
							%>
						</tr>
					</table> <img src="image/分割线.jpg" width="1310" height="2" />



				</td>
			</tr>
			<tr height="100">
				<td height="66" align="center" valign="middle"><span
					class="ys3">输入收货地址</span> <input name="order.address" type="text"
					class="ys3" id="textfield" size="30" /></td>
			</tr>
			<tr>
				<td height="81"><table width="1200" height="204" border="0"
						align="center" cellspacing="0">
						<tr>
							<td width="200" height="200" align="center" bgcolor="#FFFFFF"><table
									width="150" border="1">
									<tr>
										<td width="150" height="150"><img height="200"
											width="200" src="file:///${request.goods.path}" />
											</td>
										
									</tr>
								</table></td>
							<td width="244" valign="top" bgcolor="#FFFFFF"><p>&nbsp;</p>
								<p>${request.goods.name}</p>
								<p>${request.goods.describe}</p></td>
							<td width="445" bgcolor="#FFFFFF">&nbsp;</td>
							<td width="135" align="center" bgcolor="#FFFFFF">${request.count}<input
								name="order.goodsCount" type="hidden" value="${request.count}" /></td>
							<td width="135" align="center" valign="middle" bgcolor="#FFFFFF">单价:${request.goods.price}</td>
						</tr>
					</table></td>
			</tr>
			<tr>
				<td height="175"><table width="1200" border="0" align="center"
						cellspacing="0">
						<tr>
							<td width="1052" height="97" align="left" valign="middle"
								bgcolor="#FFFFFF"><span class="ys3">&nbsp;备注</span> <textarea
									name="order.remark" id="textarea" cols="45" rows="5"></textarea></td>
							<td width="138" align="center" bgcolor="#FFFFFF">总额：${request.count*request.goods.price }</td>
						</tr>
					</table>
					<p>&nbsp;</p>
					<table width="1310" border="0">
						<tr>
							<td height="45" align="right">
								<p>
									<input name="order.owerId" type="hidden" value="${requestScope.admin.id }" />
									<input name="order.goodsId" type="hidden" value="${goods.id }" />
									<input name="button" type="submit" class="ys3" id="button"
										value="提交订单" />
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</p>

							</td>
						</tr>
					</table>
					<p>&nbsp;</p></td>
			</tr>
		</table>
	</form>
</body>
</html>