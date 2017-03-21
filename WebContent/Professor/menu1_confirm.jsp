<%@ page contentType="text/html;charset=euc-kr"%>
<%@ page import="DB.*"%>

<html>
<head>
<title>과목 확인</title>

<%
	request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="dao" class="DB.CourseDao" />

<%
	String course_id = request.getParameter("course_id");
	CourseDao manager = new CourseDao();

	int check = manager.confirmId(course_id);
	boolean teach = manager.checkCourseTeaches(course_id);
	CourseVo check2 = dao.confirmId2(course_id);
%>

<%
	if (check == 1) {
		if (teach == false) {
%><center>
	<table width="100%" border="0">
		<tr>
			<td align="center"><Font size="5"></Font>
			<br/><h2>과목정보</h2>
				<table border="1" width="80%">
					<tr>
						<td width="40%" align="center">과목ID</td>
						<td width="60%" align="center"><%=check2.getCourse_id()%></td>
					</tr>
					<tr>
						<td align="center">과목명</td>
						<td align="center"><%=check2.getTitle()%></td>
					</tr>
					<tr>
						<td align="center">학점</td>
						<td align="center"><%=check2.getCredits()%></td>
					</tr>
					<br />
				</table> <br />
			<br /> <input type="button" value="확인" onclick="setid()"></td>


		</tr>
	</table>
</center>
<%
	} else {
%>
<center>
	<br/><h2>과목정보</h2>
		과목 ID : <%=course_id%>
		<br/> 이미 강의하는 교수가 있습니다.
	<form name="checkForm" method="post" action="menu1_confirm.jsp">
		<table width="270" border="0" cellspacing="0" cellpadding="5">
			<tr>
				<td align="center">다시입력하세요.
					<p>
						<br /> <input type="text" size="10" maxlength="12"
							name="course_id"> <input type="submit" value="과목확인">
				</td>
			</tr>
		</table>
	</form>
</center>
<%
	}

	} else {
%>
<center><br/><h2>과목정보</h2>
	<table width="270" border="0" cellspacing="0" cellpadding="5">
		<td height="39"><%=course_id%>은 존재하지 않는 과목입니다.</td>
	</table>
	<form name="checkForm" method="post" action="menu1_confirm.jsp">
		<table width="270" border="0" cellspacing="0" cellpadding="5">
			<tr>
				<td align="center">다시입력하세요.
					<p>
						<br /> <input type="text" size="10" maxlength="12"
							name="course_id"> <input type="submit" value="과목확인">
				</td>
			</tr>
		</table>
	</form>
</center>
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