<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
<jsp:include page="../header.jsp" />
	<h1>Notice 공지사항 페이지</h1>

	<table border="1">
		<tr>
			<th>공지 번호</th>
			<th>공지 제목</th>
			<th>공지 내용</th>
			<th>작성일</th>
			
		</tr>
		<c:forEach var="notice" items="${noticeList}">
			<tr>
				<td>${notice.nid}</td>
				<td>${notice.ntitle}</td>
				<td>${notice.ncontent}</td>
				<td><fmt:formatDate value="${notice.ndate}" pattern="yyyy/MM/dd HH:mm" /></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>
