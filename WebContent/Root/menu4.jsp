<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import ="DB.*,java.sql.*,my.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>과목삭제</title>
</head>
<script type="text/javascript">
	function button_event() {
		if (confirm("정말 삭제하시겠습니까?") == true) { //확인
			document.form.submit();
		} else { //취소
			return;
		}
	}
</script>
<% MemberDao manager =MemberDao.getInstance(); %>
<%
  response.setContentType("text/html;charset=euc-kr;");
  request.setCharacterEncoding("euc-kr");     //charset, Encoding 설정
   String LoginID = manager.LoginID();

   Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
  try {
       conn = ConnUtil.getConnection();
     String sql = "SELECT * from course";
      ps = conn.prepareStatement(sql);
      rs = ps.executeQuery();
 %>
<body>


	<form name="myform" action="menu4_deletePro.jsp" method="post">
		<h1 align="center">
			과목삭제
			<hr>
		</h1>
		<table align="center" width="60%" border="1" cellspacing="0">
			<tr>
				<td align="center" height="40" colspan="7">과목 ID : <input
					type="text" name="Course_id" size="10" maxlength="9"> <input
					type=submit value="정보삭제" onclick="button_event()">
				</td>

			</tr>

<tr>
<td align="center" height="40">과목ID</td>
<td align="center" height="40">과목명</td>
<td align="center" height="40">학점</td>
<td align="center" height="40">구분</td>
<td align="center" height="40">년도</td>
<td align="center" height="40">학기</td>
<td align="center" height="40">강의실</td>
</tr>
<%
    while(rs.next()) { //rs 를 통해 테이블 객체들의 필드값을 넘겨볼 수 있다.
%><tr>
<td align="center" height="40"><%=rs.getString(1)%></td>
<td align="center" height="40"><%=rs.getString(2)%></td>
<td align="center" height="40"><%=rs.getString(3)%></td>
<td align="center" height="40"><%if(rs.getString(4).equals("maj")){%>전공<%}else{ %>교양<%} %></td>
<td align="center" height="40"><%=rs.getString(5)%></td>
<td align="center" height="40"><%=rs.getString(6)%></td>
<td align="center" height="40"><%=rs.getString(7)%></td>
</tr>
<%
    } // end while
%></table>
</form>
<%

ConnUtil.close(rs, ps, conn);
}
catch (SQLException e) {
      out.println("err:"+e.toString());
} 
%>
</body>
</html>