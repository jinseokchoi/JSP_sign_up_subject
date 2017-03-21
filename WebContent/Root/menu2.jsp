<%@ page contentType="text/html; charset=euc-kr"%>
<html>
<head>
<title>회원가입</title>
<script language="JavaScript">
 
function checkIt() {
var userinput = eval("document.userinput");
if(!userinput.student_id.value) {
alert("ID를 입력하세요");
return false;
}
 
if(!userinput.password.value ) {
alert("비밀번호를 입력하세요");
return false;
}
if(userinput.password.value != userinput.password2.value)
{
alert("비밀번호를 동일하게 입력하세요");
return false;
}
 
if(!userinput.student_name.value) {
alert("이름을 입력하세요");
return false;
}
if(!userinput.student_address.value) {
	alert("주소를 입력하세요");
	return false;
}
if(!userinput.student_phone.value) {
	alert("전화번호를 입력하세요");
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
url = "menu2_confirm.jsp?student_id=" + userinput.student_id.value ;
 
// 새로운 윈도우를 엽니다.
open(url, "confirm",
"toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
}
</script>
   
    <h1 align="center">
			학생 등록
			<hr>
		</h1>
   
<form method="post" action="menu2_inputPro.jsp" name="userinput" onSubmit="return checkIt()">
<table align="center" width="600" border="1" cellspacing="0" cellpadding="3">


   
<tr>
<td width="200" height="40"> 학번</td>
<td width="400">
<input type="text" name="student_id" size="10" maxlength="9">
<input type="button" name=menu2_confirm.jsp value="ID중복확인" OnClick="openConfirmid(this.form)">
</td>
</tr>
<tr>
<td width="200" height="40"> 비밀번호</td>
<td width="400" >
<input type="password" name="password" size="15" maxlength="12">
</td>
<tr>
<td width="200" height="40">비밀번호 확인</td>
<td width="400">
<input type="password" name="password2" size="15" maxlength="12">
</td>
</tr>
 

<tr>
<td width="200" height="40"> 이름</td>
<td width="400">
<input type="text" name="student_name" size="15" maxlength="10">
</td>
</tr>
<tr>
<td width="200" height="40"> 주소</td>
<td width="400">
<input type="text" name="student_address" size="30" maxlength="30">
</td>
</tr>
<tr>
<td width="200" height="40"> 전화번호</td>
<td width="400">
<input type="text" name="student_phone" size="15" maxlength="13">
</td>
</tr>

<tr>
			<td colspan="2" height="40" align="center""><input type="submit"
				name="confirm" value="등 록"> <input type="reset"
				name="reset" value="다시입력"> <input type="button" value="가입안함"
				onclick="javascript:window.location='main.html'"></td>
		</tr>
</table>
</form>
</body>
</html>
   