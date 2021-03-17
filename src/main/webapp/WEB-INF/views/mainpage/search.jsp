<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>funDigo</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Google Font -->

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700|Raleway:400,300,500,700,600'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css"
	type="text/css">

<link href="../resources/css/bootstrap-grid.min.css" rel="stylesheet">
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>

	<%@include file="../header.jsp"%>

	<form id="actionForm" action="/mainpage/search" method="get">
		<input type="hidden" name="pageNum"
			value="<c:out value = '${pageMaker.cri.pageNum }'/>"> <input
			type="hidden" name="amount"
			value="<c:out value = '${pageMaker.cri.amount }'/>"> <input
			type="hidden" name="keyword"
			value="<c:out value = '${pageMaker.cri.keyword }'/>">
	</form>
	
	<p>
	<div class="container-fluid col-lg-8" id="contents">
		<div class="card">
			<div class="card-body">
				<b>${pageMaker.cri.keyword }</b>&nbsp;에 관련된 검색 결과
			</div>
		</div>
		<p>
			<c:forEach items="${results}" var="product">
				<div class="card mb-3">
					<img class="card-img-top" src="../resources/images/logo.png"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">${product.title }</h5>
						<p class="card-text">${product.description }</p>

						<c:set var="now" value="<%=new java.util.Date()%>" />
						<fmt:parseNumber value="${now.time / (1000*60*60*24)}"
							integerOnly="true" var="strDate"></fmt:parseNumber>
						<fmt:parseDate value="${product.goalDate }" var="goal"
							pattern="yyyy-MM-dd" />
						<fmt:parseNumber value="${goal.time / (1000*60*60*24)}"
							integerOnly="true" var="endDate"></fmt:parseNumber>
						<p class="card-text">
							<small class="text-muted">D - ${endDate - strDate } </small>
						</p>
						<a href="/product/view?pno=${product.pno }" class="stretched-link"></a>
					</div>
				</div>
			</c:forEach>
	</div>

	<div class="d-flex justify-content-center">
		<nav aria-label="Page navigation">
			<ul class="pagination">
				<c:if test="${pageMaker.prev }">
					<li class="page-item"><a class="page-link" href="${pageMaker.startPage -1 }"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							<span class="sr-only">Previous</span>
					</a></li>
				</c:if>

				<c:forEach var="num" begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }">
					<li class="page-item ${pageMaker.cri.pageNum == num ? "active" : "" }"><a class="page-link" href="${num }">${num }</a></li>
				</c:forEach>

				<c:if test="${pageMaker.next }">
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
							class="sr-only">Next</span>
					</a></li>
				</c:if>
			</ul>
		</nav>

	</div>

	<%@include file="../footer.jsp"%>
	
</body>
</html>