<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
		section #rform {
			margin:30px 0;
		}
		section #review {
			width:400px;
			margin:auto;
			box-sizing:border-box;
			border-collapse:collapse;
			border-radius:3px;
			font-size:14px;
		}
		section #review td:first-child {
			text-align:center;
		}
		section #review #pimg {
			width:120px;
			height:100px;
			text-align:center;
		}
		section #review #pimg img {
			width:100px;
			height:100px;
		}
		section #review #pname {
			width:280px;
			text-indent:5px;
		}
		section #review #simg {
			height:30px;
		}
		section #review #simg div {
			display:flex;
			align-items:center;
			padding-left:5px;
		}
		section #review #simg img {
			width:20px;
			height:20px;
			cursor:pointer;
		}
		section #review #content {
			height:150px;
		}
		section #review #content textarea{
			width:280px;
			height:150px;
			resize:none;
			outline:none;
			border:none;
			padding:3px;
		}
		section #sub_btn {
			width:300px;
			margin:auto;
			margin-top:10px;
			text-align:center;
		}
		section #sub_btn input {
			width:100px;
			height:33px;
			border:1px solid black;
			border-radius:2px;
			font-size:15px;
			font-weight:600;
			background:white;
			cursor:pointer;
		}
		section #ps {
			font-size:12px;
			text-align:right;
			margin-right:20px;
		}
	</style>
	<script>
		var star=0;
		function click_star(n){
			var simg=document.getElementsByClassName("simg");
			for(i=0;i<=n;i++){
				simg[i].src="../resources/pro/star2.png";
			}
			for(i=n+1;i<=4;i++){
				simg[i].src="../resources/pro/star1.png";
			}
			star=n+1;
			var msg="";
			switch(star){
				case 1: msg="매우 나쁨"; break;
				case 2: msg="나쁨"; break;
				case 3: msg="보통"; break;
				case 4: msg="좋음"; break;
				case 5: msg="아주 좋음"; break;
			}
			document.getElementById("msg").innerText=msg;
			document.rform.star.value=star;
		}
		function review_check(){
			if(document.getElementById("msg").innerText.length==0){
				alert("별점 선택은 필수입니다");
				return false;
			}
			if(document.rform.content.value.length==0){
				alert("후기를 입력해주세요");
				return false;
			}
			else
				return true;
		}
		function rsubmit(){
			if(review_check()){
				var chk=new XMLHttpRequest();
				var star=document.rform.star.value;
				var content=document.rform.content.value;
				chk.onload=function(){
					if(chk.responseText=="1"){
						opener.location.reload();
						close();
					}
				}
				chk.open("get", "review_ok?pCode="+'${pvo.pCode}'+"&content="+content+"&star="+star+"&index="+${index}+"&orderId="+${orderId});
				chk.send();
			}
		}
	</script>
</head>
<body>
	<section>
		<form name="rform" id="rform">
			<input type="hidden" name="star">
			<div id="ps">*는 필수항목입니다.</div>
			<table id="review" border="1">
				<tr>
					<td id="pimg"><img src="../resources/pro/${pvo.pImg1}"></td>
					<td id="pname">${pvo.pName} - ${pvo.pSize}</td>
				</tr>
				<tr>
					<td>별점*</td>
					<td id="simg">
						<div>
							<img src="../resources/pro/star1.png" class="simg" onclick="click_star(0)">
							<img src="../resources/pro/star1.png" class="simg" onclick="click_star(1)">
							<img src="../resources/pro/star1.png" class="simg" onclick="click_star(2)">
							<img src="../resources/pro/star1.png" class="simg" onclick="click_star(3)">
							<img src="../resources/pro/star1.png" class="simg" onclick="click_star(4)">
							<span id="msg"></span>
						</div>
					</td>
				</tr>
				<tr>
					<td>후기*</td>
					<td id="content"><textarea name="content"></textarea></td>
				</tr>
			</table>
			<div id="sub_btn"><input type="button" value="작성하기" onclick="rsubmit()"></div>
		</form>
	</section>
</body>
</html>