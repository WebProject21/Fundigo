<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>funDigo</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/bootstrap-grid.min.css">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/boardform.css">
</head>
<body>
	<input type = "hidden" name = "pno" value="${product.pno}">
	<main class ="board_wrap">
		<div class = "board_title">
			<strong>공지사항</strong>
			<p>문의 및 건의사항을 작성해주세요!</p>
		</div>
		<div class = "container">
			<div class = "row">
				<div class = "panel-body">
					<table class = "table table-striped">
						<thead>
							<tr>
								<td>번호</td>
								<td>제목</td>
								<td>작성자</td>
								<td>작성일</td>
								<td>조회수</td>								
							</tr>
						</thead>
						<c:forEach items = "${list}" var = "board">
							<tr>
								<td><c:out  value = "${board.bno}"/></td>
								<td><c:out value = "${board.title}"/></td>
								<td><c:out value = "${board.id}"/></td>
								<td><c:out value = "${board.regDate}"/></td>
								<td><c:out value = "${board.readCount}"/></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</main>
</body>
</html>