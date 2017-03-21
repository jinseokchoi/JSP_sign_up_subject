<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="DB.*"%>
<%@ page import ="java.sql.Timestamp" %>
   
<% request.setCharacterEncoding("euc-kr");%>
   
<jsp:useBean id="vo" class="DB.CourseVo"/>
<jsp:setProperty name="vo" property="*" />
   
<% MemberDao manager =MemberDao.getInstance(); %>
<%
String course_id = request.getParameter("course_id");
int x=0;
String LoginID = manager.LoginID();
		CourseDao dao = CourseDao.getInstance();
		dao. selectprofessor(course_id,LoginID,x);
  
%>      
<script>
alert("개설완료!");
location.href="menu1.jsp";
</script>  