<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- Font  -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- <script  src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
<html>
<head>
<meta charset="UTF-8">
<title>Favorite</title>
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
<form action="Favorite" method="post" enctype="multipart/form-data">
		<div class="row">
		<jsp:include page="menu.jsp" />
	
			<div class="offset-1 col-xs-10 col-md-5 p-5"
				style="text-align: center; border-radius: 0/.5px; margin-top: 10%;">

				<div class="card-body">
					<div class="table-responsive">
						<h3>관심목록</h1>
						<table class="table table-striped table-boardered table-hover">
							<thead>
								<tr>
									<th>번호</th>
									<th>제품번호</th>
									<th>담은날짜</th>
									<th>비우기</th>
								</tr>

							</thead>
							<c:choose>

					 <c:when test="${getfavorite!=null}"> 
							<c:forEach items="${getfavorite}" var="getfavorite">
								<tr>
									<td><c:out value="${getfavorite.fav_count}" /></td>
									<td><c:out value="${getfavorite.pno}" /></td>
									<td><c:out value="${getfavorite.dates}" /></td> 
									<td><button type = "button" value="삭제" onclick="location.href='/mypage/Favorite_delete?pno=${getfavorite.pno}'">취소</button></td>
								<tr>
							</c:forEach>
					  	</c:when> 
					  	<c:otherwise>관심 목록이 없습니다.</c:otherwise>
					  	</c:choose>
							<!-- </table> -->
						</table>
					</div>
					<ul class="pagination justify-content-center">
						<li class="page-item"><a class="page-link"
							href="javascript:void(0);">Previous</a></li>
						<li class="page-item"><a class="page-link"
							href="javascript:void(0);">1</a></li>
						<li class="page-item"><a class="page-link"
							href="javascript:void(0);">2</a></li>
						<li class="page-item"><a class="page-link"
							href="javascript:void(0);">Next</a></li>
					</ul>
					<!-- end panel body -->
				</div>
				<!-- end panel-->
			</div>

		</div>
		</form>
	</div>
	<%@include file="../footer.jsp"%>
</body>
</html>