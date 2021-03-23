<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>
.vl {
	border-left: 1px solid gray;
	height: 8px;
	position: absolute;
	left: 50%;
	margin-left: -3px;
	top: 0;
}
</style>
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

	<section id="contents">
		<p>
		<div class="container justify-contents-center">
			<div class="card border-secondary col-lg-6">
				<div class="card-header bg-transparent border-secondary">구매 내역</div>
				<div class="card-body text-secondary">
					<div class="card-text">
						<div class="media">
							<img src="../resources/images/logo.png"
								class="align-self-start mr-3" style="width: 100px">
							<div class="media-body">
								<h6 class="card-title">
									제품 이름 :
									<c:out value="${product.title }"></c:out>
								</h6>
								<h6 class="card-title">
									제품 옵션 :
									<c:out value="${list.title }" />
									&nbsp; <span class="text-muted lead">|</span> &nbsp; 가격 :
									<c:out value="${list.price }" />
								</h6>
								<hr>
								<p>
								<fmt:parseDate value="${fundhistory.dates}" var="datesFmt"
									pattern="yyyy-MM-dd HH:mm:ss.S" />
								<fmt:formatDate value="${datesFmt}" var = "datesR" pattern="yyyy-MM-dd hh:mm:ss" />
									<small class="text-muted"><strong><c:out value = "${datesR }"/></strong>에 후원되었습니다. 이용해주셔서 감사합니다. 펀딩
										이후 상품 정보, 배송, 반품 등에 대한 문의는 판매자에게 문의해주세요.</small>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<p>
			<p>
			<a class="btn btn-outline-secondary" href="/mypage/favorite" role="button">마이 페이지</a>
		</div>
	</section>

	<%@include file="../footer.jsp"%>

</body>
</html>