<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>funDigo</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="../resources/css/bootstrap-grid.min.css">
<link rel="stylesheet" type="text/css"
	href="../resources/css/board/boardform.css">
<link rel="stylesheet" type="text/css"
	href="../resources/css/bootstrap.min.css">
</head>
<body>
	<input type="hidden" name="pno" value="${product.pno}">
	<main class="board_wrap">
		<div class="board_title">
			<strong>커뮤니티</strong>
			<p>자유롭게 대화할 수 있습니다.</p>

			<c:out value="${count}" />
		</div>
		<div class="container">
			<div class="row">
				<table class="table table-striped">
					<thead>
						<tr>
							<td>번호</td>
							<td>제목</td>
							<td>작성자</td>
							<td>작성일</td>
							<td>조회수</td>
						</tr>
					</thead>
					<c:forEach items="${list}" var="board">
						<tr>
							<td><c:out value="${board.bno}" /></td>
							<td><a class="move" href='<c:out value="${board.bno}"/>'><c:out
										value="${board.title}" /></a></td>
							<td><c:out value="${board.id}" /></td>
							<td><c:out value="${board.regDate}" /></td>
							<td><c:out value="${board.readCount}" /></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-sm"></div>
					<div class="col-sm">
						<nav aria-label="Page navigation">
							<ul class="pagination justify-content-center">
								<c:if test="${pageMaker.prev }">
									<li class="page-item"><a class="page-link"
										href="${pageMaker.startPage -1 }" aria-label="Previous"> <span
											aria-hidden="true">&laquo;</span> <span class="sr-only">Previous</span>
									</a></li>
								</c:if>

								<c:forEach var="num" begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }">
									<li
										class='page-item ${pageMaker.cri.pageNum == num ? "active" : "" }'><a
										class="page-link" href="${num }">${num }</a></li>
								</c:forEach>

								<c:if test="${pageMaker.next }">
									<li class="page-item"><a class="page-link" href="#"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span>
											<span class="sr-only">Next</span>
									</a></li>
								</c:if>
							</ul>
						</nav>
					</div>
					<form id='actionForm' action="/product/community" method="get">

						<input class="id" type="hidden" name="id" value="${id}"> <input
							type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
						<input type="hidden" name="pno" value="${product.pno}">
					</form>
					<div class="col-sm">
						<a href="/product/community_register?id=${id}&pno=${product.pno}"
							class="btn btn-outline-secondary pull-right">글쓰기</a>
					</div>
				</div>
			</div>
		</div>
	</main>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							var result = '<c:out value = "${result}"/>';
							$("#regBtn")
									.on(
											"click",
											function() {
												self.location = "/product/community_register?pno='${product.pno}'&id='${id}'";
											});

							var actionForm = $("#actionForm");
							$(".page-item a").on(
									"click",
									function(e) {
										e.preventDefault();
										console.log('click');
										actionForm
												.find("input[name='pageNum']")
												.val($(this).attr("href"));
										actionForm.submit();
									});
							$(".move")
									.on(
											"click",
											function(e) {
												e.preventDefault();
												$('input').remove('.id');
												actionForm
														.append("<input type = 'hidden' name = 'bno' value = '"
																+ $(this).attr(
																		"href")
																+ "'>");
												actionForm.attr("action",
														"/board/view");
												actionForm.submit();
											});
						});
	</script>
</body>
</html>