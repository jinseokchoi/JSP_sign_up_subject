<%@ page contentType="text/html; charset=euc-kr"%>
<html>
<head>
<title>ȸ������</title>
<script language="JavaScript">
 
function checkIt() {
var userinput = eval("document.userinput");
if(!userinput.student_id.value) {
alert("ID�� �Է��ϼ���");
return false;
}
 
if(!userinput.password.value ) {
alert("��й�ȣ�� �Է��ϼ���");
return false;
}
if(userinput.password.value != userinput.password2.value)
{
alert("��й�ȣ�� �����ϰ� �Է��ϼ���");
return false;
}
 
if(!userinput.student_name.value) {
alert("�̸��� �Է��ϼ���");
return false;
}
if(!userinput.student_address.value) {
	alert("�ּҸ� �Է��ϼ���");
	return false;
}
if(!userinput.student_phone.value) {
	alert("��ȭ��ȣ�� �Է��ϼ���");
	return false;
}
}
   
// ���̵� �ߺ� ���θ� �Ǵ�
function openConfirmid(userinput) {
// ���̵� �Է��ߴ��� �˻�
if (userinput.id.value == "") {
alert("���̵� �Է��ϼ���");
return;
}
// url�� ����� �Է� id�� �����մϴ�.
url = "menu2_confirm.jsp?student_id=" + userinput.student_id.value ;
 
// ���ο� �����츦 ���ϴ�.
open(url, "confirm",
"toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
}
</script>
   
    <h1 align="center">
			�л� ���
			<hr>
		</h1>
   
<form method="post" action="menu2_inputPro.jsp" name="userinput" onSubmit="return checkIt()">
<table align="center" width="600" border="1" cellspacing="0" cellpadding="3">


   
<tr>
<td width="200" height="40"> �й�</td>
<td width="400">
<input type="text" name="student_id" size="10" maxlength="9">
<input type="button" name=menu2_confirm.jsp value="ID�ߺ�Ȯ��" OnClick="openConfirmid(this.form)">
</td>
</tr>
<tr>
<td width="200" height="40"> ��й�ȣ</td>
<td width="400" >
<input type="password" name="password" size="15" maxlength="12">
</td>
<tr>
<td width="200" height="40">��й�ȣ Ȯ��</td>
<td width="400">
<input type="password" name="password2" size="15" maxlength="12">
</td>
</tr>
 

<tr>
<td width="200" height="40"> �̸�</td>
<td width="400">
<input type="text" name="student_name" size="15" maxlength="10">
</td>
</tr>
<tr>
<td width="200" height="40"> �ּ�</td>
<td width="400">
<input type="text" name="student_address" size="30" maxlength="30">
</td>
</tr>
<tr>
<td width="200" height="40"> ��ȭ��ȣ</td>
<td width="400">
<input type="text" name="student_phone" size="15" maxlength="13">
</td>
</tr>

<tr>
			<td colspan="2" height="40" align="center""><input type="submit"
				name="confirm" value="�� ��"> <input type="reset"
				name="reset" value="�ٽ��Է�"> <input type="button" value="���Ծ���"
				onclick="javascript:window.location='main.html'"></td>
		</tr>
</table>
</form>
</body>
</html>
   