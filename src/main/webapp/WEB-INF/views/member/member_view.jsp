 
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
   section td  {
      font-size:13px;
      height:40px;
      border-top:1px solid #eeeeee;
      border-bottom:2px solid #eeeeee;
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
 </style>
</head>  
<body>
   <section>
     <table width="900" align="center">
       <caption style="font-size:25px;"> <h3> 계 정 정 보 </h3></caption>
       <tr>
         <th> 아이디 </th>
         <th> 이름 </th>
         <th> 우편번호 </th>
         <th> 주소 </th>
         <th> 전화번호 </th>
         <th> 이메일 </th>
         <th> 가입일 </th>
       </tr>
       <tr align="center">
         <td> ${mvo.userid} </td>
         <td> ${mvo.name} </td>
         <td> ${mvo.zip} </td>
         <td> ${mvo.juso} ${mvo.juso_etc} </td>
         <td> ${mvo.phone} </td>
         <td> ${mvo.email} </td>
         <td> ${mvo.writeday} </td>
       </tr>
     </table>
 
     <div align="center">
       <span id="edit" onclick="location='member_edit'"> 정보변경 </span>
       <span id="edit" onclick="location='juso_list'"> 배송지목록 </span>
       <span id="edit" onclick="location='pwd_edit'"> 비밀번호변경 </span>
       <span id="edit" onclick="removeMember()"> 멤버탈퇴신청 </span>
     </div>
   </section>
   <script>
     function removeMember() {
    	 if(window.confirm("탈퇴하시겠습니까?")) {
    		 location.href="../member/member_delete";
    	 }
     }
   </script>
</body>
</html>







