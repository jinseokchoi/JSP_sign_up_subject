<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="DB.professorDao"%>
<html>
<head><title>ID �ߺ�Ȯ��</title>
   
<% request.setCharacterEncoding("euc-kr");%>
   
<%
String professor_id = request.getParameter("professor_id");
professorDao manager = new professorDao();
int check= manager.confirmId(professor_id);
 

if(check == 1) {
%>
<table width="270" border="0" cellspacing="0" cellpadding="5">
<td height="39" ><%=professor_id%>�̹� ������� ���̵��Դϴ�.</td>
</table>
<form name="checkForm" method="post" action="menu3_confirm.jsp">
<table width="270" border="0" cellspacing="0" cellpadding="5">
<tr>
<td align="center">
�ٸ� ���̵� �����ϼ���.<p>
<input type="text" size="10" maxlength="12" name="professor_id">
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
<p>�Է��Ͻ� <%=professor_id%> �� ����Ͻ� �� �ִ� ID�Դϴ�. </p>
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
opener.document.userinput.professor_id.value="<%=professor_id%>";
self.close();
}
-->
</script>