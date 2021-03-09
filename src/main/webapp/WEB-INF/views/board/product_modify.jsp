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
					<form role = "form" action="/board/product_modify" method="post">
					<div class="form-group">
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
											value='<c:out value="${board.title}"/>'></td>
									</tr>
									<tr>
										<td>내용</td>
										<td><textarea class="form-control" rows="3"
												name='content'><c:out value="${board.content}" /></textarea></td>
									</tr>
									<tr>
										<td><input type = "hidden" class = "formcontrol" name = "regDate" value="${board.regDate}" readonly="readonly"/></td>
										<td><input type = "hidden" class = "formcontrol" name = "pno" value = "${product.pno}">
										<td><input type = "hidden" class = "formcontrol" name = "updateDate" value="${board.updateDate}"></td>
									</tr>
								</tbody>
							</table>
							<button type = "submit" data-oper="modify" class="btn btn-default">수정완료</button>
							<button type = "reset" class="btn btn-danger">초기화</button>
						</div>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>