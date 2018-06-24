<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.lyq.bean.*"
	import="com.lyq.manager.GoodsManager" import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>JYU校园小商城</title>
<script type="text/javascript">
	function test(test) {
		window.location.href = './source/goods/Goods.jsp?goodsId=' + test;
	}
</script>
<style type="text/css">
@import url("cantrg/stylesheet.css");

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
</head>
<%
	String key = request.getParameter("key");
	GoodsManager gManager = new GoodsManager();
	List<Goods> list = null;
	if (key != null && !key.equals("")) {
		list = gManager.GetGood(key);
	} else {
		list = gManager.GetGoodList();
	}
	System.out.println(key);
	for (Goods goods : list) {
		System.out.println(goods);
	}
	request.setAttribute("list", list);
%>


<body>
	<table width="1310" height="464" border="0" align="center"
		cellspacing="0">
		<tr>
			<td height="61">
				<table width="1310" border="0" align="center" cellspacing="0">

					<tr valign="middle">
						<td width="684" height="40" valign="bottom"><span class="ys1">&nbsp;&nbsp;&nbsp;
								JYU<span class="ys2">校园商品网</span>
						</span></td>

						<%
							Admin admin = (Admin) session.getAttribute("admin");
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
							<td align="right">未登录<a href="./index.html">[点击登陆]</a></td>
						<%
							}
						%>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="397" valign="top"><p>
					<img src="image/分割线.jpg" width="1310" height="2" />
				</p>
				<table width="1310" height="370" border="0">
					<tr>
						<td height="50" align="center">
							<form id="form1" name="form1" method="post" action="./index.jsp">
								<input name="key" type="text" class="ys3" id="search" size="50" />
								<input type="submit" class="ys3" id="search2" value="搜索" />
							</form>
						</td>
					</tr>
					<%
						if (key != null && !key.equals("") && list.size() > 0) {
					%>
					<tr>
						<td>搜索结果如下：</td>
					</tr>
					<%
						}
						if (list.size() == 0) {
					%>
					<tr>
						<td>没有搜索到相关商品！</td>
					</tr>
					<%
						}
					%>
					<tr>
						<td height="314">
							<table width="1310" border="0" cellpadding="0" cellspacing="3">
								<c:forEach items="${requestScope.list}" var="li" varStatus="id"
									end="16">
									<c:if test="${(id.count-1)%5==0}">
										<tr>
									</c:if>
									<td width="262" height="300" bgcolor="#FFFFFF"><a>
											<table width="200" border="0" align="center" cellpadding="0"
												cellspacing="0" onclick="test('${li.id}')">
												<tr>
													<td height="200"><img height="200" width="200"
														src="file:///${li.path}" /></td>
												</tr>
												<tr>
													<td height="50" align="center" valign="middle"><p>${li.name}</p>
														<p>${li.price}</p></td>
												</tr>
											</table>
									</a></td>
									<c:if test="${id.count%5==0}">
										</tr>
									</c:if>
								</c:forEach>
								<td>&nbsp</td>
								<td>&nbsp</td>
								<td>&nbsp</td>
								<!--  <tr>
									<td width="262" height="300" bgcolor="#FFFFFF"><table
											width="200" border="0" align="center" cellpadding="0"
											cellspacing="0">
											<tr>
												<td height="200">&nbsp;</td>
											</tr>
											<tr>
												<td height="50" align="center" valign="middle"><p>xxxxxxxxxx</p>
													<p>￥15.00</p></td>
											</tr>
										</table></td>
									<td bgcolor="#FFFFFF"><table width="200" border="0"
											align="center" cellpadding="0" cellspacing="0">
											<tr>
												<td height="200">&nbsp;</td>
											</tr>
											<tr>
												<td height="50" align="center" valign="middle"><p>xxxxxxxxxxx</p>
													<p>￥8.00</p></td>
											</tr>
										</table></td>
									<td bgcolor="#FFFFFF"><table width="200" border="0"
											align="center" cellpadding="0" cellspacing="0">
											<tr>
												<td height="200">&nbsp;</td>
											</tr>
											<tr>
												<td height="50" align="center" valign="middle"><p>xxxxxxxxxx</p>
													<p>￥20.00</p></td>
											</tr>
										</table></td>
									<td bgcolor="#FFFFFF"><table width="200" border="0"
											align="center" cellpadding="0" cellspacing="0">
											<tr>
												<td height="200">&nbsp;</td>
											</tr>
											<tr>
												<td height="50" align="center" valign="middle"><p>xxxxxxxxxx</p>
													<p>￥18.00</p></td>
											</tr>
										</table></td>
									<td height="250" bgcolor="#FFFFFF"><table width="200"
											border="0" align="center" cellpadding="0" cellspacing="0">
											<tr>
												<td height="200">&nbsp;</td>
											</tr>
											<tr>
												<td height="50" align="center" valign="middle"><p>xxxxxxxxxx</p>
													<p>￥5.00</p></td>
											</tr>
										</table></td>
								</tr>
								<tr>
									<td width="262" height="300" bgcolor="#FFFFFF"><table
											width="200" border="0" align="center" cellpadding="0"
											cellspacing="0">
											<tr>
												<td height="200">&nbsp;</td>
											</tr>
											<tr>
												<td height="50" align="center" valign="middle"><p>xxxxxxxxxx</p>
													<p>￥5.00</p></td>
											</tr>
										</table></td>
									<td bgcolor="#FFFFFF"><table width="200" border="0"
											align="center" cellpadding="0" cellspacing="0">
											<tr>
												<td height="200">&nbsp;</td>
											</tr>
											<tr>
												<td height="50" align="center" valign="middle"><p>xxxxxxxxxx</p>
													<p>￥10.00</p></td>
											</tr>
										</table></td>
									<td bgcolor="#FFFFFF"><table width="200" border="0"
											align="center" cellpadding="0" cellspacing="0">
											<tr>
												<td height="200">&nbsp;</td>
											</tr>
											<tr>
												<td height="50" align="center" valign="middle"><p>xxxxxxxxxx</p>
													<p>￥2.00</p></td>
											</tr>
										</table></td>
									<td bgcolor="#FFFFFF"><table width="200" border="0"
											align="center" cellpadding="0" cellspacing="0">
											<tr>
												<td height="200">&nbsp;</td>
											</tr>
											<tr>
												<td height="50" align="center" valign="middle"><p>xxxxxxxxxx</p>
													<p>￥18.00</p></td>
											</tr>
										</table></td>
									<td bgcolor="#FFFFFF"><table width="200" border="0"
											align="center" cellpadding="0" cellspacing="0">
											<tr>
												<td height="200">&nbsp;</td>
											</tr>
											<tr>
												<td height="50" align="center" valign="middle"><p>xxxxxxxxxx</p>
													<p>￥4.50</p></td>
											</tr>
										</table></td>
								</tr>-->
							</table>&nbsp;
						</td>
					</tr>
				</table>
				</p></td>
		</tr>
	</table>
</body>
</html>
