<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="DB.StudentDao"%>
<html>
<head><title>ID �ߺ�Ȯ��</title>
   
<% request.setCharacterEncoding("euc-kr");%>
   
<%
String student_id = request.getParameter("student_id");
StudentDao manager = new StudentDao();
int check= manager.confirmId(student_id);
 

if(check == 1) {
%>
<table width="270" border="0" cellspacing="0" cellpadding="5">
<td height="39" ><%=student_id%>�̹� ������� ���̵��Դϴ�.</td>
</table>
<form name="checkForm" method="post" action="menu2_confirm.jsp">
<table width="270" border="0" cellspacing="0" cellpadding="5">
<tr>
<td align="center">
�ٸ� ���̵� �����ϼ���.<p>
<input type="text" size="10" maxlength="12" name="student_id">
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
<p>�Է��Ͻ� <%=student_id%> �� ����Ͻ� �� �ִ� ID�Դϴ�. </p>
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
opener.document.userinput.student_id.value="<%=student_id%>";
self.close();
}
-->
</script>