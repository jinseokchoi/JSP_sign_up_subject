<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DB.CourseDao"%>

<%
	String Course_id = request.getParameter("Course_id");

	CourseDao manager = CourseDao.getInstance();
	int check = manager.CouCheck(Course_id);

	if (check == 1) {
		manager.deleteCou(Course_id);
		session.invalidate();
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>과목 삭제</title>
</head>
<body>
	<script>
		alert("과목정보가 삭제되었습니다!");
		location.href = "menu4.jsp";
	</script>
	</div>
</body>
</html>
<%
	} else {
%>
<script>
	alert("일치하는 ID가 없습니다.");
	history.go(-1);
</script>
<%
	}
%>