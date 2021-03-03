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
<title>Sign Page</title>
</head>
<body>

	<div class="container">
		<!-- not checked color -->
		<div class="col-12 offset-sm-4 col-sm-4 offset-sm-4 p-3"
			style="text-align: center; border-radius: 0.5px; margin-top: 10%;">
			<h1>Sign Up</h1>
		</div>

		<div class="col-12 offset-sm-2 col-sm-8 p-3"
			style="border: medium solid black; border-radius: 10px; text-align: center;">

			<form action="join" method="POST" enctype="multipart/form-data"
				class="col-12 offset-sm-1 col-sm-10 needs-validation"
				autocomplete="off" novalidate>
				<div class="form-group row">
					<input type="text" class="form-control col-7" autocomplete="off"
						placeholder="아이디" id="mid" name="mid" maxlength="15" autofocus
						required>
					<button type="button" class="btn btn-dark offset-1 col-4"
						id="midchecker" disabled="disabled">중복확인</button>
					<div class="valid-feedback"></div>
					<div class="invalid-feedback text-center">5글자 이상으로 영어소문자 혹은
						숫자와 함께 사용해주세요.</div>
				</div>
				<div class="form-group row">
					<input type="password" class="form-control" autocomplete="off"
						placeholder="비밀번호" maxlength="20" required>
					<div class="valid-feedback"></div>
					<div class="invalid-feedback text-left">비밀번호는 문자,숫자,특수문자를
						포함하여 8글자 이상이어야합니다.</div>
				</div>
				<div class="form-group row">
					<input type="password" class="form-control" autocomplete="off"
						placeholder="비밀번호확인" name="mpw" maxlength="20" required>
					<div class="valid-feedback"></div>
					<div class="invalid-feedback text-left">비밀번호를 확인해주세요.</div>
				</div>
				<div class="form-group row">
					<input type="text" class="form-control" placeholder="주소(시군구)"
						name="maddresss" maxlength="15" required>
					<div class="valid-feedback"></div>
					<div class="invalid-feedback text-left">시군구를 입력해주세요.</div>
				</div>
				<div class="form-group row">
					<input type="tel" class="form-control col-8"
						placeholder="휴대폰 ( '-'제외 )" id="mphone" name="mphone"
						maxlength="11" required>
					<button type="button" class="btn btn-dark offset-1 col-3"
						id="mphonechecker" disabled="disabled">발송</button>
					<div class="valid-feedback"></div>
					<div class="invalid-feedback text-left">휴대폰 번호를 확인해주세요.</div>
				</div>
				<div class="form-group row">
					<input type="text" class="form-control col-8" placeholder="인증번호"
						readonly="readonly" autocomplete="off" maxlength="6" required>
					<button type="button" class="btn btn-dark offset-1 col-3"
						id="validPhoneNumber" disabled="disabled">인증</button>
					<div class="valid-feedback"></div>
					<div class="invalid-feedback text-left">인증번호를 확인해주세요.</div>
				</div>
				
				<div class="form-group row">
					<input type="text" class="form-control col-7" autocomplete="off"
						placeholder="닉네임" id="nic" name="nic" maxlength="15" autofocus
						required>
					<button type="button" class="btn btn-dark offset-1 col-4"
						id="nickchecker" disabled="disabled">중복확인</button>
			
					
				</div>
					<dt>선호 카테고리(선택 제한없음)</dt>
				<div class="form-check-inline mb-3">
				
					<label class="form-check-label"> 
					<input type="checkbox"
						class="form-check-input" value="">게임
					</label>
				</div>
				<div class="form-check-inline mb-3">
					<label class="form-check-label"> <input type="checkbox"
						class="form-check-input" value="">디자인
					</label>
				</div>
				<div class="form-check-inline mb-3">
					<label class="form-check-label"> <input type="checkbox"
						class="form-check-input" value="">도서
					</label>
				</div>
				<div class="form-check-inline mb-3">
					<label class="form-check-label"> <input type="checkbox"
						class="form-check-input" value="">테크
					</label>
				</div>
				<div class="row">
					<div class="col-6">
						<button type="submit" class="btn btn-dark" id="joinbtn">회원가입</button>
					</div>
					<div class="col-4">
						<a href="index" class="btn btn-dark">홈으로</a>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript"></script>
</body>
</html>