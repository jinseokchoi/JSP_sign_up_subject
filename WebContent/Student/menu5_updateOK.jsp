<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="DB.StudentDao"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="vo" class="DB.StudentVo" />
<jsp:setProperty property="*" name="vo" />
<%
	int rst = 0;
	StudentDao dao = new StudentDao();
	rst = dao.updateStudent(vo);
%>
<%
	if (rst > 0) {
%>
<script type="text/javascript">
	alert("정보 수정 완료");
	location.href = "menu4.jsp";
</script>
<%
	} else {
%>
<script type="text/javascript">
	alert("정보 수정 완료");
	history.go(-1);
</script>
<%
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
</body>
</html>