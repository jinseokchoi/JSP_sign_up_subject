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

   Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String sql=null;
    String id = manager.LoginID();
  try {
       conn = ConnUtil.getConnection();

      String sql_s = "SELECT * FROM course,teaches where course.course_id = teaches.course_id and teaches.professor_id ='"+LoginID+"'";
   
     //String sql = "SELECT * FROM course,teaches where course.course_id = teaches.course_id Order, teaches.professor_id = "+id+" By course.course_id ASC";
      ps = conn.prepareStatement(sql_s);
      rs = ps.executeQuery();
 %>
<head>
<title>���񰳼�</title>
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

</script>
   
 <h1 align="center">
			���� ����
			<hr>
		</h1>
   
<form method="post" action="menu1_inputPro.jsp" name="userinput" onSubmit="return checkIt()">
<table align="center" width="600" border="1" cellspacing="0" cellpadding="3">


<tr>
<td width="200" height="40"> ���� ID</td>
<td width="400">
<input type="text" name="course_id" size="10" maxlength="9">
<input type="button" name=menu1_confirm.jsp value="����Ȯ��" OnClick="openConfirmid(this.form)">
</td>
</tr>
<tr>
<tr>
			<td colspan="2" height="40" align="center">
			<input type="submit"name="confirm" value="�� ��"> 
			<input type="reset"name="reset" value="�ٽ��Է�"> 
			<input type="button" value="�������" onclick="javascript:window.location='main.html'"></td>
</tr>
</table>
<table align="center" width="600" border="1" cellspacing="0" cellpadding="3">
<tr bgcolor="#DCDCDC">
<td align="center" height="40">����ID</td>
<td align="center" height="40">�����</td>
<td align="center" height="40">����</td>
<td align="center" height="40">����</td>
<td align="center" height="40">�⵵</td>
<td align="center" height="40">�б�</td>
<td align="center" height="40">���ǽ�</td>
<td align="center" height="40">�����ο�</td>
<td align="center" height="40">������</td>
</tr>

<%
    while(rs.next()) { //rs �� ���� ���̺� ��ü���� �ʵ尪�� �Ѱܺ� �� �ִ�.
%><tr>
<td align="center" height="40"><%=rs.getString(1)%></td>
<td align="center" height="40"><%=rs.getString(2)%></td>
<td align="center" height="40"><%=rs.getString(3)%></td>
<td align="center" height="40"><%if(rs.getString(4).equals("maj")){%>����<%}else{ %>����<%} %></td>
<td align="center" height="40"><%=rs.getString(5)%></td>
<td align="center" height="40"><%=rs.getString(6)%></td>
<td align="center" height="40"><%=rs.getString(7)%></td>
<td align="center" height="40"><%=rs.getString(8)%></td>
<td  align="center"><a href = "menu1_stulist.jsp?course_id=<%=rs.getString(1)%>"> ����</a> </td>
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
   