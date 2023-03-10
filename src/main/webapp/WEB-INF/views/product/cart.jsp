<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/main/main.css" />
<script src="../resources/js/main/main.js"></script>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<style>
		section {
			width:1400px;
			min-height:700px;
			margin:auto;
			margin-top:100px;
		}
		body {
			background:#fffff4;
		}
		section table {
			width:1400px;
			margin:auto;
			background:white;
			border-spacing:0px;
			padding:20px 40px;
			border-radius:20px;
		}
		section table .checkbox {
			width:30px;
			text-align:center;
		}
		section table .all {
			font-size:13px;
			font-weight:600;
			width:200px;
		}
		section table .delete_btn {
			border:1px solid lightgrey;
			border-radius:2px;
			color:grey;
			font-weight:400;
			font-size: 12px;
			line-height:45px;
			padding:5px;
			cursor:pointer;
			margin-left:10px;
		}
		section table .coupon {
			width:250px;
		}
		section table #coupon_btn {
			border:1px solid #2ECC71;
			border-radius:2px;
			color:#2ECC71;
			font-weight:900;
			font-size: 14px;
			padding:5px 10px;
			float:right;
			cursor:pointer;
		}
		section input[type=checkbox] {
			accent-color:black;
		}
		section .first_tr td {
			border-bottom:2px solid black;
			height:50px;
		}
		section .second_tr td {
			border-bottom:1px solid lightgrey;
		}
		section table .name {
			font-weight:700;
			font-size: 15px;
		}
		section table .delete_icon {
			height:18px;
			margin-left:20px;
			opacity:0.3;
			border:1px solid grey;
			cursor:pointer;
		}
		section table .price {
			font-size:12px;
			color:grey;
		}
		section table .dcprice {
			font-size:14px;
			color:black;
			font-weight:600;
		}
		section table .date {
			font-size:14px;
			font-weight:600;
			color:#2ECC71;
		}
		section table .text {
			font-size:13px;
			font-weight:600;
		}
		section table .size {
			font-size:15px;
			font-weight:600;
		}
		section table .change_size {
			border:1px solid lightgrey;
			border-radius:2px;
			color:grey;
			font-weight:400;
			font-size: 12px;
			line-height:45px;
			padding:5px;
			cursor:pointer;
		}
		section table .order_btn1 {
			border:1px solid #2ECC71;
			border-radius:5px;
			color:#2ECC71;
			font-weight:600;
			font-size: 14px;
			line-height:45px;
			padding:5px 10px;
			cursor:pointer;
		}
		section table .order {
			width:250px;
			text-align:center;
		}
		section table .delivery	{
			font-size:13px;
			font-weight:600;
			color:grey;
		}
		section table .amount {
			width:18px;
			height:20px;
			outline:none;
		}
		section table #order_left {
		display:flex;
		justify-content:center;
		align-items:center;
		width:1400px;
		height:150px;
		}
		section table #order_right {
			width:300px;
			margin-left:50px;
		}
		section input[type=submit] {
			font-size:20px;
			background:#2ECC71;
			color:white;
			border-radius:10px;
			width:250px;
			height:50px;
			border:0px;
			cursor:pointer;
		}
		section input[type=submit]:disabled {
			font-size:20px;
			background:silver;
			color:white;
			border-radius:10px;
			width:250px;
			height:50px;
			border:0px;
			cursor:default;
		}
		section table .left_text {
			width:140px;
			font-size:17px;
			font-weight:600;
			text-align:center;
			padding:10px;
		}
		section table .right_text {
			width:200px;
			font-size:19px;
			font-weight:600;
			text-align:center;
			padding:10px;
		}
		section table #plus,
		section table #minus,
		section table #equal {
			width:40px;
			height:40px;
			opacity:0.2;
		}
		section table #total_price,
		section table #total_delivery {
			font-size:18px;
			font-weight:600;
			text-align:center; 
			padding:10px;
		}
		section table #total_dc {
			font-size:18px;
			font-weight:600;
			text-align:center; 
			padding:10px;
			color:red;
		}
		section table #total_pay {
			font-size:19px;
			font-weight:600;
			text-align:center; 
			padding:10px;
			color:#2ECC71;
		}
	</style>
	<script>
		//?????????????????? ??????
		function comma(num) {
			return Intl.NumberFormat().format(num);
		}
		
		//???????????? ??? ??????????????? ?????? ?????? ????????? ????????????,?????????,??????????????? ????????? ?????????
		var Allprice=[${price}];
		var Alldelivery=[${delivery}];
		var Alldc=[${dc}];
		//????????????
		$(function(){
			var test=$(".amount");
			$(".amount").spinner({
				min:1,
				max:99,
				spin:function(event,ui){
					var n=test.index(this);
					var uv=ui.value;
					var id=document.getElementsByClassName("id")[n].value;
					//ajax??? ?????? ?????? ?????? ??? ????????? ???????????? ????????????
					var chk=new XMLHttpRequest();
					chk.onload=function(){
						var some=document.getElementsByClassName("some_select");
						var amount=document.getElementsByClassName("amount");
						var pCode=document.getElementsByClassName("pCode");
						var osize=document.getElementsByClassName("osize");
						var total_price=0;
						var total_delivery=0;
						var total_dc=0;
						var total_pay=0;
						var total_code="";
						var total_amount="";
						var total_osize="";
						var total_amount2=0;
						
						//????????? ????????? ????????? ??? ???????????? ????????? ??????
						for(i=0;i<some.length;i++){
							if(some[i].checked){
								total_price=total_price+parseInt(Allprice[i])*amount[i].value;
								total_delivery=total_delivery+parseInt(Alldelivery[i]);
								total_dc=total_dc+parseInt(Alldc[i])*amount[i].value;
								total_amount=total_amount+amount[i].value+",";
								total_amount2=total_amount2+parseInt(amount[i].value);
							}
						}
						document.getElementById("total_price").innerText=comma(total_price)+"???";
						document.getElementById("total_delivery").innerText=comma(total_delivery)+"???";
						document.getElementById("total_dc").innerText=comma(total_dc)+"???";
						document.getElementById("total_pay").innerText=comma(total_price+total_delivery-total_dc)+"???";
						document.getElementById("total_amount").value=total_amount;
						
						//??????????????? ??????
						document.cform.total_price.value=total_price+total_delivery-total_dc;
						document.cform.total_delivery.value=total_delivery;
						document.cform.total_amount2.value=total_amount2;
					}
					chk.open("get","update_amount?amount="+uv+"&id="+id);
					chk.send();
				}
			});
		});
		
		//???????????? ??? => ???????????? ?????? ??????
		function all_select(my){
			var some=document.getElementsByClassName("some_select");
			var amount=document.getElementsByClassName("amount");
			var osize=document.getElementsByClassName("osize");
			var id=document.getElementsByClassName("id");
			var pCode=document.getElementsByClassName("pCode");
			var total_price=0;
			var total_delivery=0;
			var total_dc=0;
			var total_pay=0;
			var total_id="";
			var total_code="";
			var total_amount="";
			var total_amount2=0;
			var total_osize="";
			if(my.checked){
				for(i=0;i<some.length;i++){
					some[i].checked=true;
					//????????? ????????? ????????????,?????????,??????????????? ??? ??? ??????+id/pcode
					total_price=total_price+parseInt(Allprice[i])*amount[i].value;
					total_delivery=total_delivery+parseInt(Alldelivery[i]);
					total_dc=total_dc+parseInt(Alldc[i])*amount[i].value;
					total_id=total_id+id[i].value+",";
					total_code=total_code+pCode[i].value+",";
					total_amount=total_amount+amount[i].value+",";
					total_amount2=total_amount2+parseInt(amount[i].value);
					total_osize=total_osize+osize[i].value+",";
				}
			}
			else{
				for(i=0;i<some.length;i++){
					some[i].checked=false;
				}
			}
			//??? ?????? ????????? ??????
			document.getElementById("total_price").innerText=comma(total_price)+"???";
			document.getElementById("total_delivery").innerText=comma(total_delivery)+"???";
			document.getElementById("total_dc").innerText=comma(total_dc)+"???";
			document.getElementById("total_pay").innerText=comma(total_price+total_delivery-total_dc)+"???";
			document.getElementById("total_id").value=total_id;
			document.getElementById("total_code").value=total_code;
			document.getElementById("total_amount").value=total_amount;
			document.getElementById("total_size").value=total_osize;
			
			//??????????????? ??????
			document.cform.total_price.value=total_price+total_delivery-total_dc;
			document.cform.total_delivery.value=total_delivery;
			document.cform.total_amount2.value=total_amount2;
			
			//????????? ???????????? ???????????? ???????????? ?????? ?????????
			var n=0;
			for(i=0;i<some.length;i++){
				if(some[i].checked){
					n++;
				}
			}
			if(n==0){
				document.cform.submit.disabled=true;
			}
			else{
				document.cform.submit.disabled=false;
			}
		}
		
		//???????????? ?????? ?????? ??? => ???????????? ??????
		function some_select(){
			var some=document.getElementsByClassName("some_select")
			var all=document.getElementsByClassName("all_select");
			var amount=document.getElementsByClassName("amount");
			var osize=document.getElementsByClassName("osize");
			var id=document.getElementsByClassName("id");
			var pCode=document.getElementsByClassName("pCode");
			var n=0;
			//????????? ????????? n????????? ???????????? ??????
			for(i=0;i<some.length;i++){
				if(some[i].checked)
					n++;
			}
			//????????? ???????????? ???????????? ???????????? ?????? ?????????
			if(n==0){
				document.cform.submit.disabled=true;
			}
			else{
				document.cform.submit.disabled=false;
			}
			
			//???????????? ?????? => ???????????? ???????????? ?????????
			if(some.length==n)
				all[0].checked=true;
			else
				all[0].checked=false;
			var total_price=0;
			var total_delivery=0;
			var total_dc=0;
			var total_pay=0;
			var total_id="";
			var total_code="";
			var total_amount="";
			var total_amount2=0;
			var total_osize="";
			for(i=0;i<some.length;i++){
				if(some[i].checked){
					total_price=total_price+parseInt(Allprice[i])*amount[i].value;
					total_delivery=total_delivery+parseInt(Alldelivery[i]);
					total_dc=total_dc+parseInt(Alldc[i])*amount[i].value;
					total_id=total_id+id[i].value+",";
					total_code=total_code+pCode[i].value+",";
					total_amount=total_amount+amount[i].value+",";
					total_amount2=total_amount2+parseInt(amount[i].value);
					total_osize=total_osize+osize[i].value+",";
				}
			}
			document.getElementById("total_price").innerText=comma(total_price)+"???";
			document.getElementById("total_delivery").innerText=comma(total_delivery)+"???";
			document.getElementById("total_dc").innerText=comma(total_dc)+"???";
			document.getElementById("total_pay").innerText=comma(total_price+total_delivery-total_dc)+"???";
			document.getElementById("total_id").value=total_id;
			document.getElementById("total_code").value=total_code;
			document.getElementById("total_amount").value=total_amount;
			document.getElementById("total_size").value=total_osize;
			
			//??????????????? ??????
			document.cform.total_price.value=total_price+total_delivery-total_dc;
			document.cform.total_delivery.value=total_delivery;
			document.cform.total_amount2.value=total_amount2;
			
		}
		//????????????
		function delete_cart(){
			var chk=new XMLHttpRequest();
			var id=document.getElementById("total_id").value;
			chk.onload=function(){
				location.reload();
			}
			chk.open("get",	"delete_cart?id="+id);
			chk.send();
		}
		
		//??????????????????
		function order(n){
			var size=document.cform.total_size.value=document.getElementsByClassName("osize")[n].value;
			var amount=document.cform.total_amount.value=document.getElementsByClassName("amount")[n].value;
			var code=document.cform.total_code.value=document.getElementsByClassName("pCode")[n].value;
			if(size.length==0){
				alert("???????????? ???????????????");
				false;
			}
			else
				location="../order/order?total_code="+code+"&total_amount="+amount+"&total_size="+size;
		}
		//onsubmit check()
		function check(){
			var some=document.getElementsByClassName("some_select");
			var size=document.getElementsByClassName("osize");
			for(i=0;i<some.length;i++){
				if(size[i].value.length==0){
					alert("???????????? ???????????????");
					return false;
				}
			}
		}
	</script>
</head>
<body>
	<section>
		<form name="cform" method="post" action="../order/order" onsubmit="return check()">
			<input type="hidden" id="total_id">
			<input type="hidden" name="total_code" id="total_code">
			<input type="hidden" name="total_amount" id="total_amount">
			<input type="hidden" name="total_size" id="total_size">
			<input type="hidden" name="total_delivery">
			<input type="hidden" name="total_price">
			<input type="hidden" name="total_amount2">
			<table>
				<tr class="first_tr">
					<td class="checkbox"><input type="checkbox" class="all_select" onclick="all_select(this)"></td>
					<td colspan="4" class="all">???????????? <span class="delete_btn" onclick="delete_cart()">????????????</span></td>
					<td><span id="coupon_btn">????????????</span></td>
				</tr>
				
				<c:if test="${empty clist}">
				<tr>
					<td colspan="6" style="font-size:18px;font-weight:900;text-align:center;border-bottom:1px solid lightgrey;padding:40px 0;">
						??????????????? ???????????????. ???????????? ????????? ???????????????.
					</td>
				</tr>	
				</c:if>
				<c:if test="${!empty clist}">
				<c:forEach items="${clist}" var="cvo" varStatus="sts">
				<input type="hidden" class="id" value="${cvo.id}">
				<input type="hidden" class="pCode" value="${cvo.pCode}">
				<input type="hidden" class="osize" value="${cvo.size}">

				<tr class="second_tr">
					<td class="checkbox"><input type="checkbox" class="some_select" onclick="some_select()"></td>
					<td align="center"><img src="../resources/pro/${cvo.pImg1}" width="150" height="150"></td>
					<td width="450">
						<div class="name">
							${cvo.pName}
							<ion-icon name="close-outline" class="delete_icon" onclick="location='delete_cart?id=${cvo.id}'"></ion-icon>
						</div>
						<div>
							<span class="price"><s><fmt:formatNumber value="${cvo.pPrice}" type="number"/></s></span>
							<span class="dcprice"><fmt:formatNumber value="${cvo.pPrice-(cvo.pPrice*cvo.pDc/100)}" type="number" pattern="#,###"/>???</span>
						</div>
						<div><span class="date">${cvo.mm}.${cvo.dd}.(${cvo.day})</span> <span class="text">????????????</span></div>
					</td>
					<td width="230">
						<div class="size">option: size(${cvo.size})</div>
						<div>
							<c:if test="${cvo.size=='OneSize'}">
							</c:if>
							<c:if test="${cvo.size!='OneSize'}">
								<span class="change_size" onclick="open('change_size?id=${cvo.id}&index=${sts.index}','_blank','width=600,height=400')">????????????</span>
							</c:if>
						</div>
					</td>
					<td width="220" align="center">
						<input type="text" id="spinner" class="amount" name="amount" value="${cvo.amount}" readonly/>
					</td>
					<td class="order">
						<div><span class="order_btn1" onclick="order(${sts.index})">????????????</span></div>
						<div class="delivery">
							<c:if test="${cvo.pDelivery==0}">
								????????????
							</c:if>
							<c:if test="${cvo.pDelivery!=0}">
								????????? <fmt:formatNumber value="${cvo.pDelivery}" type="number" pattern="#,###"/>???
							</c:if>
						</div>	
					</td>
				</tr>
	
				</c:forEach>
				</c:if>
	
				<tr>
					<td colspan="6">
						<div id="order_left">
							<div>
								<div class="left_text">??????????????????</div>
								<div id="total_price">0???</div>
							</div>
							<div>
								<ion-icon name="add-outline" id="plus"></ion-icon>
							</div>
							<div>
								<div class="left_text">??? ?????????</div>
								<div id="total_delivery">0???</div>
							</div>
							<div>
								<ion-icon name="remove-outline" id="minus"></ion-icon>
							</div>
							<div>
								<div class="left_text">??????????????????</div>
								<div id="total_dc">0???</div>
							</div>
							<div>
								<ion-icon name="reorder-two-outline" id="equal"></ion-icon>
							</div>
							<div>
								<div class="right_text">??? ????????????</div>
								<div id="total_pay">0???</div>
							</div>
							<div id="order_right"><input type="submit" name="submit" value="??????????????????" disabled></div>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</section>
</body>
</html>