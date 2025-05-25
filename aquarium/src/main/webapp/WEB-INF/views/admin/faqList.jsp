<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 목록 (관리자)</title>
</head>
<body>
	<jsp:include page="a_header.jsp"/>
	<h1>FAQ 목록 (관리자 전용)</h1>

	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="faq" items="${faqList}" varStatus="">
			<tr>
				<td>${faq.fno}</td>
				<td>${faq.ftitle}</td>
				<td>${faq.fcontent}</td>
				<td>
					<form action="/admin/faqDelete" method="post"
						onsubmit="return confirm('정말 삭제하시겠습니까?');">
						<input type="hidden" name="fno" value="${faq.fno}" /> <input
							type="submit" value="삭제" />
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>
	<a href="/admin/faqForm">FAQ 등록</a>

</body>
</html>
