<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>funDigo</title>
<script type="text/javascript">
	$(document).ready(function(){
		$("#logoutBtn").on("click", function(){
			location.href="/mypage/logout";
		})
		
	})
</script>
</head>
<body>
	
	<div class="header">
 	
		<div class="container">
	
			<div class="row">
	
				<div class="col-md-3 col-sm-4">
	
					<div class="logo">
	
						<a href="index.html"> <img src="../resources/images/logo.png" alt="funDigo">

						</a>
	
					</div>
	
				</div>
	
				<div class="col-md-6 col-sm-5">
	
					<div class="search-form">
	
						<form class="navbar-form" role="search">
	
							<div class="form-group d-inline-block">
								<input type="text" class="form-control" placeholder="펀딩을 검색하세요">
	
							</div>
							<button type="submit" class="btn">
								<i class="fa fa-search"></i>
							</button>
	
						</form>
	
					</div>
	
				</div>
	
				<div class="col-md-3 col-sm-3">
	
					<div class="action pull-right">
					
						<ul>
						<form action="/mypage/memberLogin" method="POST">
								<c:if test="${member==null}">
									<li><a href="/mypage/memberLogin"><i
											class="fa fa-user"></i>&nbsp; 로그인</a></li>
								</c:if>
								<c:if test="${member!=null}">
								<li><p class="fa fa-user">ID : 
									<c:out  value="${member.id}"></c:out> </p>
									<button id="logoutBtn" type="button">logout</button> </li>
										
								</c:if>
						</form>
							<li><a href="/mypage/JoinPage"><i class="fa fa-lock"></i>&nbsp; 회원가입</a></li>
						</ul>

					</div>



				</div>

			</div>

		</div>

	</div>

	<div class="navigation">

		<nav class="navbar navbar-theme">

			<div class="container">

				<!-- Brand and toggle get grouped for better mobile display -->
				<!-- 
            <div class="navbar-header">

              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navibar" aria-expanded="false">

                <span class="sr-only">Menu</span>

                <span class="icon-bar"></span>

                <span class="icon-bar"></span>

                <span class="icon-bar"></span>

              </button>

            </div>-->

				<div class="shop-category pull-left">

					<!-- Single button -->

					<div class="btn-group">
							<button type="button"
								class="btn btn-shop-category dropdown-toggle"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">카테고리</button>

							<div class="dropdown-menu dropdown-category">

								<a class="dropdown-item" href="">게임</a> 
								<a class="dropdown-item" href="">디자인</a> 
								<a class="dropdown-item" href="">생활</a> 
								<a class="dropdown-item" href="">테크</a>
								<div role="separator" class="dropdown-divider"></div>
								<a class="dropdown-item" href="">개최 예정 펀딩</a> 
								<a class="dropdown-item" href="">종료 임박 펀딩</a>

							</div>

					</div>

				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->

				<div class="navbar navbar-expand-sm" id="navibar">

					<ul class="navbar-nav pull-right">

						<li><a href="#">Home</a></li>

						<li><a href="#">FAQ</a></li>

					</ul>

				</div>
				<!-- /.navbar-collapse -->

			</div>
			<!-- /.container-fluid -->
		</nav>

	</div>



</body>
</html>