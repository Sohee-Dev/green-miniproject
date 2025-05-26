<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>주문하기</title>
</head>
<body>
<jsp:include page="../header.jsp" />

<h2>주문하기</h2>
<form action="/order/ordercreate" method="post">
    <!-- 로그인한 회원 아이디 (세션에서 받아와서 넣으면 좋음) -->

    방문하실 분 연락처: <input type="text" name="ophone" required placeholder="실제 방문하시는 분의 연락처를 적어주세요" value="${member.phone }"/> <br><br>

    <table border="1" cellpadding="5" cellspacing="0">
        <tr>
            <th>번호</th>
            <th>이용권명</th>
            <th>가격</th>
            <th>수량</th>
        </tr>
        <c:forEach var="ticket" items="${list}" varStatus="status">
            <tr>
                <td>${status.index + 1}</td>
                <td>${ticket.tname}</td>
                <td><fmt:formatNumber value="${ticket.tprice}" type="number"/>원</td>
                <td>
                    <!-- 이용권 번호를 배열로 보내기 위해 name에 [] 추가 -->
                    <input type="hidden" name="tno[]" value="${ticket.tno}" />
                    <input type="number" name="amount[]" min="0" value="0" style="width:60px;" />
                </td>
            </tr>
        </c:forEach>
    </table>
    <br>
    <button type="submit">주문하기</button>
</form>
<jsp:include page="../footer.jsp" />
</body>
</html>
