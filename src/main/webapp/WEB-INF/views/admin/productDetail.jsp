<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
	function getCate2(cate1Code) {
		var chk = new XMLHttpRequest();
		chk.onload=function() {
			//alert(decodeURI(chk.responseText));
			document.product.cate2.innerHTML=decodeURI(chk.responseText);
		}
		chk.open("get","getcate2?cate1Code="+cate1Code)
		chk.send();
	}
	
	function getCate3(imsi) {
		var cate1Code = document.product.cate1.value;
		var cate2Code = cate1Code+imsi;
		
		//var imsi2 = document.product.cate3.value;
		//var cate3Code = cate2Code+imsi;
		var chk = new XMLHttpRequest();
		chk.onload=function() {
			//alert(decodeURI(chk.responseText));
			document.product.cate3.innerHTML=decodeURI(chk.responseText);
		}
		chk.open("get","getcate3?cate2Code="+cate2Code)
		chk.send();
	}
	
	function getPcode() {
		var c1 = document.product.cate1.value;
		var c2 = document.product.cate2.value;
		var c3 = document.product.cate3.value;
		var imsi = c1+c2+c3;
		var chk = new XMLHttpRequest();
		chk.onload=function()
		   {
			   //alert(chk.responseText);
			  var num=chk.responseText;
			  
			  if(num.length==1)
				  num="00"+num;
			  else if(num.length==2)
			             num="0"+num;
			  
			  document.product.pCode.value="p"+imsi+num;
		   }
		   chk.open("get","getpcode?imsi="+imsi);
		   chk.send();
	}
	

</script>
</head>
<body>
 <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
	<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h1 class="h2">상품 관리</h1>
	</div>
	<h4 class="pt">상품 상세정보</h4>
          
	<div class="container">
	<form method="post" name="product" action="productModify" enctype="multipart/form-data">
		<div class="row">
			<div class="col-2 pb-2">판매상태</div>
			<div class="col">
				<c:if test="${pvo.pState==0}">
					<input type="radio" class="form-check-input" value="0" name="pState" checked>판매함
					<input type="radio" class="form-check-input" value="1" name="pState">판매안함
				</c:if>
				<c:if test="${pvo.pState==1}">
					<input type="radio" class="form-check-input" value="0" name="pState">판매함
					<input type="radio" class="form-check-input" value="1" name="pState" checked>판매안함
				</c:if>
				
				<input type="hidden" name="pCode" value="${pvo.pCode }">
			</div>
		</div>
				
		<div class="row">
			<div class="col-2">상품명</div>
			<div class="col">
				<input class="form-control" type="text" name="pName" value="${pvo.pName }">
			</div>
		</div>
		<div class="row">
			<div class="col-2">가격</div>
			<div class="col">
				<input class="form-control" type="text" name="pPrice" value="${pvo.pPrice }">
			</div>
		</div>
		<div class="row">
			<div class="col-2">할인율</div>
			<div class="col">
				<input class="form-control" type="text" name="pDc" value="${pvo.pDc }">
			</div>
		</div>
		<div class="row">
			<div class="col-2">적립률</div>
			<div class="col">
				<input class="form-control" type="text" name="pMile" value="${pvo.pMile }">
			</div>
		</div>
		<div class="row">
			<div class="col-2">수량</div>
			<div class="col">
				<input class="form-control" type="text" name="pInven" value="${pvo.pInven }">
			</div>
		</div>
		
		<div class="row">
			<div class="col-2">사이즈</div>
			<div class="col">
				<input class="form-control" type="text" name="pSize" value="${pvo.pSize }">
			</div>
		</div>
		
		<div class="row">
			<div class="col-2">대표이미지</div>
			<div class="col">
				<img class="img-thumbnail" src="../resources/pro/${pvo.pImg1 }" width="200" height="200"><br>
				<input type="hidden" name="pImg1" value="${pvo.pImg1 }">
				<a class="btn btn-sm btn-outline-dark">변경</a>
			</div>
		</div>
		<div class="row">
			<div class="col-2">추가이미지</div>
			<div class="col">
				<img class="img-thumbnail" src="../resources/pro/${pvo.pImg2 }" width="200" height="200"><br>
				<input type="hidden" name="pImg2" value="${pvo.pImg2 }">
				<a class="btn btn-sm btn-outline-dark">변경</a>
			</div>
		</div>
		<div class="row">
			<div class="col-2">상세설명</div>
			<div class="col">
				<img class="img-thumbnail" src="../resources/pro/${pvo.pImg3 }" width="30%"><br>
				<input type="hidden" name="pImg3" value="${pvo.pImg3 }">
				<a class="btn btn-sm btn-outline-dark">변경</a>
			</div>
		</div>
		<div class="row text-center">
			<div class="col">
				<input class="btn btn-primary" type="submit" value="상품수정">
			</div>
		</div>
	</form>
	</div>
</main>
</body>
</html>