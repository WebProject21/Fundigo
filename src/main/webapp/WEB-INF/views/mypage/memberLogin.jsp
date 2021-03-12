<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- Font  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>login Page</title>

<style type="text/css">
.loginA {
	text-decoration: none;
	color: gray;
}
.loginA:hover {
	text-decoration: none;
	color: blue;
}
</style>

<script type="text/javascript">
	$(document).ready(function(){
		$("#logoutBtn").on("click", function(){
			location.href="/mypage/logout";
		})
		
	})
</script>

</head>
<body>
	<%@include file="../header.jsp"%>
	<div class="container mb-5">
		<div class="row">
			<div class="offset-xs-1 offset-md-4 col-xs-10 col-md-5 p-3"
				style="text-align: center; border-radius: 0.5px; margin-top: 10%;">
				<h1>Login</h1>
				<form action="/mypage/memberLogin" method="POST">
					<c:if test="${member == null}">
						<div class="form-group">
							<input type="text" autocomplete="username"
								class="form-control offset-1 col-10" placeholder="아이디" id="id"
								name="id">
							<!-- placeholder=fixed name -->
						</div>
						<div class="form-group">
							<input type="password" autocomplete="current-password"
								class="form-control offset-1 col-10" placeholder="비밀번호"
								id="password" name="password">
						</div>
						<!-- autoComplete = password autoInput // browser autoinput -->
						<div class="form-group">
							<button type="submit" class="btn btn-dark col-8">로그인</button>
						</div>
							<div class="form-group">
								<a href="memberJoin" class="col-6 col-sm-4 loginA">회원가입</a>
							</div>
						</c:if>
						
						<c:if test="${member != null}">
							<div>
							<p>${member.id} 님 으로 로그인 되었습니다 ! </p>	
							</div>
						</c:if>
						<c:if test="${msg == false }">
							<div>
								<p>로그인 실패!</p>
							</div>
						</c:if>
				</form>
			</div>
		</div>
	</div>
	<%@include file="../footer.jsp"%>
</body>
</html>