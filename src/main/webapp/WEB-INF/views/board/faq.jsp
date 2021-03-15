<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>funDigo</title>
<link rel="stylesheet" type="text/css" href="../resources/css/bootstrap-grid.min.css">
<link rel="stylesheet" type="text/css" href="../resources/css/board/boardform.css">
<link rel="stylesheet" type="text/css" href="../resources/css/bootstrap.min.css">
</head>
<body>
	<input type="hidden" name="id" value="${board.id}">
	<main class="board_wrap">
		<div class="board_title">
			<strong>질문게시판</strong>
			<p>질문사항을 작성해주세요!</p>
			
			<c:out value="${count}"/>
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
							<td><a href='/board/faq_view?&bno=<c:out value="${board.bno}"/>'><c:out value="${board.title}" /></a></td>
							<td><c:out value="${board.id}" /></td>
							<td><c:out value="${board.regDate}" /></td>
							<td><c:out value="${board.readCount}" /></td>
						</tr>
					</c:forEach>
				</table>
				<a href="/product/faq_register?id=${id}" class = "btn btn-primary pull-right">글쓰기</a>
			</div>
		</div>
	</main>
</body>
</html>