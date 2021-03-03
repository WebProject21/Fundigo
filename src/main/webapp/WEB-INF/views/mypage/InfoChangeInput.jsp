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
	<div class="container">
		
		<div class="row ">
			<jsp:include page="menu.jsp"></jsp:include>
			<div class="col-12 col-md-6 form-group ml-3"
				style=" border-radius: 10px; text-align: center; margin-top: 10%;">
					
					<h1>내 정보 수정</h1>
					<!-- <form action="mChange" method="post" enctype="multipart/form-data"> -->
					<div class="row form-group">
						<div class="col-12 offset-md-3 col-md-6">
							<label for="#mid">아이디</label> 
							<input class="form-control" type="text" id="mid" disabled="disabled" required="required">
						</div>
					</div>
					<div class="row form-group">
						<div class="col-12 offset-md-3 col-md-6">
							<label for="#mphone">휴대폰</label>
							 <input class="form-control" type="tel" placeholder="휴대폰" id="mphone" disabled="disabled"
								required="required">
						</div>
					</div>
					<div class="row form-group">
						<div class="col-12 offset-md-3 col-md-6">
							<label for="mpw">비밀번호</label>
							 <input class="form-control"
								type="password" id="mpw" name="mpw" placeholder="비밀번호"
								required="required">
						</div>
					</div>
					<div class="row form-group">
						<div class="col-12 offset-md-3 col-md-6">
							<input class="form-control" type="password" id="mpwCheck"
								placeholder="비밀번호 확인" required="required">
						</div>
					</div>
					<div class="row form-group">
						<div class="col-12 offset-md-3 col-md-6">
							<label for="address">주소</label> 
							<input class="form-control"
								type="text" name="address">
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

		<!-- </form>
	 -->
</body>
</html>