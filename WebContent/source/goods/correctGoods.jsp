<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.lyq.bean.*" import="com.lyq.manager.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="UTF-8">
<title>商品修改</title>
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
</style><script type="text/javascript">
	function test(test) {
		window.location.href = '/CollegeGrocery/index.jsp';
	}
</script>
</head>
<%
	int id=Integer.valueOf((String)request.getParameter("goodsId"));
	
	Admin admin=(Admin)session.getAttribute("admin");
	GoodsManager gManager=new GoodsManager();
	Goods goods=gManager.GetGoodById(id);
	if(goods.getManager_id()!=admin.getId());
	{
		
	}
	request.setAttribute("goods",goods);
	
%>

<body>
<form method="post" action="/CollegeGrocery/correctGoodsAction">
<table width="1310" border="0" align="center">
  <tr valign="top">
    <td width="1729"><table width="1310" border="0">
      <tr>
        <td width="684" height="40" valign="bottom" onclick="test()"><span class="ys1">&nbsp;&nbsp;&nbsp;
								JYU<span class="ys2">校园商品网</span>
						</span></td>

						<%
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
    <img src="image/分割线.jpg" width="1310" height="2" /></td>
  </tr>
  <tr align="right">
    <td height="50">
      <input name="textfield" type="text" class="ys2" id="textfield" size="40" />
      <input name="button" type="submit" class="ys2" id="button" value="搜索" />
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 
    </td>
  </tr>
  <tr>
    <td height="399"><table width="1310" border="0">
      <tr>
        <td width="500" height="623" valign="top"><p>&nbsp;</p>
          <p>&nbsp;</p>
          <table width="400" height="118" border="1" align="center">
          <tr>
            <td height="400" align="center" valign="middle">
              <label for="fileField"></label>
              	<img height="390" width="390" src="file:///<%=goods.getPath()%>"/>
            </td>
          </tr>
        </table></td>
        <td width="800" valign="top"><p>&nbsp;</p>
          <p>&nbsp;</p>
          <table width="605" height="435" border="0" align="center">
          <tr>
            <td width="599" bgcolor="#ccFFFF" class="ys2">
              <label for="textfield2"></label>
              名稱：<input name="goods.name" type="text" class="ys2" id="textfield2" value="${requestScope.goods.name }" />
           </td>
          </tr>
          <tr valign="middle">
            <td height="186" bgcolor="#ccFFFF" class="ys2">
              <label for="textarea"></label>
            
              描述：<textarea name="goods.describe" cols="45" rows="5" class="ys2" id="textarea">${requestScope.goods.describe}</textarea>
            </td>
          </tr>
          <tr >
            <td height="73" bgcolor="#ccFFFF"><table border="0">
              <tr >
                <td width="130" height="49" bgcolor="#ccFFFF">
                  <label for="textfield3"></label>
                <h3>  单价：</h3><input name="goods.price" type="text" class="ys2" id="textfield3" value="${requestScope.goods.price }" size="10" />
                 </td>
                <td width="321" bgcolor="#ccFFFF">&nbsp;</td>
                </tr>
              </table></td>
          </tr>
          <tr >
            <td height="119" bgcolor="#ccFFFF">
            <input name="goods.id" type="hidden" value="${requestScope.goods.id}"/>
              <input name="button2" type="submit" class="ys4" id="button2" value="保存" />
            </td>
          </tr>
          </table></td>
      </tr>
    </table></td>
  </tr>
</table></form>
</body>
</html>