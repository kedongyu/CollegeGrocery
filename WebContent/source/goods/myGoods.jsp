<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.lyq.manager.*" import="com.lyq.bean.*" import="java.util.List"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>商品查看</title>
</head><style type="text/css">
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
	color: #999999;
}

.ys3 {
	font-size: 36px;
	background-color: #ffffcc;
	color: #3399cc;
}

.ys4 {
	font-size: 30px;
}

.ys2 #form2 #textfield2 {
	color: #999999;
	font-family: "Comic Sans MS", cursive;
}

.ys2 #form3 #textarea {
	color: #999999;
}
</style>
<%
	int id=Integer.valueOf((String)request.getParameter("goodsId"));
	GoodsManager gManager=new GoodsManager();
	Goods goods=gManager.GetGoodById(id);
	request.setAttribute("goods", goods);
	

	Admin admin = (Admin) session.getAttribute("admin");
	OrderManager orderManager = new OrderManager();
	List<Order> list = orderManager.getOrderListByGoodsId(goods.getId());
	request.setAttribute("admin", admin);
	request.setAttribute("list", list);
	request.setAttribute("gManager",gManager);
	AdminManager aManager=new AdminManager();
	request.setAttribute("aManager", aManager);
	

%>
<script type="text/javascript">
	function test(test) {
		window.location.href = '/CollegeGrocery/index.jsp';
	}
</script>
<body>
<table width="1310" border="0" align="center">
  <tr valign="top">
    <td width="1729"><table width="1310" border="0">
      <tr>
        <td height="35">&nbsp;</td>
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
    </table>
    <img src="image/分割线.jpg" width="1310" height="2" /></td>
  </tr>
  <tr align="right">
    <td height="50"><form id="form1" name="form1" method="post" action="">
      <input name="textfield" type="text" class="ys2" id="textfield" size="40" />
      <input name="button" type="submit" class="ys2" id="button" value="搜索" />
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 
    </form></td>
  </tr>
  <tr>
    <td height="299"><table width="1310" border="0">
      <tr>
        <td width="500" height="523" valign="top"><p>&nbsp;</p>
          <p>&nbsp;</p>
          <table width="400" height="118" border="1" align="center">
          <tr>
            <td height="400" align="center" valign="middle">
              
				<img height="400" width="400" src="file:///<%=goods.getPath()%>" />
            </td>
          </tr>
        </table></td>
        <td width="800" valign="top"><p>&nbsp;</p>
          <p>&nbsp;</p>
          <table width="605" height="435" border="0" align="center">
          <tr>
            <td width="599" bgcolor="#ccFFFF" class="ys2">
              	商品名称：${goods.name}
              </td>
          </tr>
          <tr valign="middle">
            <td height="186" bgcolor="#ccFFFF" class="ys2"><form action="" method="post" name="form3" class="ys2" id="form3">
              <label for="textarea"></label>
            
              <textarea name="textarea" cols="45" rows="5" class="ys2" id="textarea" readonly="readonly">${goods.describe}</textarea>
            </form></td>
          </tr>
          <tr >
            <td height="73" bgcolor="#ccFFFF"><table border="0">
              <tr >
                <td width="130" height="49" bgcolor="#ccFFFF">
                  <label for="textfield3"></label>
                  	单价：${goods.price}</td>
                </tr>
              </table></td>
          </tr>
          <tr >
            <td height="119" bgcolor="#ccFFFF"><form id="form6" name="form6" method="post" action="">
              <a href="./correctGoods.jsp?goodsId=<%=goods.getId()%>"><input name="button2" type="button" class="ys4" id="button2" value="修改" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </form></td>
          </tr>
          </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
  	<td><h2>商品订单：</h2></td>
  </tr>
  <%
						for(Order order:list){
							request.setAttribute("order", order);
							Admin adm=aManager.getAdmin(order.getOwerId());
							
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
													<td>联系电话：</td>
													<td><%=adm.getPhone() %></td>
												</tr>
												<tr height="40">
													<td>收货地址：</td>
													<td>${order.address }</td>
												</tr>
												<tr height="40">
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
 
</table>
</body>
</html>