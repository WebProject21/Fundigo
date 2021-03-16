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
<title>Sign up Page</title>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
function registerCheck() {
    if($.trim($('#nickname').val()) == '') {
        alert("닉네임을 입력해주세요.");
        return false;
    }
    if($.trim($('#midchecker').val()) == '') {
        alert("아이디를 입력해주세요.");
        return false;
    }
    if($.trim($('#password').val()) == '') {
        alert("비밀번호를 입력해주세요.");
        return false;
    }
    if(confirm("회원가입을 하시겠습니까?")){
        alert("회원가입이 완료되었습니다. 감사합니다.");
         $("form").submit();    
    }
} 
/* 아이디 중복 체크 : ajax 비동기처리 */
 function idCheck() {
    var id = $("#midchecker").val();
    if(id.search(/\s/) != -1) { 
        alert("아이디에는 공백이 들어갈 수 없습니다.");        
    } else {             
        if(id.trim().length != 0) {
            $.ajax({
                async : true, 
                type : 'POST', 
                data: id,
                url: "/mypage/idCheck",
                dataType: "json",
                contentType: "application/json; charset=UTF-8",
                success: function(count) {    
                    if(count > 0) {
                        alert("해당 아이디 존재");    
                        $("#submit").attr("disabled", "disabled");
                        window.location.reload();
                    } else {
                        alert("사용가능 아이디");
                        $("#submit").removeAttr("disabled");
                    }            
                },
                error: function(error) {
                    alert("아이디를 입력해주세요.");
                }        
            });
        } else {
            alert("아이디를 입력해주세요.");
        }        
    }
} 

</script> 
<link rel="shortcut icon" href="#">
</head>
<body>
<%@include file="../header.jsp"%>
	<div class="container">
		<!-- not checked color -->
		<div class="col-12 offset-sm-4 col-sm-4 offset-sm-3 p-3 mb-5"
			style="text-align: center; border-radius: 0.5px; margin-top: 5%;">
			<h1>Sign Up Page</h1>
		</div>

		<div class="col-12 offset-sm-2 col-sm-8 p-3"
			style=" border-radius: 10px; text-align: center;">

			<form action="<c:url value='/mypage/JoinPage'/>" method="POST" enctype="multipart/form-data"
				class="col-12 offset-sm-1 col-sm-10 needs-validation" autocomplete="off" novalidate>
				<div class="form-group row">
					<input type="text" class="form-control col-7" autocomplete="off"
						placeholder="아이디" id="midchecker" name="id" maxlength="15" autofocus required>
					<button type="button"  onclick="idCheck()" class="btn btn-dark offset-1 col-4">중복확인</button>
				<div class="valid-feedback"></div>
      			<div class="invalid-feedback text-left">아이디는 5글자 이상으로 영어소문자와 숫자를 사용해주세요.</div>
				</div>
				<div class="form-group row">
					<input type="text" class="form-control col-7" autocomplete="off"
						placeholder="이름" id="name" name="name" maxlength="15" autofocus
						required>
						<div class="valid-feedback"></div>
      			<div class="invalid-feedback text-left"></div>
				</div>
				<div class="form-group row">
					<input type="password" class="form-control" autocomplete="off"
						id="password" name="password" placeholder="비밀번호" maxlength="20" required>
				<div class="valid-feedback"></div>
      			<div class="invalid-feedback text-left">비밀번호는 문자,숫자,특수문자를 포함하여 8글자 이상이어야합니다.</div>
				</div>
				<div class="form-group row">
					<input type="password" class="form-control" autocomplete="off"
						id="repassword" placeholder="비밀번호확인"  maxlength="20" required>
						<div class="valid-feedback"></div>
      			<div class="invalid-feedback text-left">비밀번호를 확인해주세요.</div>
				</div>
				<div class="form-group row">
					<input type="text" class="form-control" placeholder="주소(시군구)"
					id="address" name="address" maxlength="15" required>
				<div class="valid-feedback"></div>
      			<div class="invalid-feedback text-left"></div>
				</div>
				<div class="form-group row">
					<input type="text" class="form-control col-7" autocomplete="off"
						placeholder="닉네임" id="nickname" name="nickname" maxlength="15" autofocus
						required>
						<div class="valid-feedback"></div>
      			<div class="invalid-feedback text-left"></div>
				</div>
				<div class="form-group row">
					<input type="tel" class="form-control col-8" placeholder="휴대폰 ( '-'제외 )" id="phone" name="phone" maxlength="11" required>
				<button type="button" class="btn btn-dark offset-1 col-3" id="mphonechecker" disabled="disabled">발송</button>
				<div class="valid-feedback"></div>
      			<div class="invalid-feedback text-left">휴대폰 번호를 확인해주세요.</div>
				</div>
				<div class="form-group row">
					<input type="text" class="form-control col-8" placeholder="인증번호"
						readonly="readonly" autocomplete="off" maxlength="6" required>
					<button type="button" class="btn btn-dark offset-1 col-3" id="validPhoneNumber" disabled="disabled">인증</button>
					<div class="valid-feedback"></div>
      			<div class="invalid-feedback text-left">인증번호를 확인해주세요.</div>
				</div>

				<dt>선호 카테고리(선택 제한없음)</dt>
				<div class="form-check-inline mb-3">

					<label class="form-check-label"> <input type="checkbox"
						class="form-check-input" name= "tag" value="g">게임
					</label>
				</div>
				<div class="form-check-inline mb-3">
					<label class="form-check-label"> <input type="checkbox"
						class="form-check-input" name= "tag" value="d">디자인
					</label>
				</div>
				<div class="form-check-inline mb-3">
					<label class="form-check-label"> <input type="checkbox"
						class="form-check-input" name= "tag" value="l">생활
					</label>
				</div>
				<div class="form-check-inline mb-3">
					<label class="form-check-label"> <input type="checkbox"
						class="form-check-input" name= "tag" value="t">테크
					</label>
				</div>
					</form>
				<div class="row mb-5">
					<div class="col-6">
						<button type="button" id="submit" class="btn btn-dark"  disabled="disabled" onclick="registerCheck()">회원가입</button>
					</div>
					<div class="col-4">
					<button type="button" id="submit" class="btn btn-dark"onclick="location.href='/'" >홈으로</button>
					</div>
				</div>

		</div>
	</div>
	<%@include file="../footer.jsp"%>
	<script type="text/javascript" src="../resources/js/login/memberJS.js"></script>
	 
	 
</body>
</html>