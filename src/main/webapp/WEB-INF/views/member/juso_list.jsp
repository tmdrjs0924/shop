 
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
   section table {
     border-spacing:0px;
   }
   section table td {
      height:80px;
      font-size:14px;
      border-bottom:1px solid #E4E4E4;
    }
    section table tr:first-child td {
      border-bottom:2px solid #747474;
    }
    section table tr:last-child td {
      border-bottom:2px solid #747474;
    }
   section th {
     font-size:14px;
      height:30px;
      border-top:2px solid #eeeeee;
   }
   section #edit {
      display:inline-block;
      width:200px;
      height:30px;
      font-size:14px;
      margin-top:30px;
      border:1px solid #747474;
      background:#747474;
      color:white;
      padding:4px;
   }
   section #edit:hover {
      display:inline-block;
      width:200px;
      height:30px;
      font-size:14px;
      margin-top:30px;
      border:1px solid black;
      background:black;
      color:white;
      padding:4px;
      cursor:pointer;
   }
      section #delbtn {
      width:190px;
      height:50px;
      background:black;
      border:1px solid black; 
      border-radius:3em;
      color:white;
      margin-left:10px;
      margin-top:0px;
      margin-bottom:100px;
      font-size:15px;
   }
   section #sdel {
      display:inline-block;
      width:90px;
      height:30px;
      border:1px solid #F6F5F5;
      border-radius:1em;
      text-align:center;
      padding-top:4px;
      background:#F6F5F5;
      color:black;
    }
    section #sdel:hover {
      background:#E5E5E5;
      cursor:pointer;
    }
    section #jdel {
      display:inline-block;
      width:100px;
      height:100px;
      border-left:1px dashed #747474;
      text-align:center;
      margin-top:-30px;
      padding-top:40px;
      padding-left:30px;
      margin-left:-60px;
      color:black;
      cursor:pointer;
    }
    section #jdel:hover {
      display:inline-block;
      width:100px;
      height:100px;
      border-left:1px dashed #747474;
      text-align:center;
      margin-top:-30px;
      padding-top:40px;
      padding-left:30px;
      margin-left:-60px;
      color:red;
      cursor:pointer;
    }
 </style>
 <script>
 function maincheck(my)
 {
 	var csub=document.getElementsByClassName("csub");
 	var len=csub.length;
 	
 	if(my.checked)
     {
 		for(i=0;i<len;i++)
 	    {
 			csub[i].checked=true;
 	    }
 		document.getElementById("up").checked=true;
     }
 	else
 	{
 		for(i=0;i<len;i++)
 		{
 			csub[i].checked=false;
 		}
 		document.getElementById("up").checked=false;
 	}
 }
 
 function subcheck()
 {
 	var csub=document.getElementsByClassName("csub");
 	var len=csub.length;
 	
 	var n=0;
 	for(i=0;i<len;i++)
 	{
 		if(csub[i].checked)
 			n++;
 	}
 	
 	if(len==n)
 	{
 		document.getElementById("up").checked=true;
 	}
 	else
 	{
 		document.getElementById("up").checked=false;
 	}
 }
   
   function juso_del() {
	   
	   var id="";
   	   var csub=document.getElementsByClassName("csub");
   	   var len=csub.length;
   	
   	   for(i=0;i<len;i++)
   	   {
   		   if(csub[i].checked)
   			   id=id+csub[i].value+",";
   	   }
   	
   	   if(id!="")
		      location="juso_delete?id="+id;
      }
 </script>
</head>  
<body>
   <section>
     <table width="900" align="center">
       <caption style="font-size:25px;"> <h3> 배 송 지 목 록 </h3></caption>
       <tr>
         <td colspan="10" align="left">
           <input type="checkbox" onclick="maincheck(this)" id="up"> 전체선택
           <span id="sdel" onclick="juso_del()"> 선택삭제 </span>
         </td>
       </tr>
       <tr>
         <th> 선택 </th>
         <th> 아이디 </th>
         <th> 이름 </th>
         <th> 우편번호 </th>
         <th> 주소 </th>
         <th> 전화번호 </th>
       </tr>
      <c:forEach items="${jlist}" var="jvo">
       <tr align="center">
         <td> <input type="checkbox" class="csub" onclick="subcheck()" value="${jvo.id}"> </td>
         <td> ${jvo.userid} </td>
         <td> ${jvo.name} </td>
         <td> ${jvo.zip} </td>
         <td> ${jvo.juso} ${jvo.juso_etc} </td>
         <td> ${jvo.phone} </td>
         <td> <span id="jdel" onclick="location='juso_delete?id=${jvo.id}'"> 삭제 </span>
       </tr>
      </c:forEach>
     </table>
 
     <div align="center">
       <span id="edit" onclick="location='juso_edit'"> 배송지목록 등록 </span>
       <span id="edit" onclick="location='member_view'"> 이전 페이지 </span>
     </div>
   </section>
</body>
</html>







