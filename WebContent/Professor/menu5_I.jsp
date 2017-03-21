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
	<h2 align="center">회원정보 수정</h2>
	<hr>
	<form action="menu5_updateOKI.jsp" method="post">
		<table border="1" align="center" width="500" height="250" border="2">
			<tr>
				<td bgcolor="#DCDCDC" align="center">ID</td>
				<td><input type="text" readonly="readonly" name="professor_id"
					value="<%=voI.getprofessor_id()%>"></td>
			</tr>
			<tr>
				<td bgcolor="#DCDCDC" align="center">이름</td>
				<td><input type="text" readonly="readonly" name="professor_name"
					value="<%=voI.getprofessor_name()%>"></td>
			</tr>
			<tr>
				<td bgcolor="#DCDCDC" align="center">비밀번호</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td bgcolor="#DCDCDC" align="center">전화번호</td>
				<td><input type="text" name="professor_phone"
					value="<%=voI.getprofessor_phone()%>"></td>
			</tr>
			<tr>
				<td bgcolor="#DCDCDC" align="center">주소</td>
				<td><input type="text" name="professor_address"
					value="<%=voI.getprofessor_address()%>"></td>
			</tr>
			<tr>
				<td bgcolor="#DCDCDC" align="center">학과</td>
				<td><input type="text" name="professor_dept"
					value="<%=voI.getprofessor_dept()%>"></td>
			</tr>
				
			
		</table><center><br><input type=submit value="정보 수정"></center>
	</form>
</body>
</html>