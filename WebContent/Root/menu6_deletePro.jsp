<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DB.professorDao"%>

<%
	String professor_id = request.getParameter("professor_id");

	professorDao manager = professorDao.getInstance();
	int check = manager.proCheck(professor_id);

	if (check == 1) {
		manager.deletePro(professor_id);
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
		alert("교수정보가 삭제되었습니다!");
		location.href = "menu6.jsp";
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