<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
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
   section td {
      font-size:15px;
      height:40px;
      border-bottom:2px solid #eeeeee;
      
   }
   section table tr:last-child td {
      border-bottom:none;
   }
   section #edit {
      display:inline-block;
      width:200px;
      height:30px;
      font-size:14px;
      margin-top:15px;
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
      margin-top:15px;
      border:1px solid black;
      background:black;
      color:white;
      padding:4px;
      cursor:pointer;
   }
 </style>
</head>
<body>  
   <section>
      <form name="mem" method="post" action="memberDelete">
        <table width="500" align="center">
        <h1> 계 정 탈 퇴 </h1>
        <tr>
          <td> 이 름 </td>
          <td> ${mvo.name} </td>
        </tr>
        <tr>
          <td> 아이디 </td>
          <td> ${mvo.userid} </td>
        </tr>
        <tr>
          <td> 주 소 </td>
          <td> ${mvo.juso} ${mvo.juso_etc} </td>
        </tr>
        <tr>
          <td> 휴대폰번호 </td>
          <td> ${mvo.phone} </td>
        </tr>
        <tr>
          <td> 이메일 </td>
          <td> ${mvo.email} </td>
        </tr>
        <tr>
          <td> 적립금 </td>
          <td> <fmt:formatNumber value="${mvo.money}" type="number"/>원 </td>
        </tr>
        <tr>
          <td> 포인트 </td>
          <td> <fmt:formatNumber value="${mvo.point}" type="number"/>원 </td>
        </tr>
        <tr>
          <td> 가입일 </td>
          <td> ${mvo.writeday} </td>
        </tr>
        </table>
        <input type="submit" id="edit" value="멤버탈퇴신청">
      </form>
   </section>
</body>
</html>










