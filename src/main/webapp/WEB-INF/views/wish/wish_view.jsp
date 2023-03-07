<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>  
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <style>
    section {
      width:1000px;
      margin:auto;
      min-height:522px;
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
      border-bottom:2px solid black;
    }
    section table tr:last-child td {
      border-bottom:2px solid black;
    }
    section #last {
      border-bottom:2px solid black;
    }
    section #cadd,#wdel {
      display:inline-block;
      width:100px;
      height:21px;
      border:1px solid black;
      border-radius:1em;
      text-align:center;
      padding-top:-2px;
      margin-left:-60px;
      background:black;
      color:white;
      cursor:pointer;
    }
    section #cadd:hover,#wdel:hover {
      display:inline-block;
      width:100px;
      height:21px;
      border:1px solid black;
      border-radius:1em;
      text-align:center;
      padding-top:-2px;
      margin-left:-60px;
      background:white;
      color:black;
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
    section #title:hover {
      color:#7D7D7D;
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
    
    function wish_del()
    {
    	var id="";
    	var csub=document.getElementsByClassName("csub");
    	var len=csub.length;
    	
    	for(i=0;i<len;i++)
    	{
    		if(csub[i].checked)
    			id=id+csub[i].value+",";
    	}
    	
    	if(id!="")
    		location="wish_del?id="+id;
    }
  </script>
</head>
<body>
  <section>
    <table width="900" align="center">
      <tr>
        <td colspan="6" align="left">
          <div style="font-size:25px;"><b> WishList </b></div> <p>
          <input type="checkbox" onclick="maincheck(this)" id="up">전체선택
          <span id="sdel" onclick="wish_del()"> 선택삭제 </span>
        </td>
      </tr>
      <c:forEach items="${wlist}" var="wvo">
      <tr >
        <td> <input type="checkbox" class="csub" onclick="subcheck()" value="${wvo.id}">
        <td> <img src="../resources/pro/${wvo.pImg1}" width="100" height="70"></td>
        <td id="title" onclick="location='../product/content?pCode=${wvo.pCode}'"> ${wvo.pName} </td>
        <td style="padding-right:90px;"> <fmt:formatNumber value="${wvo.pPrice}" type="number"/>원 </td>
        <td>
          <span id="cadd" onclick="location='add_cart?pCode=${wvo.pCode}'"> 장바구니 이동 </span> <br>
          <span id="wdel" style="margin-top:5px;" onclick="location='wish_del?id=${wvo.id}'"> 삭제 </span>
        </td>
        </td>
      </tr>
      </c:forEach>
    </table>
  </section>
</body>
</html>