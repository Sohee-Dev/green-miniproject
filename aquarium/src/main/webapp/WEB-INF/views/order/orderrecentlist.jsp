<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../header.jsp" />
<h2>최근에 예약한 목록</h2>
<table border="1">
    <tr>
    	<th>목차</th>
        <th>주문번호</th>
        <th>주문일</th>
        <th>총금액</th>
    </tr>
    <c:forEach var="o" items="${list}" varStatus="status">
    <tr>
    	<td>${status.index+1 }</td>
        <td><a href="/order/moreorderlist?ono=${o.ONO}">${o.ONO}</a></td>
        <td>${o.ODATE}</td>
        <td><fmt:formatNumber value="${o.TOTALPRICE}" type="number"/>원</td>
    </tr>
</c:forEach>
</table>
<a href="/order/orderlist/1">더보기</a>
<jsp:include page="../footer.jsp" />
</body>
</html>