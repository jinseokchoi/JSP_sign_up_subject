<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="DB.MemberDao" %>
    
<%
    request.setCharacterEncoding("utf-8");

    String id =request.getParameter("id");
    String pw =request.getParameter("pw");
    String type =request.getParameter("type");

    MemberDao manager =MemberDao.getInstance();
    if(id.equals("root")){
    	if(pw.equals("root")){
    		response.sendRedirect("../Root/Rframe.html");
    	}
    	else{
    		%>  
    	    <script>
    	        alert("비밀번호가 맞지 않습니다.");
    	        history.go(-1);        
    	    </script>
    	<%
    	}
    		
    }
    if(type.equals("stu")){
    	int check=manager.stuCheck(id, pw);
    	 if(check==1){
    	        //로그인 성공
    	        response.sendRedirect("../Student/Sframe.html");
    	        
    	    }else if(check==0){    
    	%>  
    	    <script>
    	        alert("비밀번호가 맞지 않습니다.");
    	        history.go(-1);        
    	    </script>
    	<%}else{ %>
    	    <script>
    	        alert("아이디가 맞지 않습니다.");
    	        history.go(-1);        
    	    </script>
    	<%}}
    else{
    	int check=manager.proCheck(id, pw);
    	 if(check==1){
    	        //로그인 성공
    	        response.sendRedirect("../Professor/Pframe.html");
    	        
    	    }else if(check==0){    
    	%>  
    	    <script>
    	        alert("비밀번호가 맞지 않습니다.");
    	        history.go(-1);        
    	    </script>
    	<%}else{ %>
    	    <script>
    	        alert("아이디가 맞지 않습니다.");
    	        history.go(-1);        
    	    </script>
    	<%}}
   %>