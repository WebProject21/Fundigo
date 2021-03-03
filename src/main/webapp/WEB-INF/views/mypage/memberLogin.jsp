<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- Font  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

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
</head>
<body>
<div class="container">
	<div class="row">
		<div class="offset-xs-1 offset-md-4 col-xs-10 col-md-4 p-5" style="text-align: center; border: medium solid black; border-radius: 0.5px; margin-top: 10%;">
		<h1>Login</h1>
			<form action="login" method="POST">
				<div class="form-group">
					<input type="text" autocomplete="username" class="form-control offset-1 col-10" placeholder="아이디" name="mid">
					<!-- placeholder=fixed name -->
				</div>
				<div class="form-group">
					<input type="password" autocomplete="current-password" class="form-control offset-1 col-10" placeholder="비밀번호" name="mpw">
				</div>
				<!-- autoComplete = password autoInput // browser autoinput -->
				<div class="form-group">
					<button type="submit" class="btn btn-dark col-8">로그인</button>
				</div>
				<div class="form-group">
					<a href="memberJoin" class="col-6 col-sm-4 loginA">회원가입</a>
					<a href="#" class="col-6 col-sm-8 loginA">ID/PW 찾기</a>
				</div>
			</form>
		</div>
	</div>
	<div class="row">
		<div class="col-12 text-center">
			<c:choose>
				<c:when test="${loginfullfail!=null}">
					<span style="color: crimson; font-weight: bold;" id="loginMessage">${loginfullfail}</span>
				</c:when>
				<c:when test="${loginMessage!=null}">
					<span style="color: crimson; font-weight: bold;" id="loginMessage">${loginMessage}(${loginfail}/5)</span>
				</c:when>
				<c:when test="${fail!=null}">
					<span style="color: crimson; font-weight: bold;">로그인이 필요한 서비스입니다. 로그인해주세요.</span>
				</c:when>
			</c:choose>
		</div>
	</div>
</div>
</body>
</html>