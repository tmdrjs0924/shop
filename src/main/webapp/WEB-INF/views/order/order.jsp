<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>

<style>
body {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	background-color: #eeeeee;
}

.btn {
	background-color: #000000;
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	width: 350px;
}

.btn-sm {
	border: 1px solid black;
	color: black;
	padding: 2px 1px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 12px;
	width: 50px;
}


#order {
	max-width: 1400px;
	margin: auto;
}

.order__top {
	display: flex;
	justify-content: space-between;
	padding: 20px;
}

.order__product {
	padding: 10px;
	border-top: 2px solid black;
	border-bottom: 2px solid black;
	background-color: white;
}

.order__product>table {
	width: 100%;
}

.order__product td {
	text-align: center;
}

.order__product__img>img {
	width: 100px;
	height: 100px;
	border-radius: 50%;
}

.order__product__price {
	text-decoration: line-through;
}

.order__product__dcprice {
	font-weight: bold;
}

.order__left {
	flex-grow: 10;
	padding: 10px;
	margin: 10px;
}

.order__right {
	flex-grow: 2;
	padding: 10px;
	margin: 10px;
}

.order__detail {
	display: flex;
	justify-content: space-between;
	padding-top: 50px;
}

.order__delivery, .order__enuri, .order__credit, .order__point,
	.order__privacy {
	border: 1px solid black;
	padding-bottom: 10px;
}

.order__info, .order__info2 {
	border: 1px solid black;
	padding-bottom: 10px;
}

.order__credit, .order__point, .order__privacy {
	background-color: white;
}

.order__privacy {
	padding-top: 10px;
}

.order__agreement {
	text-align: center;
	padding-top: 20px;
	padding-bottom: 20px;
}

.order__submit {
	text-align: center;
	padding: 10px;
}

.order__credit__2 {
display: none;
}

.order__credit__3 {
display: none;
}
</style>

<script>

	
	function orderCredit1() {
		const c1 = document.querySelector(".order__credit__1");
		const c2 = document.querySelector(".order__credit__2");
		const c3 = document.querySelector(".order__credit__3");
		const cc = document.querySelector(".credit");
			    
		c1.style.display = 'block';
		c2.style.display = 'none';
		c3.style.display = 'none';
		cc.innerText = '신용카드';
	}

	function orderCredit2() {
		const c1 = document.querySelector(".order__credit__1");
		const c2 = document.querySelector(".order__credit__2");
		const c3 = document.querySelector(".order__credit__3");
		const cc = document.querySelector(".credit");
		
		c1.style.display = 'none';
		c2.style.display = 'block';
		c3.style.display = 'none';
		cc.innerText = '휴대폰';
	}

	function orderCredit3() {
		const c1 = document.querySelector(".order__credit__1");
		const c2 = document.querySelector(".order__credit__2");
		const c3 = document.querySelector(".order__credit__3");
		const cc = document.querySelector(".credit");
		
		c1.style.display = 'none';
		c2.style.display = 'none';
		c3.style.display = 'block';
		cc.innerText = '무통장입금';
	}



function pointCheck(my) {
	if(my > ${mvo.point }) {
		alert('보유중인 최대 포인트를 초과할수 없습니다.');
		document.querySelector('#usePoint').value = ${mvo.point };
	}
	
	if(my < 0) {
		document.querySelector('#usePoint').value = 0;
	}
	
	if(!my) {
		document.querySelector('#usePoint').value = 0;
	}
		
	
	document.querySelector("input[name='orderTotalPoint']").value = document.querySelector('#usePoint').value; 
	geTotalPayment();
}

function getNumber(num) {
	const number = num.replace(",", "");
	const number2 = number.replace("원","");
	return parseInt(number2);
}

function geTotalPayment(){
	const totalPrice = getNumber(document.querySelector("input[name='orderTotalPrice']").value);
	
	let usePoint;
		if(!usePoint){
			usePoint = 0;
		}
		else {
			usePoint = getNumber(document.querySelector('#usePoint').value);
		} 
		
	const totalPoint = getNumber(document.querySelector("input[name='orderTotalPoint']").value);
	const totalDelivery = getNumber(document.querySelector("input[name='orderTotalDelivery']").value);
	const totalCoupon = getNumber(document.querySelector("input[name='orderTotalCoupon']").value);
	document.querySelector("input[name='orderTotalPayment']").value = parseInt(totalPrice-totalPoint-totalCoupon+totalDelivery);
	
	
}


function allIn(my) {
	if (my.checked) {
		document.querySelector('#usePoint').value = ${mvo.point };
		document.querySelector("input[name='orderTotalPoint']").value = document.querySelector('#usePoint').value;
		geTotalPayment();
	}
	else{
		document.querySelector('#usePoint').value = '0';
		document.querySelector("input[name='orderTotalPoint']").value = document.querySelector('#usePoint').value;
		geTotalPayment();
	} 
}

function pointCancel(){
	document.querySelector('#usePoint').value = 0;
	document.querySelector("input[name='orderTotalPoint']").value = document.querySelector('#usePoint').value;
	document.querySelector("input[name='pointAllin']").checked=false;
	geTotalPayment();
}


</script>

</head>
<body>

	<section id="order">
		<form method="post" action="../order/orderAction" name="orderForm">
			<div class="order__top">
				<div>주문/결제</div>
				<div>장바구니 > 주문/결제 > 완료</div>
			</div>

			<div class="order__product">
				<table>
					<thead>
						<tr>
							<th>상품</th>
							<th>상품이름</th>
							<th>옵션</th>
							<th>배송비</th>
							<th>수량</th>
							<th>할인</th>
							<th>상품금액</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${olist }" var="olist">
						<input type="hidden" name="orderSize" value="${olist.orderSize }">
						<input type="hidden" name="orderAmount" value="${olist.orderAmount }">
						<input type="hidden" name="orderCode" value="${olist.orderCode }">
						
							<tr>
								<td>
									<div class="order__product__img">
										<img src="../resources/pro/${olist.pImg1 }" />
									</div>
								</td>
								<td><div class="order__product__title">${olist.pName }</div></td>
								<td><div class="order__product__option">
										${olist.orderSize }
									</div>
								</td>
								<td><div class="order__product__delivery">
										<c:if test="${olist.pDelivery==0 }">무료배송</c:if>
										<c:if test="${olist.pDelivery!=0 }">
											<fmt:formatNumber value="${olist.pDelivery }" pattern="#,###" />원
	            		</c:if>
									</div></td>
								<td><div class="order__product__inven">${olist.orderAmount }</div></td>
								<td><div class="order__product__dc">
										<fmt:formatNumber
											value="${olist.pPrice * olist.pDc /100 * olist.orderAmount}"
											pattern="#,###" />
										원
									</div></td>
								<td>
									<div class="order__product__price">
										<fmt:formatNumber value="${olist.pPrice * olist.orderAmount}"
											pattern="#,###" />
										원
									</div>
									<div class="order__product__dcprice">
										<fmt:formatNumber
											value="${(olist.pPrice - (olist.pPrice * olist.pDc /100))*olist.orderAmount }"
											pattern="#,###" />
										원
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>


			<div class="order__detail">
				<div class="order__left">
					<div class="order__delivery">
						<h3>배송지 정보</h3>
						<div class="order__left__sub">
							<div>배송지 선택</div>
							<div>
								<div>
									<input type="radio" name="orderAddressId" value="0" checked />기본배송지 <input
										type="radio" name="orderAddressId" value="1" />신규배송지
									<span class="btn-sm">주소목록</span>
								</div>
								
							</div>
						</div>
						<div class="order__left__name">받는사람 : ${mvo.name }</div>
						<div class="order__left__phone">전화번호 : 
							${mvo.phone }
						</div>
						<div>주소 : (${mvo.zip })${mvo.juso } ${mvo.juso_etc }</div>

						<div>
							<span> <select name="orderMessage">
									<option value="0">배송 메시지를 선택해주세요</option>
									<option value="1">직접 받고 부재시 문 앞</option>
									<option value="2">경비실에 맡겨 주세요</option>
									<option value="3">택배함에 맡겨 주세요</option>
									<option value="4">직접입력</option>
							</select>
							</span> 
						</div>
						<div>도서산간 지역의 경우 추후 수령시 추가 배송비가 과금될 수 있습니다.</div>
					</div>
					<div class="order__enuri">
						<h3>할인 및 포인트</h3>
						<div>쿠폰 할인</div>
						<div>
							<span class="btn-sm">쿠폰사용</span>
						</div>
						<div>적립금 사용</div>
						<div>
							보유 : 
							<input type="text" class="possessionPoints" name="possessionPoints" value="<fmt:formatNumber value='${mvo.point }' pattern='#,###' />" disabled />
						</div>
						<div>
							사용 : <input type="number" name="usePoint" id="usePoint" min='0' max='${mvo.point }' onchange='pointCheck(this.value)'> 원
							<span class="btn-sm" onclick="pointCancel()">취소</span>
							<input name="pointAllin" type="checkbox" onclick='allIn(this)'/>전액 사용
						</div>
					</div>
					<div class="order__credit">
						<h3>결제수단</h3>
						<div>
							<span><input type="radio" name="orderPayType" value="0" onclick='orderCredit1()'checked />신용카드</span>
							<span><input type="radio" name="orderPayType" value="1" onclick='orderCredit2()'/>휴대폰</span>
							<span><input type="radio" name="orderPayType" value="2" onclick='orderCredit3()' />무통장입금</span>
						</div>

						<div class="order__credit__1">
							<div>
								카드선택 <select name="orderPaySelection" >
									<option value="0">선택해주세요</option>
									<option value="1">국민카드</option>
									<option value="2">신한카드</option>
									<option value="3">우리카드</option>
									<option value="4">하나카드</option>
									<option value="5">현대카드</option>
									<option value="6">삼성카드</option>
									<option value="7">롯데카드</option>
									<option value="8">BC카드</option>
								</select>
							</div>
							<div>
								할부기간 <select name="orderPayInstallment">
									<option value="0">일시불</option>
									<option value="1">1개월</option>
									<option value="2">2개월</option>
									<option value="3">3개월</option>
									<option value="4">4개월</option>
									<option value="5">5개월</option>
									<option value="6">6개월</option>
									<option value="7">7개월</option>
									<option value="8">8개월</option>
									<option value="9">9개월</option>
									<option value="10">10개월</option>
									<option value="11">11개월</option>
									<option value="12">12개월</option>
								</select>
							</div>
						</div>

						<div class="order__credit__2" >
							<div>
								통신사선택 <select name="orderPaySelection2">
									<option value="0">선택해주세요</option>
									<option value="1">SKT</option>
									<option value="2">KT</option>
									<option value="3">LGU</option>
									<option value="4">알뜰폰</option>
								</select>
							</div>
							<div>
								 <input type="text" name="orderPayInstallment2" placeholder="휴대폰 번호" value="0">
							</div>
						</div>
						
						<div class="order__credit__3" >
							<div>
								은행선택 <select name="orderPaySelection3">
									<option value="0">선택해주세요</option>
									<option value="1">국민</option>
									<option value="2">신한</option>
									<option value="3">우리</option>
									<option value="4">하나</option>
									<option value="5">카카오뱅크</option>
									<option value="6">토스뱅크</option>
								</select>
							</div>
							<div>
								<input type="text" name="orderPayInstallment3" placeholder="예금주" value="0">
							</div>
						</div>						


					</div> <!-- order__credit 끝 -->

					<div class="order__point">
						<h3>적립금 혜택</h3>
						<div>
							<c:set var="totalPoint"/>
							<c:forEach items="${olist }" var="result" varStatus="status">
							<c:set var="totalPoint" value="${totalPoint + ((result.pPrice - (result.pPrice * result.pDc /100))*result.orderAmount) *result.pMile/100 }"/>	
							</c:forEach>
							구매적립 : <fmt:formatNumber value="${totalPoint }" pattern="#,###" />
							<input type="hidden" name="orderMileage" value="<fmt:formatNumber value='${totalPoint}' pattern="####"/>">
 						</div>
					</div>
					<div class="order__privacy">
						<div>개인정보 제공 동의 상세보기</div>
					</div>
				</div>

				<div class="order__right">
					<div class="order__info">
						<h3>주문자 정보</h3>
						<div>${mvo.name }</div>
						<div>${mvo.phone }
							<span class="btn-sm">수정</span>
						</div>
						<div>${mvo.email }<span class="btn-sm">수정</span>
						</div>
						<div>주문자 정보로 결제관련 정보가 제공됩니다.</div>
					</div>
					<div class="order__info2">
						<h3>결제상세</h3>
						<div>주문금액</div>
						<div>
							상품금액 :
							<input type="text" name="orderTotalPrice" value="${total_price }" readonly>
						</div>
						<div>
							상품수량 : 
							<input type="text" name="orderTotalAmount" value="${total_amount2 }" readonly>
						</div>
						<div>
							배송비 :
							<input type="text" name="orderTotalDelivery" value="${total_delivery}"readonly>
						</div>
						<div>
							쿠폰할인:
							<input type="text" name="orderTotalCoupon" value="0" readonly>
						</div>
						<div>
							적립금사용 :
							<input type="text" name="orderTotalPoint" value="0" readonly>
						</div>
						<div>
							<span class="credit">신용카드</span>
							<input type="text" name="orderTotalPayment" value="${total_price + total_delivery }" readonly>
						</div>
					</div>
				</div>
			</div>
			<div class="order__agreement">주문 내용을 확인하였으며, 정보 제공 등에 동의합니다.</div>
			<div class="order__submit">
				<input type="hidden" name="orderNumber" value="test">
				<input type="hidden" name="orderUserid" value="${userid }">
				<input class="btn" type="submit" value="결제하기" />
			</div>
		</form>
	</section>
</body>
</html>
