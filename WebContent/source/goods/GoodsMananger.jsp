<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.lyq.bean.*" import="com.lyq.manager.*"
	import="java.util.List" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>商品管理</title>
</head><script type="text/javascript">
	function test(test) {
		window.location.href = '/CollegeGrocery/index.jsp';
	}
</script>
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
<body>
	<%
		Admin admin = (Admin) session.getAttribute("admin");
		GoodsManager gManager = new GoodsManager();
		List<Goods> list = gManager.GetGoodByManagerId(admin.getId());
		request.setAttribute("list", list);
	%>
	<table width="1310" border="0" align="center">
		<tr>
			<td height="59"><table width="1310" border="0">
					<tr valign="middle">
					<td width="684" height="40" valign="bottom" onclick="test()"><span class="ys1">&nbsp;&nbsp;&nbsp;
								JYU<span class="ys2">校园商品网</span>
						</span></td>
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
			<td height="411"><table width="1310" border="0">

					<tr>
						<td>我发布的商品：(<a href="http://localhost:8080/CollegeGrocery/source/goods/addGoods.html">点击这里发布商品</a>)</td>
					</tr>
					<%
						for (Goods goods : list) {
					%>
					<tr valign="top">
						<td height="119" valign="top">



							<table width="1310" border="0" cellspacing="0">
							</table>
							<table width="1310" border="0">
								<tr>
									<td width="247" height="186" align="center" bgcolor="#FFFFFF"><table
											width="150" border="1">
											<tr>
												<td width="143" height="150"><img width="143"
													height="150" src="file:///<%=goods.getPath()%>" /></td>
											</tr>
										</table></td>
									<td width="645" bgcolor="#FFFFFF" class="ys4">
										<table>
											<tr>
												<td>商品名称：</td>
												<td><%=goods.getName()%></td>
											</tr>
											<tr>
												<td>商品单价：</td>
												<td><%=goods.getPrice()%></td>
											</tr>
											<tr>
												<td>描&nbsp;&nbsp;&nbsp;&nbsp;述:</td>
												<td>
													<table>
														<tr>
															<td><%=goods.getDescribe()%></td>
														</tr>
													</table>
												</td>
											</tr>
										</table>
									</td>
									<td width="200" align="center" bgcolor="#FFFFFF" class="ys4"><a href="./myGoods.jsp?goodsId=<%=goods.getId()%>">查看</a>/<a href="./correctGoods.jsp?goodsId=<%=goods.getId()%>" onclick="alert('是否刪除？')">修改</a>/<a href="/CollegeGrocery/deleteGoodsAction?goods.id=<%=goods.getId()%>">刪除</a></td>
								</tr>
							</table>
						</td>
					</tr>

					<%
						}
					%>

					<tr>
						<td height="43"></td>
					</tr>
				</table></td>
		</tr>

	</table>
</body>
</html>