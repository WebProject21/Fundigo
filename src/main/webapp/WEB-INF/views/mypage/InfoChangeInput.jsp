<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myInfoChange</title>
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!-- css inject -->
<style type="text/css">
.menubar {
	text-decoration: none;
	color: gray;
}

.menubar:hover {
	text-decoration: none;
	color: purple;
	font-weight: bold;
}

</style>
</head>
<body>
<%@include file="../header.jsp"%>
	<div class="container">
		
		<div class="row ">
			<jsp:include page="menu.jsp"></jsp:include>
			<div class="col-12 col-md-6 form-group ml-3"
				style=" border-radius: 10px; text-align: center; margin-top: 10%;">
					
					<h1>내 정보 수정</h1>
					<!-- <form action="mChange" method="post" enctype="multipart/form-data"> -->
					<div class="row form-group">
						<div class="col-12 offset-md-3 col-md-6">
							<label for="#id">아이디</label> 
							<input class="form-control" type="text" id="id" name ="id" disabled="disabled" value="${member.id}" required="required">
						</div>
					</div>
					<div class="row form-group">
						<div class="col-12 offset-md-3 col-md-6">
							<label for="#phone">휴대폰</label>
							 <input class="form-control" type="tel" placeholder="휴대폰" id="phone" name = "phone"value="${member.phone}" disabled="disabled"
								required="required">
						</div>
					</div>
					<div class="row form-group">
						<div class="col-12 offset-md-3 col-md-6">
							<label for="password">비밀번호</label>
							 <input class="form-control"
								type="password" id="password" name="password" placeholder="비밀번호"
								required="required">
						</div>
					</div>
					<div class="row form-group">
						<div class="col-12 offset-md-3 col-md-6">
							<input class="form-control" type="password" id="passCheck" 
								placeholder="비밀번호 확인" required="required">
						</div>
					</div>
					<div class="row form-group">
						<div class="col-12 offset-md-3 col-md-6">
							<label for="address">주소</label> 
							<input class="form-control"
								type="text" name="address" id ="address">
						</div>
					</div>
					<div class="row form-group">
						<div class="col-12 offset-md-3 col-md-6">
							<label for="nickname">닉네임</label> 
							<input class="form-control" type="text" name="nickname" id ="nickname">
						</div>
					</div>
					
					<div class="row form-group">
						<div class="col-12 textcenter">
							<button class="btn btn-primary" type="submit"
								onclick="return confirm('정말 수정하시겠습니까?');">수정</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- </form> -->
			<%@include file="../footer.jsp"%>
</body>
</html>