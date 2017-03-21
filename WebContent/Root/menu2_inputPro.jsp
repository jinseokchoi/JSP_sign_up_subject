
<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="DB.StudentDao"%>
<%@ page import ="java.sql.Timestamp" %>
   
<% request.setCharacterEncoding("euc-kr");%>
   
<jsp:useBean id="vo" class="DB.StudentVo"/>
<jsp:setProperty name="vo" property="*" />
   
<%
		StudentDao dao = StudentDao.getInstance();
		dao.insertStudent(vo);
  
%>      
<script>
alert("등록완료!");
location.href="main.html";
</script>  