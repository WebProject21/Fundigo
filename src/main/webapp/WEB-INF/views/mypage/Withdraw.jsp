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
<script type="text/javascript">
function registerCheck() {
    if($.trim($('#midchecker').val()) == '') {
        alert("아이디를 입력해주세요.");
        return false;
    }
    if($.trim($('#password').val()) == '') {
        alert("비밀번호를 입력해주세요.");
        return false;
    }
    if(confirm("회원탈퇴 하시겠습니까?")){
        alert("회원탈퇴처리 ");
         $("form").submit();    
    }
} 
</script>
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
				<c:if test="${msg== false}">
					<p> 다시 한번 확인해주세요 </p>
					</c:if>
				</div>
			
					<div class="form-group">
						<input type="text" autocomplete="username"
							class="form-control offset-1 col-12" placeholder="아이디" id="midchecker" name="id" required>
					</div>
					<div class="form-group">
						<input type="password" class="form-control offset-1 col-12"
							placeholder="비밀번호" id="password" name="password" required>
					</div>

					<div class="form-group offset-1">
						<button type="submit" onclick="registerCheck()" class="btn btn-dark col-8">회원탈퇴</button>
					</div>
					<c:if test="${msgi== false}">
					<p>아이디가 틀렸습니다.</p>
					</c:if>
					

			</div>
			</form>
		
		</div>
	</div>
			
</body>
</html>