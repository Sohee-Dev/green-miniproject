<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>주문 내역</title>
</head>
<body>
<jsp:include page="../header.jsp" />

<h2>상세 주문내역</h2>

<table border="1">
    <tr>
        <th>목차</th><th>주문번호</th><th>날짜</th><th>총액</th><th>이용권 이름</th><th>수량</th>
    </tr>
    <c:forEach var="moreorder" items="${moreorder}" varStatus="status">
        <tr>
        	<td>${status.index+1}</td>
            <td>${moreorder.ONO}</td>
            <td>${moreorder.ODATE}</td>
            <td><fmt:formatNumber value="${moreorder.TOTALPRICE}" type="number"/>원</td>
            <td>${moreorder.TNAME }</td>
            <td>${moreorder.AMOUNT }</td>
        </tr>
    </c:forEach>
</table>
<a href="/order/orderlist/1">뒤로 가기</a>
<jsp:include page="../footer.jsp" />
</body>