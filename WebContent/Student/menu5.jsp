<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="DB.StudentDao, DB.StudentVo"%>
<%@ page import="DB.MemberDao"%>
<%
	MemberDao manager = MemberDao.getInstance();
%>
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
	<h2 align="center">회원정보 수정</h2>
	<hr>
	<form action="menu5_updateOK.jsp" method="post">
		<table border="1" align="center" width="500" height="250" >
			<tr>
				<td bgcolor="#DCDCDC" align="center">ID</td>
				<td><input type="text" readonly="readonly" name="student_id"
					value="<%=vo.getStudent_id()%>"></td>
			</tr>
			<tr>
				<td bgcolor="#DCDCDC" align="center">이름</td>
				<td><input type="text" readonly="readonly" name="student_name"
					value="<%=vo.getStudent_name()%>"></td>
			</tr>
			<tr>
				<td bgcolor="#DCDCDC" align="center">비밀번호</td>
				<td><input type="password" name="password"></td>
			</tr>
			
			<tr>
				<td bgcolor="#DCDCDC" align="center">전화번호</td>
				<td><input type="text"  name="student_phone"
					value="<%=vo.getStudent_phone()%>"></td>
			</tr>
			<tr>
				<td bgcolor="#DCDCDC" align="center">주소</td>
				<td><input type="text" name="student_address"
					value="<%=vo.getStudent_address()%>"></td>
			</tr>
			
				
			
		</table><center><br><input type=submit value="정보 수정"></center>
	</form>
</body>
</html>