<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>funDigo</title>

    <!-- Theme Stylesheet -->

    <link href="../resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="../resources/css/bootstrap-grid.min.css" rel="stylesheet">

</head>
<body>
	<div class="container-fluid col-lg-12">

		<c:forEach items="${list}" var="people">
			<div class="card col-lg-12">
				<div class="card-body">
					<c:if test="${people.unkno eq 'A'}">
						<c:out value="익명님께서 ${people.price }원 후원하셨습니다!" />
					</c:if>
					<c:if test="${people.unkno eq 'B'}">
						<c:out value="${people.id }님께서 ${people.price }원 후원하셨습니다!" />
					</c:if>

				</div>
			</div>
		</c:forEach>

	</div>

</body>
</html>