<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 목록</title>
</head>
<body>
<jsp:include page="../header.jsp" />
	<h1>QnA 목록 사용자용</h1>

	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>상태</th>
		</tr>
		<c:forEach var="qna" items="${qnaList}">
			<tr>
				<td>${qna.qno}</td>
				<td><a href="/board/view?qno=${qna.qno}"> ${qna.qtitle} </a></td>
				<td>${qna.id}</td>
				<td><fmt:formatDate value="${qna.qdate}" pattern="yyyy/MM/dd HH:mm" /></td>
				<td>${qna.qstatus}</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>
