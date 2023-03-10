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
			width:1100px;
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
			width:1100px;
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
			text-align:center;
		}
		section .title .btn {
			margin-left:400px;
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
			width:200px;
			text-align:center;
		}
		section .content .center{
			text-indent:10px;
		}
		section .title .btn span {
			margin:auto;
			padding:5px 7px;
			color:blue;
			border:2px solid blue;
			border-radius:5px;
			background:white;
			font-size:13px;
			font-weight:900;
			cursor:pointer;
			opacity:0.8;
		}
		section .content .img {
			width:160px;
			height:160px;
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
	</style>
</head>
<body>
	<section>
		<table id="history">
			<c:forEach items="${olist}" var="ovo" varStatus="sts">
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
				<c:if test="${!empty ovo.orderNumber}">
				<tr class="title">
					<th colspan="2" class="left">
						주문번호(${ovo.orderNumber}) - ${state}
						<span class="detail" onclick="location='order_detail?orderNumber=${orderNumber}'">주문상세 ></span>
						<span class="btn">
							<c:if test="${ovo.orderState<=1}">
								<span onclick="location='state_change?id=${ovo.id}&orderState=4'">취소신청</span>
							</c:if>
							<c:if test="${ovo.orderState==4}">
								<span>취소대기</span>
							</c:if>
							<c:if test="${ovo.orderState==3}">
								<span onclick="location='state_change?id=${ovo.id}&orderState=6'">반품신청</span>
							</c:if>
							<c:if test="${ovo.orderState==6}">
								<span>반품대기</span>
							</c:if>
							<c:if test="${ovo.orderState==3}">
								<span onclick="location='state_change?id=${ovo.id}&orderState=10'">구매확정</span>
							</c:if>
						</span>
					</th>
					<th class="right">구매일 ${ovo.orderDate}</th>
				</tr>
				</c:if>
				<tr class="content">
					<td class="left"><img src="../resources/pro/${ovo.pImg1}" class="img"></td>
					<td class="center">
						${ovo.pName} /
						<fmt:formatNumber value="${ovo.pPrice-ovo.pPrice*ovo.pDc/100}" pattern="#,###"/>원 /
						수량:${ovo.orderAmount}개 /
						size-${ovo.orderSize}
					</td>
					<td class="right">
						<c:if test="${ovo.orderState==10}">
							<div onclick="location='review?pCode=${ovo.orderCode}'">구매후기</div>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
	</section>
</body>
</html>