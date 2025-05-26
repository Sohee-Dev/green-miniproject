<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp" />
<h1>마이페이지</h1>
<hr>
<ul>
<li><a href="/order/recentorderlist">최근에 예약한 이용권 목록</a></li>
<li><a href="/board/qnaList">등록한 QNA 목록</a></li>
<li><a href="/modifyPw">회원정보 변경하기</a></li>
</ul>
<jsp:include page="footer.jsp" />
</body>
</html>