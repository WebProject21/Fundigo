<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

	<%-- 
	<div class="container">
		<div class="row">
			<jsp:include page="menu.jsp" />
			<div class="offset-1 col-xs-10 col-md-5 p-5"
				style="text-align: center; border-radius: 0/.5px; margin-top: 10%;">
				<div class="m-3">
				<h1>Favorite</h1>
				</div>
				
				<form action="withdraw" method="POST">
					<div class="form-group">
						<input type="text" autocomplete="username"
							class="form-control offset-1 col-10" placeholder="아이디" name="mid">
					</div>
					<div class="form-group">
						<input type="password" class="form-control offset-1 col-10"
							placeholder="비밀번호" name="mpw">
					</div>

					<div class="form-group">
						<button type="submit" class="btn btn-dark col-8">회원탈퇴</button>
					</div>

				</form>
			</div>
		</div>
	</div>
	 --%>
	<div class="container">

		<div class="row">
<jsp:include page="menu.jsp" />
			<!-- DataTales Example -->
			<div class="offset-1 col-xs-10 col-md-5 p-5"
				style="text-align: center; border-radius: 0/.5px; margin-top: 10%;">

				<div class="card-body">
					<div class="table-responsive">
						<h3>펀딩목록</h1>
						<table class="table table-striped table-boardered table-hover">
							<thead>
								<tr>
									<th>번호</th>
									<th>#제품번호</th>
									<th>펀딩일자</th>
								</tr>

							</thead>

							<c:forEach items="${list}" var="board">
								<tr>
									<td><c:out value="${member.pno}" /></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd"
											value="${member.dates }" /></td>
								
								<tr>
							</c:forEach>
							<!-- </table> -->
						</table>
					</div>
					<!-- end panel body -->
				</div>
				<!-- end panel-->
			</div>

		</div>
	</div>
</body>
</html>