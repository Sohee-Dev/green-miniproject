<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 목록 (관리자)</title>
</head>
<body>
	<jsp:include page="a_header.jsp"/>
	<h1>QnA 목록 (관리자 전용)</h1>

	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>상태</th>
			<th>답변관리</th>
		</tr>
		<c:forEach var="qna" items="${qnaList}">
			<tr>
				<td>${qna.qno}</td>
				<td>${qna.qtitle}</td>
				<td>${qna.id}</td>
				<td>${qna.qdate}</td>
				<td>${qna.qstatus}</td>
				<td><c:choose>
						<c:when test="${qna.qstatus eq '대기'}">
							<a href="/admin/answerForm?qno=${qna.qno}">답변 등록</a>
						</c:when>
						<c:otherwise>
							<div style="color: green;">
								<strong>답변:</strong> ${qna.qanswer}
							</div>
						</c:otherwise>
					</c:choose></td>

			</tr>
		</c:forEach>
	</table>

</body>
</html>
