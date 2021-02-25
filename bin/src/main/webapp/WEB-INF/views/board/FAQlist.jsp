<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv = "X-UA-Compatible" content="ie=edge">
<title>funDigo</title>
<meta name = "keywords" content="funding, 펀딩, 클라우드 펀딩">
<meta name = "description" content="funding any where to buy item">
<meta name = "robots" content="index, follower">
<script src = "js/all.min.js"></script>

<script  src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script src = "js/main.js"></script>

<!--  bootstrap grid 그리드 적용을 위한 부트스트랩 적용 -->

<link rel="stylesheet" type="text/css" href="css/bootstrap-grid.min.css">
<link rel="stylesheet" type="text/css" href="css/main.css?after"> <!-- 폰트 css -->
</head>
<body>
	<div class = "row">
		<div class = "col-lg-12">
			<div class = "panel panel-default">
				<h1 class = "page-header">Tables</h1>
			</div>		
		</div>
	</div>
	<div class = row>
		<div class = "panel panel-default">
			<div class = "panel-heading">Board FAQlist page</div>
			<div class = "panel-body">
				<table class = "table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>#번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>수정일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<c:forEach items="${list}" var = "board">
						<tr>
							<td><c:out value="${board.bno}"/></td>
							<td><c:out value="${board.title}"/></td>
							<td><c:out value="${board.id}"/></td>
							<td><c:out value="${board.regDate}"/></td>
							<td><c:out value="${board.updateDate}"/></td>
							<td><c:out value="${board.readCount}"/></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>