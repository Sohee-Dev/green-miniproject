<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
</head>
<body>
<jsp:include page="../header.jsp" />
	<h1>고객센터</h1>

	<h2>검색</h2>
	<form action="search" method="get">
		<input type="text" name="keyword">
		<input type="submit" value="검색">
	</form>
	<a href="">FAQ</a>
	<a href="">Q&A</a>
	<h2>FAQ 자주 찾는 도움말</h2>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>내용</th>
		</tr>
		<c:forEach var="faq" items="${faqList}" varStatus="status">
			<tr>
				<td>${status.count}</td>
				<td>${faq.ftitle}</td>
				<td>${faq.fcontent}</td>
			</tr>
		</c:forEach>
	</table>

	<h2>QNA 질문 등록</h2>
	<form action="/board/qnaInsert" method="post">
    <table border="1">
        <tr>
            <td>제목</td>
            <td><input type="text" name="qtitle" placeholder="제목을 입력하세요" required /></td>
        </tr>
        <tr>
            <td>내용</td>
            <td><textarea name="qcontent" rows="5" placeholder="질문 내용을 입력하세요" required></textarea></td>
        </tr>
        <tr>
            <td>질문 유형</td>
            <td>
                <select name="qtype">
                    <option value="결제">결제</option>
                    <option value="서비스">서비스</option>
                    <option value="기타">기타</option>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center;">
                <button type="submit">질문 등록</button>
            </td>
        </tr>
    </table>
    
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
</form>
</body>
</html>
