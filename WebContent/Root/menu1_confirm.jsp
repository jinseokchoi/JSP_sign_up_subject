<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="DB.CourseDao"%>
<html>
<head><title>ID �ߺ�Ȯ��</title>
   
<% request.setCharacterEncoding("euc-kr");%>
   
<%
String course_id = request.getParameter("course_id");
CourseDao manager = new CourseDao();
int check= manager.confirmId(course_id);
 

if(check == 1) {
%>
<table width="270" border="0" cellspacing="0" cellpadding="5">
<td height="39" ><%=course_id%>�̹� ������� ���̵��Դϴ�.</td>
</table>
<form name="checkForm" method="post" action="menu1_confirm.jsp">
<table width="270" border="0" cellspacing="0" cellpadding="5">
<tr>
<td align="center">
�ٸ� ���̵� �����ϼ���.<p>
<input type="text" size="10" maxlength="12" name="course_id">
<input type="submit" value="ID�ߺ�Ȯ��">
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
<p>�Է��Ͻ� <%=course_id%> �� ����Ͻ� �� �ִ� ID�Դϴ�. </p>
<input type="button" value="�ݱ�" onclick="setid()">
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