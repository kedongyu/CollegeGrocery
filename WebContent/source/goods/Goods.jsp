<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.lyq.manager.GoodsManager" import="com.lyq.bean.Admin"
	import="com.lyq.bean.Goods"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<%
			String id = request.getParameter("goodsId");
			GoodsManager gManager = new GoodsManager();
			Goods goods = gManager.GetGoodById(Integer.valueOf(id));
			request.setAttribute("goods", goods);
		%>
<title>${request.goods.name }</title>
</head>
<style type="text/css">
body {
	background-color: #ccffff;
	font-family: 50;
	color: #000000;
}

.ys1 {
	font-size: 18px;
}

.ys2 {
	font-size: 24px;
	font-family: 50;
}

.ys3 {
	font-size: 36px;
	background-color: #ffffcc;
	color: #3399cc;
}

.ys4 {
	font-size: 30px;
}

body, td, th {
	font-size: 18px;
}


a {
	color: blue;
}

a:hover {
	color: red;
}
</style>
<script>
function add(){
	var count=document.getElementById("count"); 
	count.value=count.value - 0 + 1;	
}
function reduce(){
	var count=document.getElementById("count");
	count.value=count.value - 1;
	if(count.value<0)
		count.value=0;
}

</script>
<script type="text/javascript">
	function test(test) {
		window.location.href = '/CollegeGrocery/index.jsp';
	}
</script>
<body>
	<table width="1310" border="0" align="center">
		<tr valign="top">
			<td width="1729">

	 		<table width="1310"  border="0" align="center" cellspacing="0">

					<tr valign="middle">
						<td width="684" height="40" valign="bottom" onclick="test()"><span class="ys1">&nbsp;&nbsp;&nbsp;
								JYU<span class="ys2">校园商品网</span>
						</span></td>

						<%
							Admin admin = (Admin) session.getAttribute("admin");
							if (admin != null) {
						%>
						<td width="120" align="center" valign="bottom"><%=admin.getName()%></td>
						<td width="120" align="center" valign="bottom" ><a
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
				</table>
					<tr>
						<td height="150" align="center">
							<form id="form1" name="form1" method="post" action="/CollegeGrocery/index.jsp">
								<input name="key" type="text" class="ys3" id="search" size="50" />
								<input type="submit" class="ys3" id="search2" value="搜索" />
							</form>
						</td>
					</tr>
		<tr>
			<td height="399"><table width="1310" border="0">
					<tr>
						<td width="500" height="623" valign="top"><p>&nbsp;</p>
							<p>&nbsp;</p>
							<table width="400" height="118" border="0" align="center">
								<tr>
									<td height="500" align="center" width="500" valign="middle">
										<img height="500" width="500"
										src="file:///${requestScope.goods.path}" />
									</td>
								</tr>
							</table></td>
						<td width="800" valign="top"><p>&nbsp;</p>
							<p>&nbsp;</p>
							<table width="600" height="406" border="0" align="center">

								<tr>
									<td height="104" valign="top" class="ys2"><p>${requestScope.goods.name}</p>
										<font size="3" color="grey"><p>${requestScope.goods.describe}</p></font></td>
								</tr>
								<form id="form4" name="form4" method="post" action="./placeOrder.jsp">
								<tr>
									<td height="73"><table border="0">
											<tr>
												<td width="100" height="49"><label for="价格"> </label> 
												<input name="id" type="hidden" class="ys2" id="价格" size="10" value="${requestScope.goods.id}" /> 
												<font size="5">${requestScope.goods.price}￥</font></td>
											</tr>
											<tr>
												<td width="200">订购数量：
												<input	name="count" type="text" class="ys2" id="count" size="2" value="1"/></td>
												<td width="414">
												<table border="0">
														<tr>
															<td width="37"><input type="button" name="button2"
																id="button2" value=" + " onclick="add()"/></td>
														</tr>
														<tr>
															<td><input type="button" name="button3" id="button3"
																value=" -  " onclick="reduce()"/></td>
														</tr>
												</table></td>
											</tr>
										</table></td>
								</tr>
								<tr>
									<td height="167"><span class="ys1"> <input
											name="button5" type="submit" class="ys3" id="button5"
											value="立即购买" />
									</span></td>
								</tr>
								</form>
							</table></td>
					</tr>
				</table></td>
		</tr>
	</table>
</body>
</html>