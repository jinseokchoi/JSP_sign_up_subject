<%@ page  contentType="text/html;charset=euc-kr" 
        import="java.sql.DriverManager,
                   java.sql.*,my.util.*,DB.*" %>
<%@ page import ="DB.*" %>
<% MemberDao manager =MemberDao.getInstance(); %>
<%
  response.setContentType("text/html;charset=euc-kr;");
  request.setCharacterEncoding("euc-kr");
  //charset, Encoding 설정
  
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
  수강 신청
<hr>
</h1>
<table align="center" width="60%" border="1" cellspacing="0">
<tr>
<td align="center" height="40" colspan="10">과목ID : 
<input type="text" name="course_id" size="10" maxlength="9">
<input type="submit" name=menu1_insert.jsp value="신청" ><p style="text-align:right">신청학점 : 
<input type="text" size="3" readonly="readonly" name="student_name"
					value="<%=vo.getTot_cred()%>"></p>
</td>

</tr>
<tr bgcolor="#DCDCDC">
<td align="center" height="40">과목ID</td>
<td align="center" height="40">과목명</td>
<td align="center" height="40">학점</td>
<td align="center" height="40">교수</td>
<td align="center" height="40">구분</td>
<td align="center" height="40">년도</td>
<td align="center" height="40">학기</td>
<td align="center" height="40">강의실</td>
<td align="center" height="40">수강인원</td>
<td align="center" height="40">비고</td>
</tr>
<%
	while (rs.next()) { //rs 를 통해 테이블 객체들의 필드값을 넘겨볼 수 있다.
%><tr>
<td align="center" height="40"><%=rs.getString(1)%></td>
<td align="center" height="40"><%=rs.getString(2)%></td>
<td align="center" height="40"><%=rs.getString(3)%></td>
<td align="center" height="40"><%=rs.getString(15)%></td>
<td align="center" height="40"><%if(rs.getString(4).equals("maj")){%>전공<%}else{ %>교양<%} %></td>
<td align="center" height="40"><%=rs.getString(5)%></td>
<td align="center" height="40"><%=rs.getString(6)%></td>
<td align="center" height="40"><%=rs.getString(7)%></td>
<td align="center" height="40"><%=rs.getString(13)%>  /  <%=rs.getString(8)%></td>
<td  align="center"><A href = "menu1_delete.jsp?id=<%=rs.getString(1)%>">취소</A> </td>
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