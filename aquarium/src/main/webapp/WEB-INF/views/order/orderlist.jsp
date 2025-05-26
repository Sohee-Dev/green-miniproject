<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>주문 내역</title>
</head>
<body>
<jsp:include page="../header.jsp" />

<h2>주문 내역 조회</h2>

<table border="1">
    <tr>
        <th>목차</th><th>주문번호</th><th>날짜</th><th>총액</th>
    </tr>
    <c:forEach var="order" items="${order}" varStatus="status">
        <tr>
        	<td>${(currentPage - 1) * 5 + status.index + 1}</td>
            <td><a href="/order/moreorderlist?ono=${order.ONO}">${order.ONO}</a></td>
            <td>${order.ODATE}</td>
            <td><fmt:formatNumber value="${order.TOTALPRICE}" type="number"/>원</td>
        </tr>
    </c:forEach>
</table>

<!-- 페이지네이션 -->
<div style="margin-top: 20px; text-align: center;">
	<c:if test="${totalPages > 1}">
		<c:if test="${currentPage > 1}">
			<a href="/order/orderlist/1">처음</a>
			<a href="/order/orderlist/${currentPage - 1}">이전</a>
		</c:if>
		<c:forEach var="i" begin="1" end="${totalPages}">
			<c:choose>
				<c:when test="${i == currentPage}">
					<span class="page-btn page-current">${i}</span>
				</c:when>
				<c:otherwise>
					<a href="/order/orderlist/${i}">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${currentPage < totalPages}">
			<a href="/order/orderlist/${currentPage + 1}">다음</a>
			<a href="/order/orderlist/${totalPages}">끝</a>
		</c:if>
	</c:if>
</div>
<a href="/mypage">마이페이지로 가기</a>
<jsp:include page="../footer.jsp" />
</body>
</html>
