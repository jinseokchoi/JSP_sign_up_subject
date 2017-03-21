
<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="DB.professorDao"%>
<%@ page import ="java.sql.Timestamp" %>
   
<% request.setCharacterEncoding("euc-kr");%>
   
<jsp:useBean id="vo" class="DB.professorVo"/>
<jsp:setProperty name="vo" property="*" />
   
<%
		professorDao dao = professorDao.getInstance();
		dao.insertprofessor(vo);
  
%>      
<script>
alert("등록완료!");
location.href="main.html";
</script>  