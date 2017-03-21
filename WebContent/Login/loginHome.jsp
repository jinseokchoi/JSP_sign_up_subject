<%@ page contentType="text/html;charset=euc-kr" import="java.sql.*"%>

<HTML>
<HEAD>
<TITLE>MySQL+JSP Test</TITLE>
</HEAD>

<%
	if (session.getAttribute("sessionID") == null)
%>
<script language="javascript">
	function focusIt() {
		document.inform.id.focus();
	}
</script>
<BODY>
	<center>
		<br><br><br><br><br>
			<FORM ACTION=loginPro.jsp METHOD=POST>
				<input type="image"	src="http://localhost:8080/JSP_Signup/image/login.jpg" /><br><br><br>
			 ID <input type="text" name="id" /><br><br> 
			 PW <input type="password" name="pw" /><br><br> 
			 <select name="type" >
					<option value= "stu">학생</option>
					<option value= "pro">교수</option>
			</select>
			 <input type="submit" value="Login" /><br>
		<br>
		</form>
	</center>


	</center>


</BODY>
</HTML>