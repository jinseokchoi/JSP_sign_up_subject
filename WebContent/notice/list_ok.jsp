<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>

  <%
  String id = request.getParameter("id");
  String pw = request.getParameter("pw");
  
  if(id.equals("root")){
  	if(pw.equals("root")){
  		response.sendRedirect("write.jsp");
  	}
  	else{
  		%>  
  	    <script>
  	        alert("비밀번호가 맞지 않습니다.");
  	        history.go(-1);        
  	    </script>
  	<%
  	}
  		
  }else{
  		%>  
  	    <script>
  	        alert("아이디가 맞지 않습니다.");
  	        history.go(-1);        
  	    </script>
  	<%
  	}
  %>
<body>

</body>
</html>