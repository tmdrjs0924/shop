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
		cc.innerText = '????????????';
	}

	function orderCredit2() {
		const c1 = document.querySelector(".order__credit__1");
		const c2 = document.querySelector(".order__credit__2");
		const c3 = document.querySelector(".order__credit__3");
		const cc = document.querySelector(".credit");
		
		c1.style.display = 'none';
		c2.style.display = 'block';
		c3.style.display = 'none';
		cc.innerText = '?????????';
	}

	function orderCredit3() {
		const c1 = document.querySelector(".order__credit__1");
		const c2 = document.querySelector(".order__credit__2");
		const c3 = document.querySelector(".order__credit__3");
		const cc = document.querySelector(".credit");
		
		c1.style.display = 'none';
		c2.style.display = 'none';
		c3.style.display = 'block';
		cc.innerText = '???????????????';
	}



function pointCheck(my) {
	if(my > ${mvo.point }) {
		alert('???????????? ?????? ???????????? ???????????? ????????????.');
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
	const number2 = number.replace("???","");
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
				<div>??????/??????</div>
				<div>???????????? > ??????/?????? > ??????</div>
			</div>

			<div class="order__product">
				<table>
					<thead>
						<tr>
							<th>??????</th>
							<th>????????????</th>
							<th>??????</th>
							<th>?????????</th>
							<th>??????</th>
							<th>??????</th>
							<th>????????????</th>
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
										<c:if test="${olist.pDelivery==0 }">????????????</c:if>
										<c:if test="${olist.pDelivery!=0 }">
											<fmt:formatNumber value="${olist.pDelivery }" pattern="#,###" />???
	            		</c:if>
									</div></td>
								<td><div class="order__product__inven">${olist.orderAmount }</div></td>
								<td><div class="order__product__dc">
										<fmt:formatNumber
											value="${olist.pPrice * olist.pDc /100 * olist.orderAmount}"
											pattern="#,###" />
										???
									</div></td>
								<td>
									<div class="order__product__price">
										<fmt:formatNumber value="${olist.pPrice * olist.orderAmount}"
											pattern="#,###" />
										???
									</div>
									<div class="order__product__dcprice">
										<fmt:formatNumber
											value="${(olist.pPrice - (olist.pPrice * olist.pDc /100))*olist.orderAmount }"
											pattern="#,###" />
										???
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
						<h3>????????? ??????</h3>
						<div class="order__left__sub">
							<div>????????? ??????</div>
							<div>
								<div>
									<input type="radio" name="orderAddressId" value="0" checked />??????????????? <input
										type="radio" name="orderAddressId" value="1" />???????????????
									<span class="btn-sm">????????????</span>
								</div>
								
							</div>
						</div>
						<div class="order__left__name">???????????? : ${mvo.name }</div>
						<div class="order__left__phone">???????????? : 
							${mvo.phone }
						</div>
						<div>?????? : (${mvo.zip })${mvo.juso } ${mvo.juso_etc }</div>

						<div>
							<span> <select name="orderMessage">
									<option value="0">?????? ???????????? ??????????????????</option>
									<option value="1">?????? ?????? ????????? ??? ???</option>
									<option value="2">???????????? ?????? ?????????</option>
									<option value="3">???????????? ?????? ?????????</option>
									<option value="4">????????????</option>
							</select>
							</span> 
						</div>
						<div>???????????? ????????? ?????? ?????? ????????? ?????? ???????????? ????????? ??? ????????????.</div>
					</div>
					<div class="order__enuri">
						<h3>?????? ??? ?????????</h3>
						<div>?????? ??????</div>
						<div>
							<span class="btn-sm">????????????</span>
						</div>
						<div>????????? ??????</div>
						<div>
							?????? : 
							<input type="text" class="possessionPoints" name="possessionPoints" value="<fmt:formatNumber value='${mvo.point }' pattern='#,###' />" disabled />
						</div>
						<div>
							?????? : <input type="number" name="usePoint" id="usePoint" min='0' max='${mvo.point }' onchange='pointCheck(this.value)'> ???
							<span class="btn-sm" onclick="pointCancel()">??????</span>
							<input name="pointAllin" type="checkbox" onclick='allIn(this)'/>?????? ??????
						</div>
					</div>
					<div class="order__credit">
						<h3>????????????</h3>
						<div>
							<span><input type="radio" name="orderPayType" value="0" onclick='orderCredit1()'checked />????????????</span>
							<span><input type="radio" name="orderPayType" value="1" onclick='orderCredit2()'/>?????????</span>
							<span><input type="radio" name="orderPayType" value="2" onclick='orderCredit3()' />???????????????</span>
						</div>

						<div class="order__credit__1">
							<div>
								???????????? <select name="orderPaySelection" >
									<option value="0">??????????????????</option>
									<option value="1">????????????</option>
									<option value="2">????????????</option>
									<option value="3">????????????</option>
									<option value="4">????????????</option>
									<option value="5">????????????</option>
									<option value="6">????????????</option>
									<option value="7">????????????</option>
									<option value="8">BC??????</option>
								</select>
							</div>
							<div>
								???????????? <select name="orderPayInstallment">
									<option value="0">?????????</option>
									<option value="1">1??????</option>
									<option value="2">2??????</option>
									<option value="3">3??????</option>
									<option value="4">4??????</option>
									<option value="5">5??????</option>
									<option value="6">6??????</option>
									<option value="7">7??????</option>
									<option value="8">8??????</option>
									<option value="9">9??????</option>
									<option value="10">10??????</option>
									<option value="11">11??????</option>
									<option value="12">12??????</option>
								</select>
							</div>
						</div>

						<div class="order__credit__2" >
							<div>
								??????????????? <select name="orderPaySelection2">
									<option value="0">??????????????????</option>
									<option value="1">SKT</option>
									<option value="2">KT</option>
									<option value="3">LGU</option>
									<option value="4">?????????</option>
								</select>
							</div>
							<div>
								 <input type="text" name="orderPayInstallment2" placeholder="????????? ??????" value="0">
							</div>
						</div>
						
						<div class="order__credit__3" >
							<div>
								???????????? <select name="orderPaySelection3">
									<option value="0">??????????????????</option>
									<option value="1">??????</option>
									<option value="2">??????</option>
									<option value="3">??????</option>
									<option value="4">??????</option>
									<option value="5">???????????????</option>
									<option value="6">????????????</option>
								</select>
							</div>
							<div>
								<input type="text" name="orderPayInstallment3" placeholder="?????????" value="0">
							</div>
						</div>						


					</div> <!-- order__credit ??? -->

					<div class="order__point">
						<h3>????????? ??????</h3>
						<div>
							<c:set var="totalPoint"/>
							<c:forEach items="${olist }" var="result" varStatus="status">
							<c:set var="totalPoint" value="${totalPoint + ((result.pPrice - (result.pPrice * result.pDc /100))*result.orderAmount) *result.pMile/100 }"/>	
							</c:forEach>
							???????????? : <fmt:formatNumber value="${totalPoint }" pattern="#,###" />
							<input type="hidden" name="orderMileage" value="<fmt:formatNumber value='${totalPoint}' pattern="####"/>">
 						</div>
					</div>
					<div class="order__privacy">
						<div>???????????? ?????? ?????? ????????????</div>
					</div>
				</div>

				<div class="order__right">
					<div class="order__info">
						<h3>????????? ??????</h3>
						<div>${mvo.name }</div>
						<div>${mvo.phone }
							<span class="btn-sm">??????</span>
						</div>
						<div>${mvo.email }<span class="btn-sm">??????</span>
						</div>
						<div>????????? ????????? ???????????? ????????? ???????????????.</div>
					</div>
					<div class="order__info2">
						<h3>????????????</h3>
						<div>????????????</div>
						<div>
							???????????? :
							<input type="text" name="orderTotalPrice" value="${total_price }" readonly>
						</div>
						<div>
							???????????? : 
							<input type="text" name="orderTotalAmount" value="${total_amount2 }" readonly>
						</div>
						<div>
							????????? :
							<input type="text" name="orderTotalDelivery" value="${total_delivery}"readonly>
						</div>
						<div>
							????????????:
							<input type="text" name="orderTotalCoupon" value="0" readonly>
						</div>
						<div>
							??????????????? :
							<input type="text" name="orderTotalPoint" value="0" readonly>
						</div>
						<div>
							<span class="credit">????????????</span>
							<input type="text" name="orderTotalPayment" value="${total_price + total_delivery }" readonly>
						</div>
					</div>
				</div>
			</div>
			<div class="order__agreement">?????? ????????? ??????????????????, ?????? ?????? ?????? ???????????????.</div>
			<div class="order__submit">
				<input type="hidden" name="orderNumber" value="test">
				<input type="hidden" name="orderUserid" value="${userid }">
				<input class="btn" type="submit" value="????????????" />
			</div>
		</form>
	</section>
</body>
</html>
