<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<title>Insert title here</title>
	<style>
		section {
			width:1000px;
			margin:auto;
		}
		#blt {
			margin-top:50px;
			width:950px;
			text-align:center;
			border-collapse:collapse;
			border:1px solid #D5CFC7;
			font-family: 'Noto Sans KR', sans-serif;
			font-size:12px;
		}
		#blt th {
			height:40px;
			border-top:1px solid #D5CFC7;
			border-bottom:1px solid #D5CFC7;
		}
		#blt td{
			height:40px;
			border-top:1px solid #D5CFC7;
			border-bottom:1px solid #D5CFC7;
		}
		#bstate, #bwriteday, #bbrand, #bwriteday2 {
			font-weight:bold;
		}
		#btitle:hover {
			cursor:pointer;
			background:#ECECEC;
		}
		#hidecontent {
			display:none;
		}
		#hideanswer {
			display:none;
			background:#ECECEC;
		}
		#btitle {
			text-align:left;
			text-indent:10px;
		}
		#bcontent, #banswer {
			text-align:left;
			padding:15px;
		}
		#bcontent #update {
			float:right;
		}
		#wbtn {
			width:950px;
			text-align:right;
			font-family:'Noto Sans KR', sans-serif;
			font-weight:bold;
			font-size:12px;
			color:grey;
		}
		#wbtn button {
			border:1px solid #D5CFC7;
			font-family:'Noto Sans KR', sans-serif;
			font-weight:bold;
			font-size:12px;
			width:65px;
			height:35px;
			background:white;
			margin:8px 0 0 8px;
		}
		#ubtn {
			border:1px solid #D5CFC7;
			font-family:'Noto Sans KR', sans-serif;
			font-weight:bold;
			font-size:12px;
			width:40px;
			height:27px;
			background:white;
		}
		#paging {
			padding:0px;
		}
		#blt a {
			text-decoration:none;
			color:#BEBEBE;
			display:table-cell;
			width:35px;
			height:40px;
			margin:0px;
			border-left:1px solid #D5CFC7;
			text-align:center;
			line-height:40px;
		}
		#blt a:hover {
			background:#ECECEC;
		}
	</style>

	<script>
		function toggle(n){
			if(document.getElementsByClassName("hidecontent")[n].style.display=="none") {
				document.getElementsByClassName("hidecontent")[n].style.display="table-row";
				document.getElementsByClassName("hideanswer")[n].style.display="table-row";
			}
			else {
				document.getElementsByClassName("hidecontent")[n].style.display="none";
				document.getElementsByClassName("hideanswer")[n].style.display="none";
			}
		}
	</script>
</head>
<body>
	
	<section>
	
	<table id="blt">

		<tr>
			<th width="80">??????</th>
			<th width="80">????????????</th>
			<th width="80">??????</th>
			<th width="500">??????</th>
			<th width="100">?????????</th>
			<th width="100">????????????</th>
		</tr>
		
		<c:forEach items="${list}" var="bvo">
		

		<tr>
			<td id="bid">${bvo.id}</td>
			<td id="bstate">
				<c:choose>
					<c:when test="${bvo.state==0}">????????????</c:when>
					<c:when test="${bvo.state==1}">????????????</c:when>
				</c:choose>
			</td>
			<td id="bsort">
				<c:choose>
					<c:when test="${bvo.sort==0}">?????????</c:when>
					<c:when test="${bvo.sort==1}">??????</c:when>
					<c:when test="${bvo.sort==2}">?????????</c:when>
					<c:when test="${bvo.sort==3}">??????????????????</c:when>
				</c:choose>
			</td>
			<td id="btitle" onclick="toggle(${bvo.order})">${bvo.title}</td>
			<td id="buserid">${bvo.memberId}</td>
			<td id="bwriteday">${bvo.writeday}</td>
		</tr>

		<tr id="hidecontent" class="hidecontent">
			<td colspan="6" id="bcontent">${bvo.content}
			<span id="update">
				<input type="button" value="??????" onclick="open('update?id=${bvo.id}','_blank','width=600,height=800')" id="ubtn">
				<input type="button" value="??????" onclick="location='delete?id=${bvo.id}'" id="ubtn">
			</span></td>
		</tr>

		<tr id="hideanswer" class="hideanswer">
		<c:choose>
		<c:when test="${bvo.state==0}">
		</c:when>
		<c:when test="${bvo.state==1}">
			<td id="bbrand">${bvo.brand}<br>?????????</td>
			<td colspan="4" id="banswer">${bvo.answer}</td>
			<td id="bwriteday2">${bvo.writeday2}</td>
		</c:when>
		</c:choose>
		</tr>

		</c:forEach>
		
		<tr>
			<td colspan="6" align="right">
				${page}/${chong}?????????
			</td>
		</tr>
		<tr>
			<td colspan="6" align="right" id="paging">
		
				<a href="list?page=1&rnum=${rnum}"><<</a>
				<c:choose>
					<c:when test="${pstart==1}">
						<a href="#"><</a>
					</c:when>
					<c:otherwise>
						<a href="list?page=${pstart-1}&rnum=${rnum}"><</a>
					</c:otherwise>
				</c:choose>
				
				<c:forEach var="i" begin="${pstart}" end="${pend}">
					<c:choose>
						<c:when test="${page==i}">
							<a href="list?page=${i}&rnum=${rnum}" style="color:black;background:#ECECEC;">${i}</a>
						</c:when>
						<c:otherwise>
							<a href="list?page=${i}&rnum=${rnum}">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<c:choose>
					<c:when test="${pend==chong}">
						<a href="#">></a>
					</c:when>
					<c:otherwise>
						<a href="list?page=${pend+1}&rnum=${rnum}">></a>
					</c:otherwise>
				</c:choose>
				<a href="list?page=${chong}&rnum=${rnum}">>></a>
		
			</td>
		</tr>
	</table>
	
	<div id="wbtn">
		??? ????????? ??????, ?????? ???, ?????? ??????, ?????? ?????? ????????? ???????????????.
		<button type="button" onclick="open('write','_blank','width=600,height=800')">????????????</button>
	</div>
	
	</section>

</body>
</html>