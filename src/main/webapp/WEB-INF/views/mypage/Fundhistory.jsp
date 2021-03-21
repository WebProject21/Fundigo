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

		<div class="row">
		<jsp:include page="menu.jsp" />
			<!-- DataTales Example -->
			<div class="offset-1 col-xs-10 col-md-5 p-5"
				style="text-align: center; border-radius: 0/.5px; margin-top: 10%;">

				<div class="card-body">
					<div class="table-responsive">
						<h3>관심목록</h1>
						<table class="table table-striped table-boardered table-hover">
							<thead>
								<tr>
									<th>번호</th>
									<th>펀딩일자</th>
									<th>가격</th>
									<th>펀딩타입</th>
									<th>펀딩취소</th>
								</tr>
							</thead>
							<c:choose>
							
					  	 <c:when test="${getfund!=null}"> 
							
							<c:if test="${pno!=null}">
							<p>${pno} 펀딩이 취소되었습니다.</p>
							</c:if>
							<c:forEach items="${getfund}" var="getfund">
								<tr>
									<td><c:out value="${getfund.pno}" /></td>
									<td><c:out value="${getfund.dates}" /></td>
									<td><c:out value="${getfund.price}" /></td>
									<td><c:out value="${getfund.code}" /></td>
									<td><button type = "button" value="삭제" onclick="location.href='/mypage/fund_remove?pno=${getfund.pno}'">취소</button></td> 
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
	</div>
	<%@include file="../footer.jsp"%>
</body>
</html>