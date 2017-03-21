<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ page import="DB.professorDao, DB.professorVo" %>
 <%@ page import ="DB.MemberDao" %>
 <% MemberDao manager =MemberDao.getInstance(); %>
  <%
   professorDao daoI = new professorDao();
   String id = manager.LoginID();
   professorVo voI = daoI.selectprofessor(id);
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
<table width="500" height="250" border="2" align="center">
	<tbody>
	<tr>
		<td width="90" height="30" bgcolor="#DCDCDC" align="center" font="12px" >ID</td>
		<td align="center"><%=voI.getprofessor_id() %></td>
	</tr>
	<tr>
		<td height="30" bgcolor="#DCDCDC" align="center">이름</td>
		<td align="center"><%=voI.getprofessor_name() %></td>
	</tr>
	<tr>
		<td height="30" bgcolor="#DCDCDC" align="center">전화번호</td>
		<td align="center"><%=voI.getprofessor_phone() %></td>
	</tr>
	<tr>
		<td height="30" bgcolor="#DCDCDC" align="center">주소</td>
		<td align="center"><%=voI.getprofessor_address() %></td>
	</tr>
	<tr>
		<td height="30" bgcolor="#DCDCDC" align="center">담당 학과</td>
		<td align="center"><%=voI.getprofessor_dept() %></td>
	</tr>
	
	</tbody>
</table>
</body>
</html>