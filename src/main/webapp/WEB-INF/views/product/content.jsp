<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>

<html lang="en-US">

<head>

<meta charset="UTF-8">

<title>funDigo</title>




</head>

<body>

	<p>
	<div class="short-description">

		<div class="container">

			<div class="row">

				<div class="col-md-6">

					<div class="product-thumbnail">

						<div class="col-md-10 col-sm-10 col-xs-10">

							<div class="thumb-main-image">
								<a href=""><img
									src="../resources/images/single-product-1.jpg" alt=""></a>
							</div>

						</div>

					</div>

					<div class="clearfix"></div>

				</div>

				<div class="col-md-6">

					<h1>
						<c:set var="now" value="<%=new java.util.Date()%>" />
						<fmt:parseNumber value="${now.time / (1000*60*60*24)}"
							integerOnly="true" var="strDate"></fmt:parseNumber>
						<fmt:parseDate value="${product.goalDate }" var="goal"
							pattern="yyyy-MM-dd" />
						<fmt:parseNumber value="${goal.time / (1000*60*60*24)}"
							integerOnly="true" var="endDate"></fmt:parseNumber>
						<span class="font-weight-light text-muted">[ D - ${endDate - strDate }
							]</span> <span class="font-weight-bold"> ${product.title } </span>
					</h1>


					<div class="product-info">

						<strong>카테고리 : &nbsp;</strong>

						<c:if test="${product.tag eq 'G' }">
							<c:out value="게임"></c:out>
						</c:if>
						<c:if test="${product.tag eq 'D' }">
							<c:out value="디자인"></c:out>
						</c:if>
						<c:if test="${product.tag eq 'L' }">
							<c:out value="생활"></c:out>
						</c:if>
						<c:if test="${product.tag eq 'T' }">
							<c:out value="테크"></c:out>
						</c:if>

						<div class="ratings">

							<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <span class="vote-count">35</span>

						</div>
					</div>



					<p class="short-info">${product.description }</p>
					<p>
					<p>
					<p>
					<hr>

					<form action="/product/purchase" class="purchase-form" method="get">
						<input type = "hidden" name = "pno" value = "${product.pno }">
						<button class="btn btn-outline-secondary" type="submit">펀딩하기</button>

						<div class="social-share">

							<ul>

								<li class=""><a href=""><i class="fa fa-facebook"></i></a></li>

								<li><a href=""><i class="fa fa-twitter"></i></a></li>

								<li><a href=""><i class="fa fa-google-plus"></i></a></li>

								<li><a href=""><i class="fa fa-linkedin"></i></a></li>

							</ul>

						</div>

					</form>

					<ul class="product-info-btn">

						<li><a href=""><i class="fa fa-heart-o"></i> 찜</a></li>

						<li><a href=""><i class="fa fa-arrows-h"></i> Compare</a></li>

						<li><a href=""><i class="fa fa-envelope-o"></i> Email</a></li>

						<li><a href=""><i class="fa fa-print"></i> Print</a></li>

					</ul>



				</div>

			</div>

		</div>

	</div>

	<p>
	<div class="container">

		<div class="row">

			<div class="container" id="menuTab">

				<ul class="nav nav-tabs nav-justified">

					<li class="nav-item"><a class="nav-link active"
						href="#description" data-load="true" data-toggle="tab">상품 설명</a></li>

					<li class="nav-item"><a class="nav-link" href="#notice"
						data-load="false" data-toggle="tab"
						data-url="http://localhost:8181/product/notice?pno=${product.pno }&id=${id}">공지사항</a></li>

					<li class="nav-item"><a class="nav-link" href="#community"
						data-load="false" data-toggle="tab"
						data-url="http://localhost:8181/product/community?pno=${product.pno }&id=${id}">커뮤니티</a></li>

					<li class="nav-item"><a class="nav-link" href="#sponsor"
						data-load="false" data-toggle="tab"
						data-url="http://localhost:8181/product/sponsor?pno=${product.pno }">서포터</a></li>

				</ul>

				<div class="tab-content">

					<div class="container-fluid col-lg-12 tab-pane active" id="description">
						<div class="product-desc">
							<h2>${product.title }</h2>

							<p>${product.description }</p>


							<c:forEach items="${lists}" var="list">
								<div class="card col-lg-12">
									<div class="card-body">
										<h5 class="card-title"><strong><c:out value="${list.title }" /></strong></h5>
										<p class="card-text font-weight-light">
										${list.contents }
										</p>
										<p class="card-text font-weight-bold">
											<c:out value="${list.price} 원"></c:out>
										</p>

									</div>
								</div>
								<p>
							</c:forEach>

						</div>


					</div>

					<div class="container tab-pane fade product-desc" id="notice">

					</div>

					<div class="container tab-pane fade product-desc" id="community">

					</div>

					<div class="container tab-pane fade product-desc" id="sponsor">

					</div>

				</div>
				<!-- tab content 닫히는 곳 -->

			</div>

		</div>

	</div>

	<div class="container">

		<div class="row">

			<div class="related-items">

				<ul class="nav nav-tabs">

					<li class="active"><a href="#related" data-toggle="tab">Related
							Products</a></li>

				</ul>

				<div class="tab-content">

					<div class="tab-pane active" id="related">

						<div class="col-md-3 col-sm-4">

							<div class="single-product">

								<div class="product-block">

									<img src="../resources/images/product-1.jpg" alt=""
										class="thumbnail">

									<div class="product-description text-center">

										<p class="title">Date Tiffany Torchiere</p>

										<p class="price">$ 55.00</p>

									</div>

									<div class="product-hover">

										<ul>

											<li><a href=""><i class="fa fa-cart-arrow-down"></i></a></li>

											<li><a href=""><i class="fa fa-arrows-h"></i></a></li>

											<li><a href=""><i class="fa fa-heart-o"></i></a></li>

										</ul>

									</div>

								</div>

							</div>

						</div>

						<div class="col-md-3 col-sm-4">

							<div class="single-product">

								<div class="product-block">

									<img src="../resources/images/product-2.jpg" alt=""
										class="thumbnail">

									<div class="product-description text-center">

										<p class="title">Date Tiffany Torchiere</p>

										<p class="price">$ 55.00</p>

									</div>

									<div class="product-hover">

										<ul>

											<li><a href=""><i class="fa fa-cart-arrow-down"></i></a></li>

											<li><a href=""><i class="fa fa-arrows-h"></i></a></li>

											<li><a href=""><i class="fa fa-heart-o"></i></a></li>

										</ul>

									</div>

								</div>

							</div>

						</div>

						<div class="col-md-3 col-sm-4">

							<div class="single-product">

								<div class="product-block">

									<img src="../resources/images/product-3.jpg" alt=""
										class="thumbnail">

									<div class="product-description text-center">

										<p class="title">Date Tiffany Torchiere</p>

										<p class="price">$ 55.00</p>

									</div>

									<div class="product-hover">

										<ul>

											<li><a href=""><i class="fa fa-cart-arrow-down"></i></a></li>

											<li><a href=""><i class="fa fa-arrows-h"></i></a></li>

											<li><a href=""><i class="fa fa-heart-o"></i></a></li>

										</ul>

									</div>

								</div>

							</div>

						</div>

						<div class="col-md-3 col-sm-4">

							<div class="single-product">

								<div class="product-block">

									<img src="../resources/images/product-4.jpg" alt=""
										class="thumbnail">

									<div class="product-description text-center">

										<p class="title">Date Tiffany Torchiere</p>

										<p class="price">$ 55.00</p>

									</div>

									<div class="product-hover">

										<ul>

											<li><a href=""><i class="fa fa-cart-arrow-down"></i></a></li>

											<li><a href=""><i class="fa fa-arrows-h"></i></a></li>

											<li><a href=""><i class="fa fa-heart-o"></i></a></li>

										</ul>

									</div>

								</div>

							</div>

						</div>

					</div>

				</div>

			</div>

		</div>

	</div>




</body>

</html>