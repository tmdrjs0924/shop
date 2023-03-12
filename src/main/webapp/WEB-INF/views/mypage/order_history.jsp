<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<title>Insert title here</title>
	<style>
		section {
			width:1000px;
			min-height:500px;
			margin:auto;
			margin-top:50px;
			margin-bottom:50px;
			padding:30px 0;
			border-radius:40px;
			background:white;
		}
		section #history {
			border-collapse:collapse;
			margin:auto;
			width:1000px;
		}
		section #history th {
			border-top:2px solid black;
			border-bottom:2px solid black;
		}
		section #history tr:last-child td {
			border-bottom:2px solid black;
		}
		section .title {
			height:33px;
			line-height:33px;
		}
		section .title .left {
			text-align:left;
			text-indent:5px;
		}
		section .title .right {
			width:150px;
			text-align:center;
		}
		section .detail {
			padding-left:10px;
			color:#2ECC71;
			font-size:13px;
			cursor:pointer;
		}
		section .content{
			font-size:14px;
			border-bottom:1px solid lightgrey;
		}
		section .content .left{
			width:150px;
			text-align:center;
		}
		section .content .center{
			text-indent:10px;
		}
		section .content .img {
			width:130px;
			height:130px;
		}
		section .content .right div {
			margin:auto;
			width:85px;
			text-align:center;
			padding:5px 7px;
			border:2px solid grey;
			border-radius:5px;
			background:white;
			font-size:13px;
			font-weight:900;
			cursor:pointer;
			opacity:0.8;
		}
		section .btn {
			text-align:right;
			margin-bottom:100px;
		}
		section .btn span {
			margin:auto;
			line-height:50px;
			padding:5px 15px;
			border:2px solid black;
			border-radius:5px;
			background:white;
			font-size:13px;
			font-weight:900;
			cursor:pointer;
			opacity:0.8;
		}
	</style>
	<script>
		$(function(){
			// 스크롤 위치를 세션 스토리지에 저장
			window.addEventListener('scroll', function() {
			  sessionStorage.setItem('scrollPosition', window.scrollY);
			});
			// 세션 스토리지에 저장된 스크롤 위치를 불러옴
			var scrollPosition = sessionStorage.getItem('scrollPosition');
			// 스크롤 위치를 조정
			if (scrollPosition !== null) {
			  window.scrollTo(0, scrollPosition);
			}
		});
	</script>
</head>
<body>
	<section>
		<c:forEach items="${olist}" var="ovo">
			<table id="history">
				<c:if test="${ovo.orderState==0}"><c:set value="결제완료" var="state"/></c:if>
				<c:if test="${ovo.orderState==1}"><c:set value="상품준비중" var="state"/></c:if>
				<c:if test="${ovo.orderState==2}"><c:set value="배송중" var="state"/></c:if>
				<c:if test="${ovo.orderState==3}"><c:set value="배송완료" var="state"/></c:if>
				<c:if test="${ovo.orderState==4}"><c:set value="취소대기" var="state"/></c:if>
				<c:if test="${ovo.orderState==5}"><c:set value="취소완료" var="state"/></c:if>
				<c:if test="${ovo.orderState==6}"><c:set value="반품대기" var="state"/></c:if>
				<c:if test="${ovo.orderState==7}"><c:set value="반품완료" var="state"/></c:if>
				<c:if test="${ovo.orderState==8}"><c:set value="환불대기" var="state"/></c:if>
				<c:if test="${ovo.orderState==9}"><c:set value="환불완료" var="state"/></c:if>
				<c:if test="${ovo.orderState==10}"><c:set value="구매확정" var="state"/></c:if>
				<tr class="title">
					<th colspan="2" class="left">
						주문번호(${ovo.orderNumber}) - ${state}
						<span class="detail" onclick="location='order_detail?orderNumber=${ovo.orderNumber}'">주문상세 ></span>
					</th>
					<th class="right">${ovo.orderDate} 결제</th>
				</tr>
				
				<c:forEach items="${ovo.plist}" var="pvo">
				<tr class="content">
					<td class="left"><img src="../resources/pro/${pvo.pImg1}" class="img"></td>
					<td class="center">
						<div>${pvo.pName}</div>
						<div><fmt:formatNumber value="${pvo.pPrice-pvo.pPrice*pvo.pDc/100}" pattern="#,###"/>원</div>
					</td>
					<td class="right">
						<c:if test="${ovo.orderState==10}">
							<div onclick="location='review?pCode=${ovo.orderCode}'">구매후기</div>
						</c:if>
					</td>
				</tr>
				</c:forEach>
				
			</table>
			<div class="btn">
				<c:if test="${ovo.orderState<=1}">
					<span onclick="location='state_change?id=${ovo.id}&orderState=4'">취소신청</span>
				</c:if>
				<c:if test="${ovo.orderState==3}">
					<span onclick="location='state_change?id=${ovo.id}&orderState=6'">반품신청</span>
				</c:if>
				<c:if test="${ovo.orderState==3}">
					<span onclick="location='state_change?id=${ovo.id}&orderState=10'">구매확정</span>
				</c:if>
			</div>
		</c:forEach>
	</section>
</body>
</html>