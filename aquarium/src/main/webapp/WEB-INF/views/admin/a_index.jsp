<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin_Index</title>
</head>
<body>
<jsp:include page="a_header.jsp"/>

<c:if test="${not empty Login}">
	<script>
		alert("관리자님 환영합니다");
	</script>
</c:if>
<c:if test="${not empty logout}">
	<script>
		alert("정상적으로 로그아웃 되었습니다");
	</script>
</c:if>

</body>
</html>