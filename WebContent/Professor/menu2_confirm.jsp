<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="DB.*"%>

<html>
<head><title>과목 확인</title>
   
<% request.setCharacterEncoding("euc-kr");%>
   <jsp:useBean id="dao" class="DB.CourseDao"/>
<%
String course_id = request.getParameter("course_id");
MemberDao manager2 =MemberDao.getInstance();
CourseDao manager = new CourseDao();
String id = manager2.LoginID();
int check = manager.confirmTId(course_id);
boolean teach = manager.checkProfessorTeaches(id,course_id);
CourseVo check2= dao.confirmTId2(course_id);
%>
  
<%
if(teach == true) {
	%><center>
	<table width="100%" border="0" >
	<tr>
	<td align="center">
	<Font size="5"></Font><br/><h2>과목정보</h2>
	
	<table border="1" width="80%">
	<tr>
	<td align="center">교수</td><td align="center"><%=check2.getprofessor_id() %></td>
	</tr> 
	<tr>
	<td width="40%" align="center">과목ID</td><td width="60%" align="center"><%=check2.getCourse_id() %></td>
	</tr>
	
	

	</table>
	 <br/>개설하신 과목이 맞습니다<br/>
	<input type="button" value="확인" onclick="setid()">
	</center>
	<%

} else {%>
<center>	<br/><h2>과목정보</h2>
과목 ID : <%=course_id%></br>
개설하지 않는 과목입니다.

<form name="checkForm" method="post" action="menu2_confirm.jsp">
<table width="270" border="0" cellspacing="0" cellpadding="5">
<tr>
<td align="center">
<br/>다시입력하세요.<p><br/>
<input type="text" size="10" maxlength="12" name="course_id">
<input type="submit" value="과목확인">
</td>
</tr>
</table>
</form></center>
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