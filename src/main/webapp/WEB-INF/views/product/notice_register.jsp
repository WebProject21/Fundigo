<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>funDigo</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
 
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
</head>
<body>
	<input type="hidden" name="pno" value="${product.pno}">
	<div class = "container">
		<form role = "form" action = "/board/notice_register?${product.pno}" method = "post">
			<div class = "col-sm-12 pt-3">
				<div class ="register">
					<div class = "register-header register-header-primary">
						<h4 class = "register-title"><i class = "fas fa-squre"></i>글 작성</h4>
						<p class = "register-catagory"></p>
					</div>
					<div class = "register-body">
						<div class = "table-responsive">
							<table class = "table">
								<tbody>
									<tr style = "line-height: 32px;">
										<td>글 제목</td>
										<td><input type = "text" name = "title" class = "form-control" value="" placeholder = "제목입력"></td>
									</tr>
									<tr>	
										<td>내용 입력</td>
										<td><textarea rows="3" class = "form-control" name = "content" placeholder = "내용입력"></textarea></td>
									</tr>
								</tbody>
							</table>
							<div class = "row" style = "width: 100%; margin: 0px auto;">
							<input type= "submit" value = "글쓰기" />
							<input type = "reset" value="수정" />
							<input type = "button" value="취소" onclick=""/>
							</div>
						</div>
					</div>
				</div>					
			</div>
		</form>
	</div>
</body>
</html>