<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv = "X-UA-Compatible" content="ie=edge">
<title>funDigo</title>
<meta name = "keywords" content="funding, 펀딩, 클라우드 펀딩">
<meta name = "description" content="funding any where to buy item">
<meta name = "robots" content="index, follower">

<!--  open graph -->
<!-- <meta property="og:title" content="The Rock" />
<meta property="og:type" content="website" />
<meta property="og:description" content="funding any where to buy item" />
<meta property="og:url" content="https://www.funDigo.com" />
<meta property="og:image" content="https://www.funDigo.com/images/logo.png" /> -->
<!-- favicon 나중에 상의하여 정의 -->
<!-- fontawesome 구글 페이스북 등 아이콘 -->
<script src = "js/all.min.js"></script>

<script  src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script src = "js/main.js"></script>

<!--  bootstrap grid 그리드 적용을 위한 부트스트랩 적용 -->
<link rel="stylesheet" type="text/css"
	href="../resources/css/bootstrap-grid.min.css">
<link rel="stylesheet" type="text/css"
	href="../resources/css/board/boardform.css">
<link rel="stylesheet" type="text/css"
	href="../resources/css/bootstrap.min.css">

<meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Google Font -->

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700|Raleway:400,300,500,700,600'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css"
	type="text/css">


</head>
<body>
<%@include file="../header.jsp"%>
	<header>
		<!-- <div class = "top_navigation">
			<div class = "container">
				<div class = "row justify-content-between">
					<ul class = "contact_list">
						<li>
							<span class = "envelope sprites">envelope</span>
							<a href = "mailto:info@funDigo.com">info@funDigo.com</a>
						</li>
						<li>
							<span class="phone sprites">Phone</span>
							<span>000-0000-0000</span>
						</li>
					</ul>
					<ul class = "social_list">
						<li>
							<a href=""><i class="fab fa-facebook-square"></i></a>
						</li>
						<li>
							<a href=""><i class="fab fa-twitter-square"></i></a>
						</li>
						<li>
							<a href=""><i class="fab fa-google"></i></a>
						</li>
						<li>
							<a href=""><i class="fab fa-instagram-square"></i></a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<nav class="main_navigation">
			<div class = "container">
				<div class="row justify-content-between">
					<div class = "gnb">
						<h1 class = "logo"><a href="">funDigo logo</a></h1>
						<ul>
							<li><a href="design.html">Home</a></li>
							<li><a href="">Products</a></li>
							<li><a href="">Recommend</a></li>
							<li><a href="">Category</a></li>
						</ul>
					</div>
					<ul class = "shopping_nav">
						<li><span class = "search_btn sprites">search</span></li>
						<li><a href="" class = "mypage sprites">mypage</a></li>
						<li><a href="" class = "cart sprites" data-cart="5">cart</a></li>
					</ul>
				</div>
			</div>		
		</nav>
		<form action="">
			<input type="text">
			<input type = "submit" value = "검색">
		</form> -->
	</header>
	<section class = "main_slides">
			<h2 class="hidden">main_slides</h2>
			<ul>
				<li class = "slide slide1">
				<div onclick="linkMethod(1)">
					<div class = "container slide_contents">
						<div class = "contents">
							<h2>funDigo Funding</h2>
							<h3>fun & cool & sexy</h3>
							<p>새로운 형식의 펀딩 사이트</p>
						</div>
					</div>
					</div>
				</li>
	 			<li class = "slide slide2" onclick="linkMethod(2)">
					<div class = "container slide_contents">
						<div class = "contents">
							<h2>즐거운 펀딩으로 생활을 색다르게</h2>
							<h3>차별화 된 서비스를 만나세요!</h3>
							<p>당신을 위한 펀디고!</p>
						</div>
					</div>
				</li>
				<li class = "slide slide3" onclick="linkMethod(3)">
					<div class = "container slide_contents">
						<div class = "contents">
							<h2>펀딩과 함께하는 할인 이벤트</h2>
							<h3>일정 금액 이상 펀딩하시는 분께 할인권 제공</h3>
							<p>당신의 펀딩을 기다립니다.</p>
						</div>
					</div>
				</li>
			</ul>
	</section>
	<main class = "container">
		<!-- new arrlives -->
		<section class ="recommend_funding ">
			<h2 class = "content_title"><span>주목</span>할 만한 프로젝트</h2>
			<ul class = "recommend_funding_list row">
				<li id="product_02" class ="col-md-3">
					<div class = "list_contents">
						<div class = "default">
							<img alt="jacket" src="images/jacket_01.jpg">
							<h3>${slogan}슬로건</h3>
						</div>
						<div class = "hover">
							<p>카테고리</p>
							<hr/>
							<ul>
								<li><h4>${success}달성율</h4></li>
								<li><a href = "" class = "sprites addcart">addcart</a><li>
							</ul>
						</div>
					</div>
				</li>
				<li id="product_03" class ="col-md-3">
					<div class = "list_contents">
						<div class = "default">
							<img alt="jacket" src="images/jacket_01.jpg">
							<h3>${slogan}슬로건</h3>
						</div>
						<div class = "hover">
							<p>카테고리</p>
							<hr/>
							<ul>
								<li><h4>${success}달성율</h4></li>
								<li><a href = "" class = "sprites addcart">addcart</a><li>
							</ul>
						</div>
					</div>
				</li>
				<li id="product_04" class ="col-md-3">
					<div class = "list_contents">
						<div class = "default">
							<img alt="jacket" src="images/jacket_01.jpg">
							<h3>${slogan}슬로건</h3>
						</div>
						<div class = "hover">
							<p>카테고리</p>
							<hr/>
							<ul>
								<li><h4>${success}달성율</h4></li>
								<li><a href = "" class = "sprites addcart">addcart</a><li>
							</ul>
						</div>
					</div>
				</li>
				<li id="product_05" class ="col-md-3">
					<div class = "list_contents">
						<div class = "default">
							<img alt="jacket" src="images/jacket_01.jpg">
							<h3>${slogan}슬로건</h3>
						</div>
						<div class = "hover">
							<p>카테고리</p>
							<hr/>
							<ul>
								<li><h4>${success}달성율</h4></li>
								<li><a href = "" class = "sprites addcart">addcart</a><li>
							</ul>
						</div>
					</div>
				</li>
				<li></li>
			</ul>
		</section>
		<!-- new best sales -->
		<section class = "new alivals">
			<h2 class = "content_title"><span>신규</span> 펀딩</h2>
			<ul class = "New_arrival_list row">
				<li id="arrival_product_01" class ="col-md-3">
					<div class = "list_contents">
						<div class = "default">
							<img alt="jacket" src="images/jacket_01.jpg">
							<h3>${slogan}슬로건</h3>
						</div>
						<div class = "hover">
							<p>카테고리</p>
							<hr/>
							<ul>
								<li><h4>${success}달성율</h4></li>
								<li><a href = "" class = "sprites addcart">addcart</a><li>
							</ul>
						</div>
					</div>
				</li>
				<li id="arrival_product_02" class ="col-md-3">
					<div class = "list_contents">
						<div class = "default">
							<img alt="jacket" src="images/jacket_01.jpg">
							<h3>${slogan}슬로건</h3>
						</div>
						<div class = "hover">
							<p>카테고리</p>
							<hr/>
							<ul>
								<li><h4>${success}달성율</h4></li>
								<li><a href = "" class = "sprites addcart">addcart</a><li>
							</ul>
						</div>
					</div>
				</li>
				<li id="arrival_product_03" class ="col-md-3">
					<div class = "list_contents">
						<div class = "default">
							<img alt="jacket" src="images/jacket_01.jpg">
							<h3>${slogan}슬로건</h3>
						</div>
						<div class = "hover">
							<p>카테고리</p>
							<hr/>
							<ul>
								<li><h4>${success}달성율</h4></li>
								<li><a href = "" class = "sprites addcart">addcart</a><li>
							</ul>
						</div>
					</div>
				</li>
				<li id="arrival_product_04" class ="col-md-3">
					<div class = "list_contents">
						<div class = "default">
							<img alt="jacket" src="images/jacket_01.jpg">
							<h3>${slogan}슬로건</h3>
						</div>
						<div class = "hover">
							<p>카테고리</p>
							<hr/>
							<ul>
								<li><h4>${success}달성율</h4></li>
								<li><a href = "" class = "sprites addcart">addcart</a><li>
							</ul>
						</div>
					</div>
				</li>
			</ul>
		</section>
	</main>
	<%@include file="../footer.jsp"%>
</body>
</html>