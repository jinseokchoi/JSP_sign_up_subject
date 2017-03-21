<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="DB.CourseDao"%>
<%@ page import ="java.sql.Timestamp" %>
   
<% request.setCharacterEncoding("euc-kr");%>
   
<jsp:useBean id="vo" class="DB.CourseVo"/>
<jsp:setProperty name="vo" property="*" />
   
<%
String course_id = request.getParameter("course_id");
		CourseDao dao = CourseDao.getInstance();
		dao.deleteCoursePro(course_id);
  
%>      
<script>
alert("취소완료!");
location.href="menu2.jsp";
</script>  