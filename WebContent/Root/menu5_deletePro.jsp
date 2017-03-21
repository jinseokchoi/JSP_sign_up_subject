<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DB.StudentDao"%>

<%
	String student_id = request.getParameter("student_id");

	StudentDao manager = StudentDao.getInstance();
	int check = manager.stuCheck(student_id);

	if (check == 1) {
		manager.deleteStu(student_id);
		session.invalidate();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 탈퇴</title>
</head>
<body>
	<script>
		alert("학생정보가 삭제되었습니다!");
		location.href = "menu5.jsp";
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