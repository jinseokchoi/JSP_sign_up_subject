<%@ page  contentType="text/html;charset=euc-kr" 
        import="java.sql.DriverManager,
                   java.sql.*,my.util.*,DB.*" %>
<%@ page import ="DB.*" %>
<% MemberDao manager =MemberDao.getInstance(); %>
<%
  response.setContentType("text/html;charset=euc-kr;");
  request.setCharacterEncoding("euc-kr");     //charset, Encoding 설정

%>
<%
String LoginID = manager.LoginID();
String course_id = request.getParameter("course_id");
   Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String sql=null;
    String id = manager.LoginID();
  try {
       conn = ConnUtil.getConnection();

      String sql_s = "SELECT student.student_id, student.student_name, student.student_address,student.student_phone FROM student, takes, course WHERE takes.student_id = student.student_id and" +
  			" course.course_id = takes.course_id and course.course_id = '" + course_id +"';";
   
     //String sql = "SELECT * FROM course,teaches where course.course_id = teaches.course_id Order, teaches.professor_id = "+id+" By course.course_id ASC";
      ps = conn.prepareStatement(sql_s);
      rs = ps.executeQuery();
 %>
<head>
<title>수강생정보</title>
<script language="JavaScript">
 
function checkIt() {
var userinput = eval("document.userinput");
if(!userinput.course_id.value) {
alert("학수코드를 입력하세요");
return false;
}
}
   
//학수코드중복 여부를 판단
function openConfirmid(userinput) {
//학수코드를 입력했는지 검사
if (userinput.course_id.value == "") {
alert("학수코드를 입력하세요");
return;
}
// url과 사용자 입력 id를 조합합니다.
url = "menu1_confirm.jsp?course_id=" + userinput.course_id.value ;
 
// 새로운 윈도우를 엽니다.
open(url, "confirm",
"toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
}
function openStu(userinput) {
	//학수코드를 입력했는지 검사
	
	// url과 사용자 입력 id를 조합합니다.
	url = "menu1_confirm.jsp" ;
	 
	// 새로운 윈도우를 엽니다.
	open(url, "stu",
	"toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
	}
</script>
   
<center>
<h1 align="center">
	수강생 정보
<hr>
</h1>   
<form method="post" action="menu1.jsp" name="userinput">

<table width="600" border="1" cellspacing="0" cellpadding="3">
<tr bgcolor="silver">
<td align="center" height="40">학번</td>
<td align="center" height="40">이름</td>
<td align="center" height="40">주소</td>
<td align="center" height="40">전화번호</td>
</tr>
<%
    while(rs.next()) { //rs 를 통해 테이블 객체들의 필드값을 넘겨볼 수 있다.
%><tr>
<td align="center" height="40"><%=rs.getString(1)%></td>
<td align="center" height="40"><%=rs.getString(2)%></td>
<td align="center" height="40"><%=rs.getString(3)%></td>
<td align="center" height="40"><%=rs.getString(4)%></td>
</tr>
<%
    } // end while
%></table>
<br>
			<td colspan="2" height="40" align="center"">
			<input type="submit"name="confirm" value="닫기"> </td>
<%

ConnUtil.close(rs, ps, conn);
}
catch (SQLException e) {
      out.println("err:"+e.toString());
} 
%></form>
</body>
</html>
   