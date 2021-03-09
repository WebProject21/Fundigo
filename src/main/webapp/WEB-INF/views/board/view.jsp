<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fundigo</title>
</head>
<body>
	<c:choose>
		<c:when test="${board.bd_type == 'NOTI'}">
			<c:set var="list_type" value="notice" />
		</c:when>
		<c:when test="${board.bd_type == 'COMM'}">
			<c:set var="list_type" value="community" />
		</c:when>
	</c:choose>
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">
				Board Read
			</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="table-panel">
						<table class="table">
							<tbody>
								<tr>
									<td>번호</td>
									<td><input class="form-control" name="bno"
										value='<c:out value = "${board.bno}"/>' readonly="readonly"></td>
									<td>id</td>
									<td><input class="form-control" name="id"
										value='<c:out value = "${board.id}"/>' readonly="readonly"></td>
								</tr>
								<tr style="line-height: 32px;">
									<td>글 제목</td>
									<td><input class="form-control" name="title"
										value='<c:out value="${board.title}"/>' readonly="readonly"></td>
								</tr>
								<tr>
									<td>내용</td>
									<td><textarea class="form-control" rows="3" name='content' readonly="readonly"><c:out
												value="${board.content}" /></textarea></td>
								</tr>
							</tbody>
						</table>

						<button data-oper='modify' class="btn btn-default">수정</button>
						<button data-oper='list' class="btn btn-default"
							onclick="location.href='http://localhost:8181/product/<c:out value="${list_type}"/>?pno=${product.pno}&id=${board.id}'">목록</button>
						<form id = "operForm" action = "/board/product_modify" method = "get">
							
							<input type="hidden" id = "pno" name = "pno" value="${product.pno}">
							<input type="hidden" id = "bno" name = "bno" value="${board.bno}">
						</form>	
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function(){
			var operForm = $("#operForm");
			$("button[data-oper = 'modify']").on("click", function(e){
				operForm.attr("action", "/board/product_modify").submit();
			});
			
			$("button[data-oper=""]").on("click", function(e){
				operForm.find("#bno").remove();
			})
		});
	</script>
</body>
</html>