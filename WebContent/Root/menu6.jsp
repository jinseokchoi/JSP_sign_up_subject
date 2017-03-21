<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import ="DB.*,java.sql.*,my.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>교수탈퇴</title>
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
     String sql = "SELECT * from professor";
      ps = conn.prepareStatement(sql);
      rs = ps.executeQuery();
 %>
 <body>
<form name="myform" action="menu6_deletePro.jsp" method="post">
		<h1 align="center">
			교수 정보 삭제
			<hr>
		</h1>
		<table align="center" width="60%" border="1" cellspacing="0">
			<tr>
				<td align="center" height="40" colspan="7">교수 ID : <input
					type="text" name="professor_id" size="10" maxlength="9"> <input
					type=submit value="정보삭제" onclick="button_event()">
				</td>

				
<tr>
<td align="center" height="40">교수 ID</td>
<td align="center" height="40">이름</td>
<td align="center" height="40">주소</td>
<td align="center" height="40">전화번호</td>
<td align="center" height="40">전공</td>
</tr>
<%
    while(rs.next()) { //rs 를 통해 테이블 객체들의 필드값을 넘겨볼 수 있다.
%><tr>
<td align="center" height="40"><%=rs.getString(1)%></td>
<td align="center" height="40"><%=rs.getString(2)%></td>
<td align="center" height="40"><%=rs.getString(3)%></td>
<td align="center" height="40"><%=rs.getString(4)%></td>
<td align="center" height="40"><%=rs.getString(5)%></td>
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