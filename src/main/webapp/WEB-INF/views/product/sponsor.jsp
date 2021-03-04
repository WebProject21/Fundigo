<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   

    <title>funDigo</title>

    <!-- Custom fonts for this template-->
    <link href="../resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="../resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>
<body>
<div class="col-lg-12">

					<c:forEach items="${list}" var="people">
						<div class="card mb-4 py-3 border-left-secondary">
                                <div class="card-body">
                                <c:if test="${people.unkno eq 'A'}">
                                <c:out value="익명님께서 ${people.price }원 후원하셨습니다!"/>
                                </c:if>
                                <c:if test="${people.unkno eq 'B'}">
                                <c:out value="${people.id }님께서 ${people.price }원 후원하셨습니다!"/>
                                </c:if>

                                </div>
                         </div>
					</c:forEach>

                        </div>

</body>
</html>