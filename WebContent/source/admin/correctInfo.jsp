<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.lyq.bean.Admin"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style type="text/css">
body {
	background-color: #ccffff;
}

.ys1 {
	font-size: 36px;
	font-family: "Comic Sans MS", cursive;
}

.ys1 {
	color: #003366;
}

.ys2 {
	color: #000000;
	font-weight: bold;
}

.ys3 {
	font-size: 24px;
	font-family: "Comic Sans MS", cursive;
}

.ys4 {
	font-size: 24px;
}
</style>
<%
	String school = request.getParameter("school");
	String college = request.getParameter("college");
	String class_ = request.getParameter("class_");
	String number = request.getParameter("number");
	request.setAttribute("school", school);
	request.setAttribute("college", college);
	request.setAttribute("class_", class_);
	request.setAttribute("number", number);
	Admin admin=(Admin)session.getAttribute("admin");
	request.setAttribute("admin",admin);
%>
<body>
	<form action="/CollegeGrocery/correctInfo" method="post">
		<table width="1310" height="590" border="0" align="center">
			<tr>
				<td height="64" class="ys1">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; JYU<span class="ys2">校园小商城
				</span>
				</td>
			</tr>
			<tr valign="top">
				<td height="520"><p>
						<img src="image/分割线.jpg" width="1310" height="2" />
					</p>
					<table width="1310" border="0">
						<tr>
							<td height="50" align="center" valign="middle" class="ys1"><table
									width="1310" border="0">
									<tr>
										<td height="50" align="center" valign="middle" class="ys1"><span
											class="ys2">用户信息</span></td>
									</tr>
								</table> <span class="ys2"></span></td>
						</tr>
					</table>
					<table width="1310" border="0" align="center">
						<tr>
							<td height="45" align="center"><span class="ys3">姓名 </span>
								<input name="adm.name" type="text" class="ys4" id="textfield"
								size="15" value="${request.admin.name }" /></td>
						</tr>
						<tr align="center" valign="middle">
							<td height="45" align="center"><span class="ys3">学号</span> <input
								name="stu.stuNum" type="text" class="ys4" id="textfield2"
								size="15" value="${request.number}" /></td>
						</tr>
						<tr>
							<td height="45" align="center" valign="middle"><span
								class="ys3">班级</span> <input name="stu.stuClass" type="text"
								class="ys4" id="textfield3" size="15" value="${request.class_}" />
							</td>
						</tr>
						<tr>
							<td height="45" align="center" valign="middle"><span
								class="ys3">学院 </span> <input name="stu.college" type="text"
								class="ys4" id="textfield4" size="15" value="${request.college}" /></td>
						</tr>
						<tr>
							<td height="45" align="center" valign="middle"><span
								class="ys3">学校 </span> <input name="stu.school" type="text"
								class="ys4" id="textfield4" size="15" value="${request.school}" />
							</td>
						</tr>
						<tr align="center" valign="middle">
							<td height="45"><span class="ys3">电话</span> <input
								name="adm.phone" type="text" class="ys4" id="textfield6"
								size="15" value="${request.admin.phone}" /></td>
						</tr>
						<tr align="center" valign="middle">
							<td height="45"><span class="ys3">邮箱 </span> <input
								name="adm.email" type="text" class="ys4" id="textfield5"
								size="15" value="${request.admin.email }" /></td>
						</tr>
					</table>
					<table width="1310" height="49" border="0" align="center">
						<tr>
							<td align="center"><input name="button" type="submit"
								class="ys4" id="button" value="保存" /></td>
						</tr>
					</table>
					<p>&nbsp;</p></td>
			</tr>
		</table>
	</form>
</body>
</html>