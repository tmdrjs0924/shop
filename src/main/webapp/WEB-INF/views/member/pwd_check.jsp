<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <style>
   
   section {
      width:1000px;
      height:600px;
      margin:auto;
      text-align:center;
      padding-top:100px;
   }
   section div {
     margin-top:12px;
     margin-left:120px;
   }
   section input[type=password],section input[type=text] {
      width:400px;
      height:48px;
      border-radius:1em;
      border:1px solid #757575;
      margin-left:-130px;
      font-size:15px;
      text-indent: 10px;
   }
   section #subbtn {
      width:190px;
      height:50px;
      background:black;
      border:1px solid black; 
      border-radius:3em;
      color:white;
      margin-left:-140px;
      margin-top:0px;
      margin-bottom:100px;
      font-size:15px;
   }
   section #subbtn:hover {
      width:190px;
      height:50px;
      background:#757575;
      border:1px solid #757575; 
      border-radius:3em;
      color:white;
      margin-left:-140px;
      margin-top:0px;
      margin-bottom:100px;
      font-size:15px;
      cursor:pointer;
   }
   section #msg {
      color:red;
      margin-left:10px;
   }
 </style>
 <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <script src="http://code.jquery.com/jquery-latest.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
 <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" >
 <script>
 var pchk=0;
 function pwd_check()
 {
	   var pwd=document.mem.pwd.value;
	   var pwd2=document.mem.pwd2.value;
	   
	   if(pwd2.length != 0)
	   {	   
	     if(pwd==pwd2)
	     {
		    document.getElementById("msg").innerText="비밀번호 일치합니다";
		    document.getElementById("msg").style.color="blue";
		    pchk=1;
		    return true;
	     }	  
	     else
	     {
		    document.getElementById("msg").innerText="비밀번호가 불일치 합니다";
		    document.getElementById("msg").style.color="red";
		    pchk=0;
		    return false;
	     }
	   }
 }
 </script>
</head>
<body>  
   <section>
      <form id="mem" name="mem" method="post" action="pwd_check_ok" onsubmit="return pwd_check()">
        <h2> 비 밀 번 호 확 인 </h2>
        <div> <input type="text" name="userid" value="${userid}" readonly> </div>
        <div> <input type="password" name="pwd" placeholder="비밀번호" onkeyup="pwd_check()"> </div>
        <div> <input type="password" name="pwd2" placeholder="비밀번호 확인" onkeyup="pwd_check()"> </div>
        <c:if test="${pchk == 1}">
          <div id="msg" style="font-size:12px;color:red;">비밀번호가 틀립니다 다시 확인해주세요</div> 
        </c:if>
        <div> <input type="submit" value="계정설정 페이지 이동" id="subbtn"> </div>
      </form>
   </section>
</body>
</html>










