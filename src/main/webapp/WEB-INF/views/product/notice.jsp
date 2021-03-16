<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>funDigo</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/bootstrap-grid.min.css">
<link rel="stylesheet" type="text/css" href="../resources/css/board/boardform.css">
<link rel="stylesheet" type="text/css" href="../resources/css/bootstrap.min.css">
</head>
<body>
	<input type="hidden" name="pno" value="${product.pno}">
	<main class="board_wrap">
		<div class="board_title">
			<strong>공지사항</strong>
			<p>문의 및 건의사항을 작성해주세요!</p>
			
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
							<td><a class = "move" href='<c:out value="${board.bno}"/>'><c:out value="${board.title}" /></a></td>
							<td><c:out value="${board.id}" /></td>
							<td><c:out value="${board.regDate}" /></td>
							<td><c:out value="${board.readCount}" /></td>
						</tr>
					</c:forEach>
				</table>
					<div class = 'pull-right'style = "margin: 0 auto;">
						<ul class = "pagenation" style = "list-style-type:none; float: left;">
							<c:if test = "${pageMaker.prev}">
								<li class = "paginate_button previous">
									<a href= "${pageMaker.endPage -1}">이전</a>
								</li>
							</c:if>
							<c:forEach var = "num" begin = "${pageMaker.startPage}" end = "${pageMaker.endPage}">
								<li class = "paginate_button ${pageMaker.cri.pageNum == num ? 'active':''}" style = "list-style-type:none; float: left; outline: 1px dotted red;
								margin-left: 5px" ><a href = "${num}">${num}</a></li>
							</c:forEach>
							<c:if test = "${pageMaker.next}">
								<li class = "paginate_button next">
									<a href="${pageMaker.endPage +1}">다음</a>
								</li>
							</c:if>
						</ul>
					</div>
					<!--  end Pagination -->
					<!-- Modal 추가 -->
					<div class = "modal fade" id = "myModal" tabindex="-1" role = "dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class = "modal-dialog">
							<div class = "modal-content">
								<div class = "modal-header">
									<button type = "button" class = "close" data-dismiss="modal" aria-hidden="true">&times;</button>
									<h4 class = "modal-title" id = "myModalLabel">알림창</h4>
								</div>
								<div class = "modal-body">처리가 완료되었습니다.</div>
								<div class = "modal-footer">
									<button type = "button" class = "btn btn-default" data-dismiss="modal">닫기</button>
									<button type = "button" class = "btn btn-primary">다시 저장하기</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!--/. modal -->
					<form id = 'actionForm' action = "/product/notice" method = "get">
						<input type = "hidden" name = "pno" value = "${product.pno}">
						<input class="id" type = "hidden" name = "id" value = "${id}">						
						<input type = "hidden" name = "pageNum" value = "${pageMaker.cri.pageNum}">
						<input type = "hidden" name = "amount" value = "${pageMaker.cri.amount}">
					</form>
				<a href="/product/notice_register?pno=${product.pno }&id=${id}" class = "btn btn-primary pull-right">글쓰기</a>
			</div>
		</div>
	</main>
	<script type="text/javascript">
		$(document).ready(function(){
			var result = '<c:out value = "${result}"/>';
			checkModal(result);
			history.replaceState({},null,null);
			function checkModal(result){
				if(result === '' || history.state){
					return;
				}
				if(parseInt(result)>0){
					$(".modal-body").html("게시글"+parseInt(result)+"번이 등록되었습니다.");
				}
				$("#myModal").modal("show");
			}
			$("#regBtn").on("click", function(){
				self.location = "/product/notice_register?pno='${product.pno}'&id='${id}'";
			});
			
			var actionForm = $("#actionForm");
			$(".paginate_button a").on("click", function(e){
				e.preventDefault();
				console.log('click');
				actionForm.find("input[name='pageNum']").val($(this).attr("href"));
				actionForm.submit();
			});
			$(".move").on("click", function(e){
				e.preventDefault();
				$('input').remove('.id');
				actionForm.append("<input type = 'hidden' name = 'bno' value = '"+$(this).attr("href")+"'>");
				actionForm.attr("action","/board/view");
				actionForm.submit();
			});
		});
	</script>
</body>
</html>