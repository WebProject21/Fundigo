<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
body {
	letter-spacing: 0.7px;
	background-color: #eee
}

.container-purchase {
	margin-top: 100px;
	margin-bottom: 100px
}

p {
	font-size: 14px
}

.btn-primary {
	background-color: #42A5F5 !important;
	border-color: #42A5F5 !important
}

.cursor-pointer {
	cursor: pointer;
	color: #42A5F5
}

.pic {
	margin-top: 30px;
	margin-bottom: 20px
}

.card-block {
	width: 200px;
	border: 1px solid lightgrey;
	border-radius: 5px !important;
	background-color: #FAFAFA;
	margin-bottom: 30px
}

.card-body.show {
	display: block
}

.card {
	padding-bottom: 20px;
	box-shadow: 2px 2px 6px 0px rgb(200, 167, 216)
}

.radio {
	display: inline-block;
	border-radius: 0;
	box-sizing: border-box;
	cursor: pointer;
	color: #000;
	font-weight: 500;
	-webkit-filter: grayscale(100%);
	-moz-filter: grayscale(100%);
	-o-filter: grayscale(100%);
	-ms-filter: grayscale(100%);
	filter: grayscale(100%)
}

.radio:hover {
	box-shadow: 2px 2px 2px 2px rgba(0, 0, 0, 0.1)
}

.radio.selected {
	box-shadow: 0px 8px 16px 0px #EEEEEE;
	-webkit-filter: grayscale(0%);
	-moz-filter: grayscale(0%);
	-o-filter: grayscale(0%);
	-ms-filter: grayscale(0%);
	filter: grayscale(0%)
}

.selected {
	background-color: #E0F2F1
}

.a {
	justify-content: center !important;
}

.b, .b:hover {
	text-decoration: none;
}

.btn {
	border-radius: 0px
}

.btn, .btn:focus, .btn:active {
	outline: none !important;
	box-shadow: none !important
}
</style>
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

		<div class="container-purchase">
			<div class="row justify-content-center">
				<div class="col-md-9">
					<div
						class="card text-center justify-content-center shaodw-lg card-1 border-0 bg-white px-sm-2">
						<div class="card-body show ">
							<div class="row">
								<div class="col">
									<h4>
										<b>펀딩하기</b>
									</h4>
									<p>
										후원이 처음이세요? <a class="ml-1 cursor-pointer b" href="/board/faq">
											후원 주의 사항</a>
									</p>
								</div>
							</div>
							<form name = "infoForm" action="/product/purchase" method="post">
								<div
									class="radio-group row justify-content-center px-3 text-center a">
									<c:forEach items="${lists}" var="list" varStatus="status">
										<div
											class="col-auto col-lg-7 card-block py-3 text-center radio">
											<input type="hidden" class="fundPrice" name="fundPrice"
												value="${list.price }"> <input type="hidden"
												name="code" value="${list.code}">
											<div class="flex-row">
												<h5 class="card-title">
													<strong><c:out value="${list.title }" /></strong>
												</h5>
												<p class="card-text font-weight-light">${list.contents }
												</p>
												<p class="card-text font-weight-bold">
													<c:out value="${list.price} 원"></c:out>
												</p>
											</div>
										</div>
									</c:forEach>
								</div>
								</form>
								<div class="row justify-content-center">
									<div class="col">
										<p>
											<span class="text-muted">총 후원 금액 : &nbsp; <strong
												id="priceText">0</strong> 원
											</span>
										</p>
									</div>
								</div>
								<form id = "actionForm" method = "post" action = "/product/purchase">
								<input type="hidden" name="pno" value="${product.pno }">
								<input type="hidden" name="code" value="">
								<div class="row justify-content-center">
										<p>
										<div class="col-sm-2 custom-control custom-radio">
											<input type="radio" class="custom-control-input"
												id="funding1" name="unkno" value="A"> <label
												class="custom-control-label" for="funding1">익명 후원</label>
										</div>
										
										<div class="col-sm-2 custom-control custom-radio">
											<input type="radio" class="custom-control-input"
												id="funding2" name="unkno" value="B"> <label
												class="custom-control-label" for="funding2">실명 후원</label>
										</div>
									</div>
						<div class="row justify-content-between">
							<div class="col-auto">
								<button type="button" class="btn btn-outline-secondary"
									onclick="history.back()">
									<span class="mr-2"><i class="fa fa-angle-left"
										aria-hidden="true"></i></span> 돌아가기
								</button>
							</div>
							<div class="col-auto">
								<button type="submit" id="purchaseButton"
									class="btn btn-outline-danger">
									구매하기 <span class="ml-2"><i class="fa fa-angle-right"
										aria-hidden="true"></i></span>
								</button>
							</div>
						</div>
					</form>
					</div>
					</div>
				</div>
			</div>
		</div>
		
	</section>
	<%@include file="../footer.jsp"%>

</body>
</html>