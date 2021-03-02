<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv = "X-UA-Compatible" content="ie=edge">
<title>funDigo</title>
<link rel="stylesheet" type="text/css" href="../css/boardform.css?after">
</head>
<body>
	<input type = "hidden" name = "pno" value="${product.pno}">
	<main class ="board_wrap">
		<div class = "board_title">
			<strong>공지사항</strong>
			<p>문의 및 건의사항을 작성해주세요!</p>
		</div>
		<div class = "board_list_wrap">
			<div class = "board_list">
				<div class = "top">
					<div class = "num">번호</div>
					<div class = "title">제목</div>
					<div class = "id">글쓴이</div>
					<div class = "date">작성일</div>
					<div class = "count">조회</div>
				</div>
				<div>
					<div class = "num">5</div>
					<div class = "title"><a href = "#">글 제목이 들어갑니다.</a></div>
					<div class = "id">테스트</div>
					<div class = "date">2021/02/28</div>
					<div class = "count">1</div>
				</div>
				<div>
					<div class = "num">4</div>
					<div class = "title"><a href = "#">글 제목이 들어갑니다.</a></div>
					<div class = "id">테스트</div>
					<div class = "date">2021/02/28</div>
					<div class = "count">1</div>
				</div>
				<div>
					<div class = "num">3</div>
					<div class = "title"><a href = "#">글 제목이 들어갑니다.</a></div>
					<div class = "id">테스트</div>
					<div class = "date">2021/02/28</div>
					<div class = "count">1</div>
				</div>
				<div>
					<div class = "num">2</div>
					<div class = "title"><a href = "#">글 제목이 들어갑니다.</a></div>
					<div class = "id">테스트</div>
					<div class = "date">2021/02/28</div>
					<div class = "count">1</div>
				</div>
				<div>
					<div class = "num">1</div>
					<div class = "title"><a href = "#">글 제목이 들어갑니다.</a></div>
					<div class = "id">테스트</div>
					<div class = "date">2021/02/28</div>
					<div class = "count">1</div>
				</div>
			</div>
			<div class = "board_page">
				<a href="#" class = "bt first">&lt;&lt;</a>
				<a href="#" class = "bt prv">&lt;</a>
				<a href="#" class = "num on">1</a>
				<a href="#" class = "num">2</a>
				<a href="#" class = "num">3</a>
				<a href="#" class = "num">4</a>
				<a href="#" class = "num">5</a>
				<a href="#" class = "bt next">&gt;</a>
				<a href="#" class = "bt last">&gt;&gt;</a>
			</div>
			<form method = "post" action = "#" class = "bt_wrap">
				<input type = "submit" class = "on" value = "등록">
				<a href = "a" class = "on">등록</a>
				<!-- <a href = "a">수정</a> -->
			</form>
		</div>
	</main>
</body>
</html>