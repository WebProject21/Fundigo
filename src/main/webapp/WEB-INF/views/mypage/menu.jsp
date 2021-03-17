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
.menubar {
	text-decoration: none;
	color: gray;
}

.menubar:hover {
	text-decoration: none;
	color: blue;
}
.menuA { 
        height:500px;
      }

</style>
</head>
<body>
		<!-- <div class="container ">
		<div class="row mt-5 "> -->
			<div class="col-12 col-md-2 form-group  menuA"
				style="border: medium solid black; border-radius: 10px; text-align: left; max-height: 544px;
				margin-top: 10%;">
				<div class="row p-3">
					<div class="col-6 col-md-12">
						<div class="form-group ">
							<h5 style="font-weight: bold;">내 정보</h5>
						</div>
						<div class="form-group mt-5">
							<a href="/mypage/InfoChangeInput" class="menubar">정보 수정</a>
						</div>
						<div class="form-group mb-3">
							<a href="/mypage/Favorite" class="menubar">관심 목록</a>
						</div>
						<div class="form-group mb-5">
							<a href="/mypage/Fundhistory" class="menubar">펀딩 목록</a>
						</div>
						<div class="form-group ">
							<a href="/mypage/Withdraw" class="menubar">회원탈퇴</a>
						</div>
					</div>
				</div>

			</div>
		<!-- </div>
	</div> -->
</body>
</html>