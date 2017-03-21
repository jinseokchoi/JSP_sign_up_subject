<%@ page  contentType="text/html;charset=euc-kr" 
        import="java.sql.DriverManager,
                   java.sql.*,my.util.*,DB.*" %>
<%@ page import ="DB.*" %>
<% MemberDao manager =MemberDao.getInstance(); %>
<%
  response.setContentType("text/html;charset=euc-kr;");
  request.setCharacterEncoding("euc-kr");     //charset, Encoding 설정

%>
<script> 
function choice(o) { 
   var v = o.value; 
   document.frm.type.value = v; 
   document.frm.submit(); 
} 
</script> 

<h1 align="center">
   전체 과목
</h1><hr>
<center>
구분 : <select id="type" onchange="choice(this);"> 
<option >선택</option> 
<option value="maj">전공</option> 
<option value="lib">교양</option> 
</select> 
</center>
<form name="frm" action="menu3.jsp" method="get"> 
<input type="hidden" name="type"/> 
</form> 
<%
String type = request.getParameter("type");

   Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String sql=null;
    String id = manager.LoginID();
  try {
       conn = ConnUtil.getConnection();
       sql =  "SELECT * FROM course,teaches,professor where teaches.professor_id=professor.professor_id and course.type='"+type+"' and course.course_id = teaches.course_id Order By course.course_id ASC";
      
   
     //String sql = "SELECT * FROM course,teaches where course.course_id = teaches.course_id Order, teaches.professor_id = "+id+" By course.course_id ASC";
      ps = conn.prepareStatement(sql);
      rs = ps.executeQuery();
 %>


<br>
<table align="center" width="60%" border="1" cellspacing="0">
<tr bgcolor="#DCDCDC">
<td align="center" height="40">과목ID</td>
<td align="center" height="40">과목명</td>
<td align="center" height="40">학점</td>
<td align="center" height="40">교수</td>
<td align="center" height="40">구분</td>
<td align="center" height="40">수강인원</td>
</tr>
<%
    while(rs.next()) { //rs 를 통해 테이블 객체들의 필드값을 넘겨볼 수 있다.
%><tr>
<td align="center" height="40"><%=rs.getString(1)%></td>
<td align="center" height="40"><%=rs.getString(2)%></td>
<td align="center" height="40"><%=rs.getString(3)%></td>
<td align="center" height="40"><%=rs.getString(13)%></td>
<td align="center" height="40"><%if(rs.getString(4).equals("maj")){%>전공<%}else{ %>교양<%} %></td>
<td align="center" height="40"><%=rs.getString(11)%>  /  <%=rs.getString(8)%></td>
</tr>
<%
    } // end while
%></table>
<%

ConnUtil.close(rs, ps, conn);
}
catch (SQLException e) {
      out.println("err:"+e.toString());
} 
%>