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
        font-family:"맑은 고딕";
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

<form action="../Login/logout.jsp" target="_top" onsubmit="return confirm('로그아웃 하시겠습니까?')">
	<blockquote>
	관리자 <u>root</u>님 
	&nbsp;
	<input type="image" src="http://localhost:8080/JSP_Signup/image/logout.gif" />
	</blockquote><br>
</form>
<ul id="navi">
        <li class="group">
            <div class="title">등 록</div>
            <ul class="sub">
                <li><a target="detail" href="menu1.jsp">- 과 목</a></li>
                <li><a target="detail" href="menu2.jsp">- 학 생</a></li>
                <li><a target="detail" href="menu3.jsp">- 교 수</a></li>
            </ul>
        </li>
        <li class="group">
            <div class="title">삭 제</div>
            <ul class="sub">
                <li><a target="detail" href="menu4.jsp">- 과 목</a></li>   
                <li><a target="detail" href="menu5.jsp">- 학 생</a></li>
                <li><a target="detail" href="menu6.jsp">- 교 수</a></li>             
            </ul>
        </li>
        <li class="group">
            <div class="title">커뮤니티</div>
            <ul class="sub">
                <li><a target="detail" href="../notice/list.jsp">- 공지사항</a></li>   
                <li><a target="detail" href="../Board/list.jsp">- 게시판</a></li>      
            </ul>
        </li>
        
    </ul>
</body>
</html>