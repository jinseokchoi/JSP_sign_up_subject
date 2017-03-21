<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="DB.professorDao"%>
<html>
<head><title>ID 중복확인</title>
   
<% request.setCharacterEncoding("euc-kr");%>
   
<%
String professor_id = request.getParameter("professor_id");
professorDao manager = new professorDao();
int check= manager.confirmId(professor_id);
 

if(check == 1) {
%>
<table width="270" border="0" cellspacing="0" cellpadding="5">
<td height="39" ><%=professor_id%>이미 사용중인 아이디입니다.</td>
</table>
<form name="checkForm" method="post" action="menu3_confirm.jsp">
<table width="270" border="0" cellspacing="0" cellpadding="5">
<tr>
<td align="center">
다른 아이디를 선택하세요.<p>
<input type="text" size="10" maxlength="12" name="professor_id">
<input type="submit" value="ID중복확인">
</td>
</tr>
</table>
</form>
<%
} else {
%>
<table width="270" border="0" cellspacing="0" cellpadding="5">
<tr>
<td align="center">
<p>입력하신 <%=professor_id%> 는 사용하실 수 있는 ID입니다. </p>
<input type="button" value="닫기" onclick="setid()">
</td>
</tr>
</table>
<%
}
%>
</body>
</html>
<script language="javascript">
<!--
function setid()
{
opener.document.userinput.professor_id.value="<%=professor_id%>";
self.close();
}
-->
</script>