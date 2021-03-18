<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>funDigo</title>

<link rel="stylesheet" type="text/css"
	href="../resources/css/bootstrap-grid.min.css">
<link rel="stylesheet" type="text/css"
	href="../resources/css/board/boardform.css">
<link rel="stylesheet" type="text/css"
	href="../resources/css/bootstrap.min.css">

<meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Google Font -->

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700|Raleway:400,300,500,700,600'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css"
	type="text/css">
</head>
<body>

	<%@include file="../header.jsp"%>
	
		<div class="container col-lg-8">
		<p>
		<div class="board_title">
			<h4><strong>질문게시판</strong></h4>
			<p>질문사항을 작성해주세요!</p>

			<c:out value="${count}" />
		</div>
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

		
				<!--  end Pagination -->
				
			</div>
			<div class = "container">
					<div class="row">
					<div class = "col-sm"></div>
					<div class = "col-sm">
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
								<li class='page-item ${pageMaker.cri.pageNum == num ? "active" : "" }'><a
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
					<form id='actionForm' action="/board/faq" method="get">
					<input class="id" type="hidden" name="id" value="${id}"> <input
						type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				</form>
				<div class = "col-sm">
				<a href="/board/faq_register?id=${id}"
					class="btn btn-outline-secondary pull-right">글쓰기</a>
					</div>
					</div>
					</div>
		
</div>
	<%@include file="../footer.jsp"%>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							var result = '<c:out value = "${result}"/>';
							$("#regBtn")
									.on(
											"click",
											function() {
												self.location = "/board/faq_register?id='${id}'";
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
														"/board/faq_view");
												actionForm.submit();
											});
						});
	</script>
</body>
</html>