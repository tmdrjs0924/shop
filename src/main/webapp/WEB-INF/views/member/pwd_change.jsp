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
      padding-top:50px;
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
   section #userid {
      width:250px;
      height:48px;
   }
   section #nuchk {
      width:150px;
      height:50px;
      vertical-align:bottom;
      border-radius:1em;
      border:1px solid #757575; 
      background:white;
      color:#757575;
      font-size:15px;
   }
   section #nuchk:hover {
      width:150px;
      height:50px;
      vertical-align:bottom;
      border-radius:1em;
      border:1px solid black; 
      background:black;
      color:white;
      font-size:15px;
      cursor:pointer;
   }
 </style>
 <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <script src="http://code.jquery.com/jquery-latest.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
 <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" >
 <script>
 $(document).ready(function(){
	 $('#mem').on('submit',function(){
		 var $thisForm=$(this);
		 var npwd=$thisForm.find('input[name=npwd]').val();
		 var npwd2=$thisForm.find('input[name=npwd2]').val();
		 var nchk=0;
	 	    var nchk=document.mem.name.value;
	 	    var ichk=0;
	 	    var ichk=document.mem.userid.value;
	 	    
	 	    if(nchk==0) {
	 	    	
	 	    	alert('????????? ??????????????????');
	 			return false;
	 	    }
	 	    else if(ichk==0) {
	 	    	
	 	    	alert('???????????? ??????????????????');
	 			return false;
	 	    }
	 	    else if(npwd !== npwd2) {
			 alert("?????? ??????????????? ?????? ????????????????????? ???????????? ????????????");
			 return false;
		 }
	 	    else {
	 	    	alert("???????????? ?????? ?????? ????????? ??????????????? ?????????????????????");
	 	    }
	 });
 });
     
     function pwd_search()
     {
            	
        var chk=new XMLHttpRequest();
        var userid=document.mem.userid.value;
        var name=document.mem.name.value;
  	    var email=document.mem.email.value;
  	   
  	   chk.onload=function()
  	   {
  		   var pwd=chk.responseText.trim();
  		   if(pwd=="1")
  		   {
  			  alert("?????? ????????? ????????? ?????????");
  		   }
  		   else {
  			   
  			   alert("???????????? ?????? ????????? ??????????????? ??????????????????");
  		   }
  	   }
  	   
  	   chk.open("get","pwd_search?userid="+userid+"&name="+name+"&email="+email);
  	   chk.send();
     }
 </script>
</head>
<body>  
   <section>
      <form id="mem" method="post" action="pwd_change_ok" name="mem" onsubmit="return form_check()">
        <h2> ??? ??? ??? ??? ??? ??? </h2>
        <div> <input type="text" name="name" placeholder="????????? ???????????????"> </div>
        <div> <input type="text" name="email" placeholder="???????????? ???????????????"> </div>
        <div>
        <input type="text" name="userid" id="userid" placeholder="???????????? ???????????????">
        <input type="button" id="nuchk" value="??????" onclick="pwd_search()">
        </div>
        <div> <input type="password" name="npwd" placeholder="?????? ????????????" required/> </div>
        <div> <input type="password" name="npwd2" placeholder="?????? ???????????? ??????" required/> </div>
        <div> <input type="submit" value="???????????? ??????" id="subbtn"> </div>
      </form>
   </section>
</body>
</html>










