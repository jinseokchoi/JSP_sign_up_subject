<%@ page contentType="text/html; charset=euc-kr"%>
<html>
<head>
<title>ȸ������</title>
<script language="JavaScript">
 
function checkIt() {
var userinput = eval("document.userinput");
if(!userinput.course_id.value) {
alert("ID�� �Է��ϼ���");
return false;
}
  
if(!userinput.title.value) {
alert("������� �Է��ϼ���");
return false;
}
if(!userinput.credits.value) {
	alert("������ �Է��ϼ���");
	return false;
}
if(!userinput.classroom.value) {
	alert("���ǽǸ� �Է��ϼ���");
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
url = "menu1_confirm.jsp?course_id=" + userinput.course_id.value ;
 
// ���ο� �����츦 ���ϴ�.
open(url, "confirm",
"toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
}
</script>
   
   
   <h1 align="center">
			���� ���
			<hr>
		</h1>
<form method="post" action="menu1_inputPro.jsp" name="userinput" onSubmit="return checkIt()">
<table align="center" width="600" border="1" cellspacing="0" cellpadding="3">


<tr>
<td width="200" height="40"> �б�</td>
<td width="400">
<input type="text" name="year" value="2015" size="5" maxlength="10">�⵵   
<select name="term">
<option value="1">1</option>
<option value="2">2</option>
</select>�б�
</td>
</tr>
<tr>
<td width="200" height="40"> ���� ID</td>
<td width="400">
<input type="text" name="course_id" size="10" maxlength="9">
<input type="button" name=menu1_confirm.jsp value="ID�ߺ�Ȯ��" OnClick="openConfirmid(this.form)">
</td>
</tr>
<tr>
<td width="200" height="40"> �����</td>
<td width="400" >
<input type="text" name="title" size="15" maxlength="12">
</td>

 

<tr>
<td width="200" height="40"> ����</td>
<td width="400">
<input type="text" name="credits" size="5" maxlength="10">��
</td>
</tr>
<tr>
<tr>
<td width="200" height="40"> ���ǽ�</td>
<td width="400">
<input type="text" name="classroom" size="15" maxlength="10">
</td>
</tr>
<tr>
<td width="200" height="40"> �����ο�</td>
<td width="400">
<input type="text" name="nop" size="5" maxlength="10">��
</td>
</tr>
<tr>
<td width="200" height="40"> ����</td>
<td width="400">
����<input type="radio" name="type" value="maj" size="15" maxlength="10">
����<input type="radio" name="type" value="lib" size="15" maxlength="10">
</td>
</tr>

<tr>
			<td colspan="2" height="40" align="center""><input type="submit"
				name="confirm" value="�� ��"> <input type="reset"
				name="reset" value="�ٽ��Է�"> <input type="button" value="������"
				onclick="javascript:window.location='main.html'"></td>
		</tr>
</table>
</form>
</body>
</html>
   