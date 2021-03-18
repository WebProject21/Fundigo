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
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
	<div class="container mb-5">
		<div class="row">
			<jsp:include page="menu.jsp">
			<div class="offset-xs-1 offset-md-4 col-xs-10 col-md-5 p-3"
				style="text-align: center; border-radius: 0.5px; margin-top: 10%;">
				 
				<h1>check</h1>

						<div class="form-group">
						 <input class="form-control offset-1 col-10" type="text" id="id" name ="id" disabled="disabled" value="${vid}" required="required">
						</div>
						<div class="form-group">
							<input type="password" autocomplete="current-password"
								class="form-control offset-1 col-10" placeholder="비밀번호"
								id="password" name="password">
						</div>
						
						<div class="form-group">
							<button type="submit" class="btn btn-dark col-8">정보 수정</button>
						</div>
			
			</div>
		</div>
	</div>
	<%@include file="../footer.jsp"%>
</body>
</html>