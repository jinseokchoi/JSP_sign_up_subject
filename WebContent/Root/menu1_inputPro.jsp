
<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="DB.CourseDao"%>
<%@ page import ="java.sql.Timestamp" %>
   
<% request.setCharacterEncoding("euc-kr");%>
   
<jsp:useBean id="vo" class="DB.CourseVo"/>
<jsp:setProperty name="vo" property="*" />
   
<%
		CourseDao dao = CourseDao.getInstance();
		dao.insertcourse(vo);
  
%>      
<script>
alert("��ϿϷ�!");
location.href="main.html";
</script>  