<%@ page  contentType="text/html;charset=euc-kr" 
        import="java.sql.DriverManager,
                   java.sql.*,my.util.*,DB.*" %>
<%@ page import ="DB.*" %>
<% MemberDao manager =MemberDao.getInstance(); %>
<%
  response.setContentType("text/html;charset=euc-kr;");
  request.setCharacterEncoding("euc-kr");
  //charset, Encoding ����
  
	StudentDao dao = new StudentDao();
  String LoginID = manager.LoginID();
	StudentVo vo = dao.selectStudent(LoginID);
   Connection conn = null;
   Connection conn2 = null;
    PreparedStatement ps = null;
    PreparedStatement ps2 = null;
    ResultSet rs = null;
    ResultSet rs2 = null;   
    
  try {
       conn = ConnUtil.getConnection();
       String sql = "SELECT * FROM course,takes,teaches,professor where teaches.professor_id = professor.professor_id and course.course_id = takes.course_id and course.course_id = teaches.course_id and takes.student_id='"+LoginID+"'Order By course.course_id ASC";
       ps = conn.prepareStatement(sql);
      rs = ps.executeQuery();
 %>
<form method="post" action="menu1_insert.jsp" name="takesinsert" >
<h1 align="center">
  ���� ��û
<hr>
</h1>
<table align="center" width="60%" border="1" cellspacing="0">
<tr>
<td align="center" height="40" colspan="10">����ID : 
<input type="text" name="course_id" size="10" maxlength="9">
<input type="submit" name=menu1_insert.jsp value="��û" ><p style="text-align:right">��û���� : 
<input type="text" size="3" readonly="readonly" name="student_name"
					value="<%=vo.getTot_cred()%>"></p>
</td>

</tr>
<tr bgcolor="#DCDCDC">
<td align="center" height="40">����ID</td>
<td align="center" height="40">�����</td>
<td align="center" height="40">����</td>
<td align="center" height="40">����</td>
<td align="center" height="40">����</td>
<td align="center" height="40">�⵵</td>
<td align="center" height="40">�б�</td>
<td align="center" height="40">���ǽ�</td>
<td align="center" height="40">�����ο�</td>
<td align="center" height="40">���</td>
</tr>
<%
	while (rs.next()) { //rs �� ���� ���̺� ��ü���� �ʵ尪�� �Ѱܺ� �� �ִ�.
%><tr>
<td align="center" height="40"><%=rs.getString(1)%></td>
<td align="center" height="40"><%=rs.getString(2)%></td>
<td align="center" height="40"><%=rs.getString(3)%></td>
<td align="center" height="40"><%=rs.getString(15)%></td>
<td align="center" height="40"><%if(rs.getString(4).equals("maj")){%>����<%}else{ %>����<%} %></td>
<td align="center" height="40"><%=rs.getString(5)%></td>
<td align="center" height="40"><%=rs.getString(6)%></td>
<td align="center" height="40"><%=rs.getString(7)%></td>
<td align="center" height="40"><%=rs.getString(13)%>  /  <%=rs.getString(8)%></td>
<td  align="center"><A href = "menu1_delete.jsp?id=<%=rs.getString(1)%>">���</A> </td>
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