<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ page import="DB.StudentDao, DB.StudentVo" %>
 <%@ page import ="DB.MemberDao" %>
 <% MemberDao manager =MemberDao.getInstance(); %>
  <%
   StudentDao dao = new StudentDao();
   String id = manager.LoginID();
   StudentVo vo = dao.selectStudent(id);
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1 align="center">
	개인 정보 확인
<hr>
</h1>
<table width="500" height="250" border="1" align="center">
	<tbody>
	<tr>
		<td width="90" height="30" bgcolor="#DCDCDC" align="center" font="12px" >ID</td>
		<td align="center"><%=vo.getStudent_id() %></td>
	</tr>
	<tr>
		<td height="30" bgcolor="#DCDCDC" align="center">이름</td>
		<td align="center"><%=vo.getStudent_name() %></td>
	</tr>
	<tr>
		<td height="30" bgcolor="#DCDCDC" align="center">전화번호</td>
		<td align="center"><%=vo.getStudent_phone() %></td>
	</tr>
	<tr>
		<td height="30" bgcolor="#DCDCDC" align="center">주소</td>
		<td align="center"><%=vo.getStudent_address() %></td>
	</tr>
	<tr>
		<td height="30" bgcolor="#DCDCDC" align="center">신청학점</td>
		<td align="center"><%=vo.getTot_cred() %></td>
	</tr>
	
	</tbody>
</table>
</body>
</html>