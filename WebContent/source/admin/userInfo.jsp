<%@ page language="java" contentType="text/html; charset=UTf-8"
    pageEncoding="UTF-8" import="com.lyq.bean.Student" import="com.lyq.manager.StudentManager" import="com.lyq.bean.Admin"%>
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
.ys5 {
	font-size: 18px;
}
.ys5 {
	font-size: 18px;
}
</style>
<body>
<%
	StudentManager sManager=new StudentManager();
	Student student=sManager.getStudentByUserId(((Admin)session.getAttribute("admin")).getId());
	request.setAttribute("student", student);
%>
<table width="1310" height="590" border="0" align="center">
  <tr>
    <td height="64" class="ys1"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; JYU<span class="ys2">校园小商城                 </span></td>
  </tr>
  <tr valign="top">
    <td height="520"><p><img src="image/分割线.jpg" width="1310" height="2" /></p>
      <table width="1310" border="0">
      <tr>
        <td height="50" align="center" valign="middle" class="ys1"><table width="1310" border="0">
          <tr>
            <td height="50" align="center" valign="middle" class="ys1"><span class="ys2">用户信息</span></td>
          </tr>
        </table>          <span class="ys2"></span></td>
      </tr>
      </table>
      <table width="1310" border="0" align="center">
        <tr>
        <td width="608" height="45" align="right" class="ys3">姓名&nbsp;&nbsp; </td>
        <td width="692" align="left" class="ys3">&nbsp;&nbsp; <span class="ys5">${session.admin.name }</span></td>
        </tr>
      <tr align="center" valign="middle">
        <td height="45" align="right" class="ys3">学号&nbsp;&nbsp;</td>
        <td align="left"><span class="ys5"><span class="ys3"><span class="ys5">&nbsp;&nbsp; </span></span>${requestScope.student.stuNum}</span></td>
      </tr>
      <tr>
        <td height="45" align="right" valign="middle" class="ys3">班级&nbsp;&nbsp;</td>
        <td align="left" valign="middle">&nbsp;&nbsp; <span class="ys5">${requestScope.student.stuClass}</span></td>
      </tr>
      <tr>
        <td height="45" align="right" valign="middle" class="ys3">学院&nbsp;&nbsp;</td>
        <td align="left" valign="middle">&nbsp;&nbsp; <span class="ys5">${requestScope.student.college}</span></td>
      </tr>
      <tr>
        <td height="45" align="right" valign="middle" class="ys3">学校&nbsp;&nbsp;</td>
        <td align="left" valign="middle">&nbsp;&nbsp; <span class="ys5">${requestScope.student.school}</span></td>
      </tr>
      <tr align="center" valign="middle">
        <td height="45" align="right" class="ys3">电话&nbsp;&nbsp;</td>
        <td align="left">&nbsp;&nbsp; <span class="ys5">${session.admin.phone}</span></td>
      </tr>
      <tr align="center" valign="middle">
        <td height="45" align="right" class="ys3">邮箱&nbsp;&nbsp;</td>
        <td align="left">&nbsp;&nbsp; <span class="ys5">${session.admin.email}</span></td>
      </tr>
</table>
      <table width="1310" height="49" border="0" align="center">
        <tr>
          <td align="center">
          <form id="form7" name="form7" method="post" action="/CollegeGrocery/source/admin/correctInfo.jsp">
            <input type="hidden" value="${requestScope.student.school}" name="school"/>
            <input type="hidden" value="${requestScope.student.college}" name="college"/>
            <input type="hidden" value="${requestScope.student.stuClass}" name="class_"/>
            <input type="hidden" value="${requestScope.student.stuNum}" name="number"/>
            <input name="button" type="submit" class="ys4" id="button" value="修改" />
          </form></td>
        </tr>
      </table>
    <p>&nbsp;</p></td>
  </tr>
</table>
</body>
</html>