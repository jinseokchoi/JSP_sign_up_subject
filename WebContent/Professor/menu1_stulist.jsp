<%@ page  contentType="text/html;charset=euc-kr" 
        import="java.sql.DriverManager,
                   java.sql.*,my.util.*,DB.*" %>
<%@ page import ="DB.*" %>
<% MemberDao manager =MemberDao.getInstance(); %>
<%
  response.setContentType("text/html;charset=euc-kr;");
  request.setCharacterEncoding("euc-kr");     //charset, Encoding ����

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
<title>����������</title>
<script language="JavaScript">
 
function checkIt() {
var userinput = eval("document.userinput");
if(!userinput.course_id.value) {
alert("�м��ڵ带 �Է��ϼ���");
return false;
}
}
   
//�м��ڵ��ߺ� ���θ� �Ǵ�
function openConfirmid(userinput) {
//�м��ڵ带 �Է��ߴ��� �˻�
if (userinput.course_id.value == "") {
alert("�м��ڵ带 �Է��ϼ���");
return;
}
// url�� ����� �Է� id�� �����մϴ�.
url = "menu1_confirm.jsp?course_id=" + userinput.course_id.value ;
 
// ���ο� �����츦 ���ϴ�.
open(url, "confirm",
"toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
}
function openStu(userinput) {
	//�м��ڵ带 �Է��ߴ��� �˻�
	
	// url�� ����� �Է� id�� �����մϴ�.
	url = "menu1_confirm.jsp" ;
	 
	// ���ο� �����츦 ���ϴ�.
	open(url, "stu",
	"toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
	}
</script>
   
<center>
<h1 align="center">
	������ ����
<hr>
</h1>   
<form method="post" action="menu1.jsp" name="userinput">

<table width="600" border="1" cellspacing="0" cellpadding="3">
<tr bgcolor="silver">
<td align="center" height="40">�й�</td>
<td align="center" height="40">�̸�</td>
<td align="center" height="40">�ּ�</td>
<td align="center" height="40">��ȭ��ȣ</td>
</tr>
<%
    while(rs.next()) { //rs �� ���� ���̺� ��ü���� �ʵ尪�� �Ѱܺ� �� �ִ�.
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
			<input type="submit"name="confirm" value="�ݱ�"> </td>
<%

ConnUtil.close(rs, ps, conn);
}
catch (SQLException e) {
      out.println("err:"+e.toString());
} 
%></form>
</body>
</html>
   