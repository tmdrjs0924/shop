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
.boardAnswer{
	display: none;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
$(function(){
	test=$(".answer");
	$(".answer").click(function(){
	n=test.index(this);
	$(".boardAnswer").eq(n).toggle();
});
});
</script>
</head>
<body>

 <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
 	
 	<div class="d-flex pt-3 pb-2 mb-3 border-bottom">
		<h1 class="h2">게시물 관리</h1>
	</div>
	
	<h5 class="pt">전체 게시물 목록</h5>
	
	<div class="container-fluid">
		<table class="table text-center align-middle">
			<thead>
			<tr>
				<th>번호</th>
				<th>분류</th>
				<th class="w-25">관련상품</th>
				<th class="w-25">제목</th>
				<th>답변상태</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>비밀글여부</th>
			</tr>
			</thead>
				
			<tbody>
			<c:forEach items="${blist }" var="blist" varStatus="i">
			
			<tr>
				<td>${i.count }</td>
				<td>
					<c:if test="${blist.sort==0 }">
					사이즈					
					</c:if>
					<c:if test="${blist.sort==1 }">
					배송
					</c:if>
					<c:if test="${blist.sort==2 }">
					재입고					
					</c:if>
					<c:if test="${blist.sort==3 }">
					상세문의					
					</c:if>
				</td>
				<td>${blist.pName}</td>
				<td class="text-start">${blist.title }</td>
				<td class="answer">
					<c:if test="${blist.state==0 }">
					<span >미답변</span>
					</c:if>
					<c:if test="${blist.state==1 }">
					답변완료
					</c:if>
				</td>
				
				<td>
					<c:if test="${blist.bimil==0 }">
					비밀글
					</c:if>
					<c:if test="${blist.bimil==1 }">
					공개글
					</c:if>
				</td>
				<td>${blist.userid }</td>
				<td>${blist.writeday }</td>
			</tr>
			<tr class="boardAnswer">
			<td colspan="8">
				<form method="post" action="../admin/boardAction">
				<div class="row">
					<div class="form-floating col-5">
  						<input type="text" class="form-control" value="${blist.content }" disabled="disabled">
  						<label>문의내용</label>
					</div>
					
					<c:if test="${blist.state==0 }">
					<div class="form-floating col">
  						<input type="text" class="form-control"  name="answer">
  						<label >답변내용</label>
					</div>
					
					<div class="col-1 d-flex align-items-center" >
						<input type="hidden" name="id" value="${blist.id }">
						<button type="submit" class="btn btm-sm btn-outline-dark">작성</button>
					</div>
					</c:if>
					
					<!--  -->
					<c:if test="${blist.state==1 }">
					<div class="form-floating col">
  						<input type="text" class="form-control" value="${blist.answer }" name="answer" disabled="disabled">
  						<label >답변내용</label>
					</div>
					</c:if>
					
				</div>
				</form>
			</td>
			
			</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</main>
</body>
</html>