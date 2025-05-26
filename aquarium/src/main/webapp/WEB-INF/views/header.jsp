<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>


<style>
	.header {
	  width: 100vw;
	  border-bottom: 2.5px solid #96c4ff;
	  background: #fff;
	  position: sticky; /* 스크롤해도 상단 고정 */
	  top: 0;
	  z-index: 1000;
	}
	.header-wrap {
	  max-width: 1200px;
	  margin: 0 auto;
	  padding: 0 32px;
	  height: 90px;
	  display: flex;
	  align-items: center;
	  justify-content: space-between;
	}
	
	/* 좌측 로고영역 */
	.header-logo {
	  display: flex;
	  align-items: center;
	  text-decoration: none;
	  margin-right: 24px;
	}
	.logo-title {
	  background: #111;
	  color: #fff;
	  border-radius: 2px;
	  padding: 4px 18px 2px 18px;
	  display: flex;
	  flex-direction: column;
	  align-items: flex-start;
	}
	.logo-main {
	  font-weight: 700;
	  font-size: 1.18rem;
	  letter-spacing: 0.5px;
	}
	.logo-sub {
	  font-size: 0.85rem;
	  color: #cfcfcf;
	  font-weight: 400;
	  margin-top: -2px;
	}
	
	/* 네비게이션 메뉴 */
	.nav ul {
	  display: flex;
	  align-items: center;
	  gap: 8px;
	  margin: 0;
	  padding: 0;
	  list-style: none;
	}
	.nav li {
	  margin: 0 2px;
	}
	.nav-item {
	  font-size: 1.12rem;
	  color: #222;
	  font-weight: 500;
	  background: #fff;
	  padding: 15px 32px;
	  border: none;
	  border-radius: 0;
	  text-decoration: none;
	  transition: background 0.33s cubic-bezier(0.6,0,0.2,1);
	  cursor: pointer;
	}
	.nav-item:hover {
	  background: linear-gradient(90deg, #e3f1ff 0%, #f5f5f5 100%);
	  border-radius: 20px; /*20 or 30 선택*/
	}
	
	/* 우측 인증(로그인/회원가입) */
	.header-auth {
	  display: flex;
	  align-items: center;
	  gap: 18px;
	}
	.auth-link {
	  color: #888;
	  text-decoration: none;
	  font-size: 1rem;
	  font-weight: 400;
	  transition: color 0.15s;
	}
	.auth-link:hover {
	  color: #96c4ff;
	}
	
	/* 반응형 */
	@media (max-width: 900px) {
	  .header-wrap {
	    flex-direction: column;
	    height: auto;
	    padding: 0 10px;
	    gap: 8px;
	  }
	  .nav ul {
	    gap: 2px;
	  }
	  .nav-item {
	    padding: 10px 10px;
	    font-size: 1rem;
	  }
	}
	.header-auth {
	  display: flex;
	  flex-direction: column;
	  align-items: flex-end; /* 오른쪽 정렬 */
	  gap: 0; /* 줄 간격 필요시 조정 */
	}
	.header-auth .auth-btn-row {
	  display: flex;
	  gap: 16px;
	}

	.auth-btn-row {
	  display: flex;
	  gap: 16px; /* 버튼 사이 여백, 필요에 따라 조정 */
	}
</style>

<!-- 헤더 시작 -->
<header class="header">
  <div class="header-wrap">
    <!-- 좌측: 로고/사이트명 -->
    <a href="/" class="header-logo">
  		<img src="/images/logo2.png" alt="Ocean Land 로고" style="height:65px; width:auto; display:block;">
	</a>
    <!-- 중앙: 메뉴 -->
    <nav class="nav">
      <ul>
        <li><a class="nav-item" href="/ticket/ticketlist">이용권</a></li>
        <li><a class="nav-item" href="/userGuide/playing">전시·체험·공연</a></li>
        <li><a class="nav-item" href="/userGuide/main">이용 안내</a></li>
        <li><a class="nav-item" href="/board/noticeList/1">공지사항</a></li>
        <li><a class="nav-item" href="/board/service_center/1">고객센터</a></li>
      </ul>
    </nav>
    <!-- 우측: 인증영역 -->
    <div class="header-auth">
      <c:choose>
        <c:when test="${not empty sessionScope.id}">
          <div class="auth-btn-row">
		    <a class="auth-link" href="/logout">로그아웃</a>
		    <a class="auth-link" href="/mypage">마이페이지</a>
		  </div>
		  <div style="margin-top:6px; color:#5170fc; font-weight:500; font-size:0.98rem;">
		    [${sessionScope.name}] 회원님 환영합니다 🤗
		  </div>
        </c:when>
        <c:otherwise>
          <div class="auth-btn-row">
		    <a class="auth-link" href="/loginForm">로그인</a>
		    <a class="auth-link" href="/joinForm">회원가입</a>
		  </div>
        </c:otherwise>
      </c:choose>
    </div>
  </div>
</header>

