<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<style>
    body {
        margin:20px auto;
        padding: 0;
        font-family:"���� ���";
        font-size:0.9em;
}
    ul#navi {
        width: 250px;
        text-indent: 10px;
}
    ul#navi, ul#navi ul {
        margin:0;
        padding:0;
        list-style:none;
}
    li.group {
        margin-bottom: 3px;
}
    li.group div.title {
        height: 50px;
        line-height: 50px;
        background:#0074be;
        cursor:pointer;
}
    ul.sub li {
        margin-bottom: 2px;
        height:50px;
        line-height:50px;
        background:#f4f4f4;
        cursor:pointer;
}
    ul.sub li a {
        display: block;
        width: 100%;
        height:100%;
        text-decoration:none;
        color:#000;
}
    ul.sub li:hover {
        background:#00a8ea;
}
</style>
<body>

<form action="../Login/logout.jsp" target="_top" onsubmit="return confirm('�α׾ƿ� �Ͻðڽ��ϱ�?')">
	<blockquote>
	������ <u>root</u>�� 
	&nbsp;
	<input type="image" src="http://localhost:8080/JSP_Signup/image/logout.gif" />
	</blockquote><br>
</form>
<ul id="navi">
        <li class="group">
            <div class="title">�� ��</div>
            <ul class="sub">
                <li><a target="detail" href="menu1.jsp">- �� ��</a></li>
                <li><a target="detail" href="menu2.jsp">- �� ��</a></li>
                <li><a target="detail" href="menu3.jsp">- �� ��</a></li>
            </ul>
        </li>
        <li class="group">
            <div class="title">�� ��</div>
            <ul class="sub">
                <li><a target="detail" href="menu4.jsp">- �� ��</a></li>   
                <li><a target="detail" href="menu5.jsp">- �� ��</a></li>
                <li><a target="detail" href="menu6.jsp">- �� ��</a></li>             
            </ul>
        </li>
        <li class="group">
            <div class="title">Ŀ�´�Ƽ</div>
            <ul class="sub">
                <li><a target="detail" href="../notice/list.jsp">- ��������</a></li>   
                <li><a target="detail" href="../Board/list.jsp">- �Խ���</a></li>      
            </ul>
        </li>
        
    </ul>
</body>
</html>