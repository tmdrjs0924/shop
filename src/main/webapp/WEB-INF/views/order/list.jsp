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
        box-sizing: border-box;
      }

      .orderHeader {
        display: flex;
        justify-content: space-between;
        padding: 10px;
      }
      .orderList {
        display: flex;
      }
      .orderList__left {
        flex-grow: 10;
        padding: 10px;
      }
      .orderList__right {
        flex-grow: 2;
        padding: 10px;
      }
      .orderList__left > h2 {
        text-align: center;
      }

      .ordetList__number,
      .ordetList__address,
      .orderList__product {
        display: flex;
        padding: 10px;
      }
      .ordetList__number > div {
        margin: 0 10px;
      }

      .ordetList__address__title {
        flex-grow: 1;
        align-self: center;
        margin: 0 10px;
      }

      .ordetList__address__info {
        flex-grow: 11;
        margin: 0 10px;
      }
      .ordetList__address__info > div {
        padding: 3px;
      }
      .orderList__product > div > img {
        width: 120px;
        height: 120px;
      }

      .orderList__product__img {
        flex-grow: 1;
        align-self: center;
      }
      .orderList__product__name {
        flex-grow: 7;
        align-self: center;
        padding: 3px;
        margin: 3px;
        text-align: center;
      }
      .orderList__product__option {
        flex-grow: 1;
        align-self: center;
        padding: 3px;
        margin: 3px;
        text-align: center;
      }
      .orderList__product__amount {
        flex-grow: 1;
        align-self: center;
        padding: 3px;
        margin: 3px;
        text-align: center;
      }
      .orderList__product__price {
        flex-grow: 2;
        align-self: center;
        padding: 3px;
        margin: 3px;
        text-align: center;
      }

      .orderList__payment,
      .orderList__details {
        padding: 10px;
      }

      .orderList__payment > div,
      .orderList__details > div {
        padding: 5px;
      }
    </style>
  </head>
  <body>
    <section id="orderList">
      <div class="orderHeader">
        <div>주문/결제</div>
        <div>장바구니 / 주문/결제 / 완료</div>
      </div>
      <div class="orderList">
        <div class="orderList__left">
          <h2>주문의 정상적으로 완료되었습니다.</h2>
          <div class="ordetList__number">
            <div>주문번호</div>
            <div>${ovo.orderNumber }</div>
          </div>
          <div class="ordetList__address">
            <div class="ordetList__address__title">배송지정보</div>
            <div class="ordetList__address__info">
              <div>${mvo.name }</div>
              <div>${mvo.phone }</div>
              <div>(${mvo.zip })${mvo.juso } ${mvo.juso_etc }</div>
              <div>배송메시지 ${ovo.orderMessage }</div>
            </div>
          </div>
          
          <c:forEach items="${olist }" var="olist">
          <div class="orderList__product">
            <div class="orderList__product__img">
            	<img src="../resources/pro/${olist.pImg1}" />
            </div>
            <div class="orderList__product__name">
            	${olist.pName }
            </div>
            <div class="orderList__product__option">
            	${olist.orderSize }
            </div>
            <div class="orderList__product__amount">
            	${olist.orderAmount }
            </div>
            <div class="orderList__product__price">
            	${olist.pPrice - (olist.pPrice * olist.pDc / 100) }
            </div>
          </div>
          </c:forEach>
          
        </div>

        <div class="orderList__right">
          <div class="orderList__payment">
            <div>주문금액  ${ovo.orderTotalPrice + ovo.orderTotalDelivery}</div>
            <div>상품금액  ${ovo.orderTotalPrice}</div>
            <div>배송비  ${ovo.orderTotalDelivery }</div>
            <div>쿠폰할인 ${ovo.orderTotalCoupon }</div>
            <div>적립금사용 ${ovo.orderTotalPoint }</div>
            
            
          </div>
          <div class="orderList__details">
            <div>결제상세</div>
            <div>${ovo.orderTotalPayment }</div>
            <div>${ovo.orderPayType }</div>
            <div>${ovo.orderPaySelection }</div>
            <div>${ovo.orderPayInstallment }</div>
            <div>${ovo.orderDate }</div>
          </div>
        </div>
      </div>
    </section>
  </body>
</html>
ml>