<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<%@include file="../header.jsp"%>
	<div class="container">
		<div class="row">
			<jsp:include page="menu.jsp" />
		<form action="WithdrawDelete" method="post" enctype="multipart/form-data">
			
			<div class="offset-5 col-12 md-4 mt-5 xs-4 p-5"
				style="text-align: center; border-radius: 0/.5px; margin-top: 5%;">
				<div class="m-3">
				<h1>&nbsp  Withdrawal</h1>
				</div>
			
					<div class="form-group">
						<input type="text" autocomplete="username"
							class="form-control offset-1 col-12" placeholder="아이디" name="id" required>
					</div>
					<div class="form-group">
						<input type="password" class="form-control offset-1 col-12"
							placeholder="비밀번호" id="password" id="password" name="password" required>
					</div>

					<div class="form-group offset-1">
						<button type="submit" class="btn btn-dark col-8">회원탈퇴</button>
					</div>

			</div>
			</form>
		
		</div>
	</div>
			
</body>
</html>