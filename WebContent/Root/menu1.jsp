<%@ page contentType="text/html; charset=euc-kr"%>
<html>
<head>
<title>회원가입</title>
<script language="JavaScript">
 
function checkIt() {
var userinput = eval("document.userinput");
if(!userinput.course_id.value) {
alert("ID를 입력하세요");
return false;
}
  
if(!userinput.title.value) {
alert("과목명을 입력하세요");
return false;
}
if(!userinput.credits.value) {
	alert("학점를 입력하세요");
	return false;
}
if(!userinput.classroom.value) {
	alert("강의실를 입력하세요");
	return false;
}
}
   
// 아이디 중복 여부를 판단
function openConfirmid(userinput) {
// 아이디를 입력했는지 검사
if (userinput.id.value == "") {
alert("아이디를 입력하세요");
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
			과목 등록
			<hr>
		</h1>
<form method="post" action="menu1_inputPro.jsp" name="userinput" onSubmit="return checkIt()">
<table align="center" width="600" border="1" cellspacing="0" cellpadding="3">


<tr>
<td width="200" height="40"> 학기</td>
<td width="400">
<input type="text" name="year" value="2015" size="5" maxlength="10">년도   
<select name="term">
<option value="1">1</option>
<option value="2">2</option>
</select>학기
</td>
</tr>
<tr>
<td width="200" height="40"> 과목 ID</td>
<td width="400">
<input type="text" name="course_id" size="10" maxlength="9">
<input type="button" name=menu1_confirm.jsp value="ID중복확인" OnClick="openConfirmid(this.form)">
</td>
</tr>
<tr>
<td width="200" height="40"> 과목명</td>
<td width="400" >
<input type="text" name="title" size="15" maxlength="12">
</td>

 

<tr>
<td width="200" height="40"> 학점</td>
<td width="400">
<input type="text" name="credits" size="5" maxlength="10">점
</td>
</tr>
<tr>
<tr>
<td width="200" height="40"> 강의실</td>
<td width="400">
<input type="text" name="classroom" size="15" maxlength="10">
</td>
</tr>
<tr>
<td width="200" height="40"> 수강인원</td>
<td width="400">
<input type="text" name="nop" size="5" maxlength="10">명
</td>
</tr>
<tr>
<td width="200" height="40"> 구분</td>
<td width="400">
전공<input type="radio" name="type" value="maj" size="15" maxlength="10">
교양<input type="radio" name="type" value="lib" size="15" maxlength="10">
</td>
</tr>

<tr>
			<td colspan="2" height="40" align="center""><input type="submit"
				name="confirm" value="등 록"> <input type="reset"
				name="reset" value="다시입력"> <input type="button" value="등록취소"
				onclick="javascript:window.location='main.html'"></td>
		</tr>
</table>
</form>
</body>
</html>
   