<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
a {
	text-decoration: none;
	color: black;
}
	
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>

	$(document).ready(function () {
	let searchForm = $('#searchForm');
	let moveForm = $('#moveForm');
	
	
		/* 상품 검색 버튼 동작 */
		$("#searchForm button").on("click", function(e){
			
			e.preventDefault();
			
			/* 검색 키워드 유효성 검사
			if(!searchForm.find("input[name='keyword']").val()){
				alert("키워드를 입력하십시오");
				return false;
			} */
			
			searchForm.find("input[name='pageNum']").val("1");
			
			searchForm.submit();
			
		});
		
		/* 페이지 이동 버튼 */
		$(".pageMaker_btn a").on("click", function(e){
			
			e.preventDefault();
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.submit();
			
		});
	});
	
	   function maincheck(my)
	   {
		   //alert(my.checked);
		   var csub=document.getElementsByClassName("csub");
		   //alert(csub.length);
		   
		   var len=csub.length; // 상품의 갯수
		   
		   if(my.checked) // true, false
		   {
			   // 체크가 되었다면 => 상품의 체크박스에 전부 체크
			   for(i=0;i<len;i++)
			   {
				   csub[i].checked=true;
			   } 	   
			   // 전체선택 체크박스도 체크
			   document.getElementById("up").checked=true;
		   }	
		   else
		   {
			   // 체크가 안되었다면 => 상품의 체크박스에 전부 해제
			   for(i=0;i<len;i++)
			   {
				   csub[i].checked=false;
			   } 	   
			   // 전체선택 체크박스도 체크
			   document.getElementById("up").checked=false;
		   }	   
	   }
	   
	   function subcheck()
	   {
		   var csub=document.getElementsByClassName("csub");
		   var len=csub.length; // 총상품의 갯수
		   
		   // 상품의 체크박스가 몇개 체크되었나를 계산
		   var n=0;
		   for(i=0;i<len;i++)
		   {
			   if(csub[i].checked)
				   n++; // 체크가 된 상품의 갯수
		   }

	       if(len==n)
	       {
	    	   document.getElementById("up").checked=true;
	       }	
	       else
	       {
	    	   document.getElementById("up").checked=false;
	       }	   
	   }
	   //판매중
	   function productOn()
	   {
		   var id="";
		   var csub=document.getElementsByClassName("csub");
		   var len=csub.length; 
	  
	       for(i=0;i<len;i++)
	       {
			    if(csub[i].checked)
			       id=id+csub[i].value+",";
		   }	   
		   
		   if(id!="")   
		      location="productOn?id="+id;
		   
	   }
	   
	   //판매중지
	   function productOff()
	   {
		   var id="";
		   var csub=document.getElementsByClassName("csub");
		   var len=csub.length; 
	  
	       for(i=0;i<len;i++)
	       {
			    if(csub[i].checked)
			       id=id+csub[i].value+",";
		   }	   
		   
		   if(id!="")   
		      location="productOff?id="+id;
		   
	   }
	   
	   //상품삭제
	   function productDel()
	   {
		   var id="";
		   var csub=document.getElementsByClassName("csub");
		   var len=csub.length; 
	  
	       for(i=0;i<len;i++)
	       {
			    if(csub[i].checked)
			       id=id+csub[i].value+",";
		   }	   
		   
		   if(id!="")   
		      location="productDelete?id="+id;
		   
	   }
	   
	   
	 </script>
</head>
<body>
 <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
	<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h1 class="h2">상품 관리</h1>
	</div>
	<h4 class="pt">상품 현황</h4>
		<div class="d-flex justify-content-between">

		<ul class="d-flex list-unstyled">
			<li class="pe-3">전체 ${pageMaker.total}건 </li>
			<li class="pe-3">판매함 ${total2}건 </li>
			<li class="pe-3">판매안함${total3}건 </li>
		</ul>
		<div>
			<a class="btn btn-primary" href="product">상품등록</a>
		</div>
	</div>
	
	<h4 class="pt">상품 목록</h4>
          
	<div class="container-fluid">
		<div class="d-flex justify-content-between">
			<div>[총  ${pageMaker.total }개]</div>
			<div>
				<select class="form-select-sm">
					<option>등록일 역순</option>
					<option>등록일 순</option>
					<option>상품코드 역순</option>
					<option>상품코드 순</option>
				</select>
				<select class="form-select-sm">
					<option>20개씩 보기</option>
					<option>50개씩 보기</option>
					<option>100개씩 보기</option>
				</select>
			</div>
		</div>
		<div class="row d-flex">
			<div class="col-auto">
			<span class="btn btn-sm btn-outline-dark" onclick="productOn()">판매함</span>
			<span class="btn btn-sm btn-outline-dark" onclick="productOff()">판매안함</span>
			<span class="btn btn-sm btn-outline-dark" onclick="productDel()">삭제</span>
			</div>
			<!-- 검색 영역 -->
		<div class="row search_wrap col-auto">
		<form id="searchForm" action="productList" method="get">
			<div class="search_input">
				<input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
				<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
				<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
				<input type="hidden" name="type" value="G">
				 <button class='btn search_btn btn-dark btn-sm'>검 색</button>
			</div>	                				
		</form>
		</div>	
		</div>
		</div>
		
		<table class="table">
			<thead>
			<tr>
				<th>
					<input type="Checkbox" onclick="maincheck(this)" id="up">
				</th>
				<th>상품코드</th>
				<th>상품명</th>
				<th>판매상태</th>
				<th>판매가</th>
				<th>할인가</th>
			</thead>
			
			<tbody>
			<c:forEach items="${plist }" var="pvo">
			<tr>
				<td>
					<input type="checkbox" class="csub" onclick="subcheck()" value="${pvo.id }">
				</td>
				<td>${pvo.pCode }</td>
				<td>
					<img src="../resources/pro/${pvo.pImg1 }" width="50" height="50">
					<a href="productDetail?id=${pvo.id }"> ${pvo.pName }</a>
				</td>
				<td>
					<c:if test="${pvo.pState == 0}">판매중</c:if>
					<c:if test="${pvo.pState == 1}">판매안함</c:if>					
				</td>
				<td>
				<fmt:formatNumber value="${pvo.pPrice }" type="number"/>
					
				</td>
				<td>
				<fmt:formatNumber value="${Math.ceil ((pvo.pPrice - (pvo.pDc * pvo.pPrice /100))/100) *100}" type="number"/>
				
					
				</td>
			</tr>			
			</c:forEach>
			</tbody>
		</table>
		
		
		
		<!-- 페이지 이름 인터페이스 영역 -->
		<div class="pageMaker_wrap">
			<ul class="pagination pagination-sm justify-content-center pageMaker">
			<!-- 이전 버튼 -->
			<c:if test="${pageMaker.prev }">
				<li class="page-item pageMaker_btn prev">
					<a class="page-link" href="${pageMaker.pageStart -1}">이전</a>
				</li>
			</c:if>
                			
			<!-- 페이지 번호 -->
			<c:forEach begin="${pageMaker.pageStart }" end="${pageMaker.pageEnd }" var="num">
				<li class="page-item pageMaker_btn ${pageMaker.cri.pageNum == num ? 'active':''}">
					<a class="page-link" href="${num}">${num}</a>
				</li>	
			</c:forEach>
                		
			<!-- 다음 버튼 -->
			<c:if test="${pageMaker.next}">
				<li class="page-item pageMaker_btn next">
					<a class="page-link" href="${pageMaker.pageEnd + 1 }">다음</a>
				</li>
			</c:if>
			</ul>
		</div>
                	
		<form id="moveForm" action="productList" method="get" >
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
		</form>
		
		
		
	</div>
</main>
</body>
</html>