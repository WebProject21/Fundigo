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
	<section class = "row list">
		<div class = "CommunityComment_container">
			<div class="CommentUserWrapper_container">
				<div class = "CommentUserWrapper_avater">
					<div class = "CommentWrapper_Main">
						<div class = "CommentUserInfo_container">
							<span class = "CommentUserInfo_name">
								<Strong>${board.id}</Strong>
							</span>
							<span class = "CommentUserInfo_badge">작성자</span>
							<span class = "commentUserInfo_date">
								${board.regDate } <!-- 수정 시에는 어떻게 할 것인가? -->
							</span>
						</div>
						<div class = "CommentTextContent_Container">
							<div class = "CommentTextContent_COntentBox">
								${board.content}
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>