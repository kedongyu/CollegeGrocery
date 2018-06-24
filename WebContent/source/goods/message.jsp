<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.lyq.bean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文件上传结果</title>
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
	Goods goods = (Goods) request.getAttribute("goods");
%>
<body>
	<table width="1310" border="0" align="center">

		<tr>
			<td height="399"><table width="1310" border="0">
					<tr>
						<td width="500" height="623" valign="top"><p>&nbsp;</p>
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
									<td width="599" bgcolor="#ccFFFF" class="ys2"><form
											id="form2" name="form2" method="post" action="">
											<label for="textfield2"></label> <input name="textfield2"
												type="text" class="ys2" id="textfield2" value="<%=goods.getName()%>" />
										</form></td>
								</tr>
								<tr valign="middle">
									<td height="186" bgcolor="#ccFFFF" class="ys2"><form
											action="" method="post" name="form3" class="ys2" id="form3">
											<label for="textarea"></label>

											<textarea name="textarea" cols="45" rows="5" class="ys2"
												id="textarea"><%=goods.getDescribe()%></textarea>
										</form></td>
								</tr>
								<tr>
									<td height="73" bgcolor="#ccFFFF"><table border="0">
											<tr align="center">
												<td width="130" height="49" bgcolor="#ccFFFF"><form
														action="" method="post" name="form4" class="ys4"
														id="form4">
														<label for="textfield3"></label> <input name="textfield3"
															type="text" class="ys2" id="textfield3" value="<%=goods.getPrice()%>"
															size="10" />
													</form></td>
												<td width="321" bgcolor="#ccFFFF">&nbsp;</td>
											</tr>
										</table></td>
								</tr>
								<tr>
									<td height="119" bgcolor="#ccFFFF">是否提交此商品？
										<form method="post" action="./addGoodsAction"
											enctype="multipart/form-data" accept="image/*">
											<input type="hidden" name="goods.name"
												value="<%=goods.getName()%>" /> <input type="hidden"
												name="goods.path" value="<%=goods.getPath()%>" /> <input
												type="hidden" name="goods.price"
												value="<%=goods.getPrice()%>" /> <input type="hidden"
												name="goods.describe" value="<%=goods.getDescribe()%>" /> <input
												type="hidden" name="goods.manager_id"
												value="<%=((Admin) session.getAttribute("admin")).getId()%>" />
											<input type="submit" value="提交" />
										</form>
									</td>
								</tr>
							</table></td>
					</tr>
				</table></td>
		</tr>
	</table>



	<center>

	</center>



</body>
</html>