<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
$(function(){
	$("#counselect").val("${state}").prop("selected",true);
	$("#counselect").selectmenu({width:120});
	$("#counselect").selectmenu({
		change: function(){
			var state=document.getElementById("counselect").value;
			location="counsel_list?state="+state;
		}
	});
	test=$(".title");
	$(".title").click(function(){
		n=test.index(this);
		$(".content").eq(n).toggle();
		$(".answer").eq(n).toggle();
	});
});
</script>
<style>
	section {
		width:800px;
		margin:auto;
		min-height:500px;
	}
	section table {
		width:800px;
		margin:auto;
		box-sizing:border-box;
		border-collapse:collapse;
	}	
	section table td {
		border-top:1px solid black;
		border-bottom:1px solid black;
	}
	section .userid {
		padding-left:50px;
	}
	section .writeday {
		float:right;
	}
	section .title {
		width:300px;
		cursor:pointer;
		background:#F6F6F6;
	}
	section .content,
	section .answer {
		display:none;
		height:140px;
		vertical-align:top;
	}
	section .ans_input {
		width:740px;
		height:130px;
		resize:none;
		outline:none;
		border-radius:5px;
		margin-top:7px;
	}
	section .btn {
		width:50px;
		height:28px;
		background:white;
		border:1px solid grey;
		color:black;
		border-radius:3px;
		position:relative;
		top:-60px;
	}
</style>
</head>
<body>
<section>
	<div align="center">
	<select id="counselect">
		<option value="0">답변대기</option>
		<option value="1">답변완료</option>
	</select>
	</div>
	
	<table width="800">
		<c:forEach items="${clist}" var="cvo">
		<tr class="title">
			<td><span class="id">no.${cvo.id}</span> <span class="userid">ID: ${cvo.userid}</span> <span class="writeday">${cvo.writeday}</span></td>
		</tr>
		<tr class="content" >
			<td>${cvo.content}</td>
		</tr>
		<tr class="answer">
				<c:if test="${cvo.state==1}">
					<td>${cvo.answer}</td>
				</c:if>
				<c:if test="${cvo.state==0}">
					<td>
						<form method="post" action="counsel_update" id="ans_box">
							<input type="hidden" name="id" value="${cvo.id}">
							<textarea name="answer" class="ans_input"></textarea>
							<input type="submit" value="답변" class="btn">
						</form>
					</td>
				</c:if>
		</tr>
		</c:forEach>
	</table>
</section>
</body>
</html>