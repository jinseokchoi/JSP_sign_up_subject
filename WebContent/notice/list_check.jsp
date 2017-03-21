<%@ page contentType="text/html;charset=euc-kr"%>
<%@ page import="DB.*"%>

<html>
<head>
<title>관리자 로그인</title>

<%
	request.setCharacterEncoding("euc-kr");
%>

<% MemberDao manager =MemberDao.getInstance(); 
String id = manager.LoginID();
if(id.equals("root")){
%>
 <base target="detail">
 
<body>
	<FORM ACTION=list_ok.jsp METHOD=POST>
		<center>
			<h2>관리자 로그인</h2>
			ID <input type="text" name="id" /><br>
			<br> PW <input type="password" name="pw" /><br>
			<br> <input type="submit" value="로그인"> 
			<input type=button value=취소 onclick="javascript:history.back()">

			
		</center>
	</FORM>
</body>
<%}else{%>
<script>
alert("관리자가 아닙니다.");
history.go(-1);
</script><%}%>