<%@ page contentType="text/html;charset=euc-kr"%>
<%@ page import="DB.*"%>

<html>
<head>
<title>������ �α���</title>

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
			<h2>������ �α���</h2>
			ID <input type="text" name="id" /><br>
			<br> PW <input type="password" name="pw" /><br>
			<br> <input type="submit" value="�α���"> 
			<input type=button value=��� onclick="javascript:history.back()">

			
		</center>
	</FORM>
</body>
<%}else{%>
<script>
alert("�����ڰ� �ƴմϴ�.");
history.go(-1);
</script><%}%>