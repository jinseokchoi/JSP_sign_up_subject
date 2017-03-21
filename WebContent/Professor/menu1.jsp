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
<title>과목개설</title>
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

</script>
   
 <h1 align="center">
			과목 개설
			<hr>
		</h1>
   
<form method="post" action="menu1_inputPro.jsp" name="userinput" onSubmit="return checkIt()">
<table align="center" width="600" border="1" cellspacing="0" cellpadding="3">


<tr>
<td width="200" height="40"> 과목 ID</td>
<td width="400">
<input type="text" name="course_id" size="10" maxlength="9">
<input type="button" name=menu1_confirm.jsp value="과목확인" OnClick="openConfirmid(this.form)">
</td>
</tr>
<tr>
<tr>
			<td colspan="2" height="40" align="center">
			<input type="submit"name="confirm" value="개 설"> 
			<input type="reset"name="reset" value="다시입력"> 
			<input type="button" value="개설취소" onclick="javascript:window.location='main.html'"></td>
</tr>
</table>
<table align="center" width="600" border="1" cellspacing="0" cellpadding="3">
<tr bgcolor="#DCDCDC">
<td align="center" height="40">과목ID</td>
<td align="center" height="40">과목명</td>
<td align="center" height="40">학점</td>
<td align="center" height="40">구분</td>
<td align="center" height="40">년도</td>
<td align="center" height="40">학기</td>
<td align="center" height="40">강의실</td>
<td align="center" height="40">수강인원</td>
<td align="center" height="40">수강생</td>
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
<td align="center" height="40"><%=rs.getString(8)%></td>
<td  align="center"><a href = "menu1_stulist.jsp?course_id=<%=rs.getString(1)%>"> 보기</a> </td>
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
   