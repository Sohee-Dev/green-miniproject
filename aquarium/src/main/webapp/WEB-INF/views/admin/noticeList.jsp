<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
	<jsp:include page="a_header.jsp"/>
	<h1>Notice 공지사항 페이지</h1>

	<table border="1">
		<tr>
			<th>공지 번호</th>
			<th>공지 제목</th>
			<th>공지 내용</th>
			<th>작성일</th>
			<th>삭제기능</th>
		</tr>
		<c:forEach var="notice" items="${noticeList}">
			<tr>
				<td>${notice.nid}</td>
				<td>${notice.ntitle}</td>
				<td>${notice.ncontent}</td>
				<td><fmt:formatDate value="${notice.ndate}"
						pattern="yyyy/MM/dd HH:mm" /></td>
				<td>
					<form action="/admin/noticeDelete" method="post"
						onsubmit="return confirm('정말 삭제하시겠습니까?');">
						<input type="hidden" name="nid" value="${notice.nid}" /> <input
							type="submit" value="삭제" />
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>
	<a href="/admin/noticeForm">공지사항 등록</a>

</body>
</html>
