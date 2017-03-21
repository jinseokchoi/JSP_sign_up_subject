<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="DB.CourseDao"%>
<html>
<head><title>ID 중복확인</title>
   
<% request.setCharacterEncoding("euc-kr");%>
   
<%
String course_id = request.getParameter("course_id");
CourseDao manager = new CourseDao();
int check= manager.confirmId(course_id);
 

if(check == 1) {
%>
<table width="270" border="0" cellspacing="0" cellpadding="5">
<td height="39" ><%=course_id%>이미 사용중인 아이디입니다.</td>
</table>
<form name="checkForm" method="post" action="menu1_confirm.jsp">
<table width="270" border="0" cellspacing="0" cellpadding="5">
<tr>
<td align="center">
다른 아이디를 선택하세요.<p>
<input type="text" size="10" maxlength="12" name="course_id">
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
<p>입력하신 <%=course_id%> 는 사용하실 수 있는 ID입니다. </p>
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
opener.document.userinput.course_id.value="<%=course_id%>";
self.close();
}
-->
</script>