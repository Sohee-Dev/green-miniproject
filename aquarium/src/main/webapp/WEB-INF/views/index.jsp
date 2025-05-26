<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index Page</title>
<style>
	body {
	  margin: 0;
	  padding: 0;
	  font-family: 'Noto Sans KR', sans-serif;
	  background: #fff;
	}
	.main-container {
	  display: flex;
	  min-height: calc(100vh - 92px);
	}
	.main-left {
	  flex: 2;
	  background: url('images/sea_index.jpg') center center / cover no-repeat;
	  position: relative;
	  display: flex;
	  align-items: flex-end;
	  justify-content: flex-start;
	}
	.main-left-content {
	  color: #fff;
	  padding: 50px 40px 90px 180px;
	  font-weight: bold;
	  z-index: 2;
	}
	.main-left h1 {
	  font-size: 5.2rem;
	  margin: 0 0 50px 0;
	  line-height: 1.18;
	  letter-spacing: -1px;
	}
	.highlight {
	  font-weight: 900;
	}
	.divider {
	  border: none;
	  border-top: 3px solid #fff;
	  width: 75%;
	  margin-top: 12px;
	}
	.main-right {
	  flex: 1;
	  background: #fff;
	  display: flex;
	  align-items: center;
	  justify-content: center;
	  min-width: 360px;
	}
	.right-inner {
	  display: flex;
	  flex-direction: column;
	  align-items: center;
	  width: 100%;
	}
	.vertical-text {
	  writing-mode: vertical-rl;
	  text-orientation: mixed;
	  font-size: 2rem;
	  font-family: 'Noto Serif KR', serif;
	  font-weight: 600;
	  letter-spacing: 2px;
	  color: #111;
	  margin-bottom: 32px;
	}
	.jellyfish-box {
	  display: flex;
	  align-items: center;
	  justify-content: center;
	  width: 280px;
	  height: 280px;
	  background: #fff;
	  border-radius: 18px;
	  margin-bottom: 24px;
	  box-shadow: 0 2px 12px 0 rgba(80,80,80,0.05);
	}
	.jellyfish-img {
	  width: 260px;
	  height: 260px;
	  object-fit: cover;
	  border-radius: 14px;
	  box-shadow: 0 2px 8px 0 rgba(0,0,0,0.08);
	}
	.year {
	  font-size: 1.15rem;
	  font-weight: 600;
	  color: #111;
	  margin-top: 10px;
	  letter-spacing: 1px;
	}
	@media (max-width: 900px) {
	  .main-container {
	    flex-direction: column;
	  }
	  .main-left, .main-right {
	    flex: unset;
	    min-width: 0;
	    width: 100%;
	    padding: 24px;
	  }
	  .main-left-content {
	    padding: 24px;
	  }
	  .jellyfish-box {
	    width: 100%;
	    max-width: 320px;
	    height: auto;
	  }
	  .jellyfish-img {
	    width: 100%;
	    height: auto;
	    max-width: 300px;
	  }
	}
	
	.main-intro {
	  text-align: center;
	  margin-top: 100px;
	}
	
	.main-intro h1 {
	  font-size: 3.9rem;
	  margin-top: 20px;
	  margin-bottom: 10px;
	  letter-spacing: -1px;
	}
	
	.main-intro .thin {
	  font-weight: 400;
	  color: #888;
	}
	
	.subtitle {
	  font-size: 1.55rem;
	  color: #888;
	  margin-bottom: 18px;
	}
	
	.subtitle .small {
	  font-size: 1.2rem;
	  color: #bbb;
	}
	
	.contents-section {
	  max-width: 900px;
	  margin: 40px auto 80px auto;
	  padding: 0 20px;
	  display: flex;
	  flex-direction: column;
	  gap: 38px;
	}
	
	.contents-row {
	  display: flex;
	  align-items: flex-start;
	  gap: 32px;
	  margin-bottom: 30px;
	}
	
	.contents-image {
	  flex: 1;
	  min-width: 230px;
	}
	
	.contents-image img {
	  width: 100%;
	  max-width: 340px;
	  border-radius: 10px;
	  object-fit: cover;
	  box-shadow: 0 2px 12px 0 rgba(0,0,0,0.10);
	}
	
	.contents-desc {
	  flex: 1.2;
	  display: flex;
	  flex-direction: column;
	  justify-content: flex-start;
	  gap: 18px;
	  min-width: 240px;
	}
	
	.contents-desc h2 {
	  font-size: 3.5rem;
	  font-weight: bold;
	  color: #ffd600;
	  margin: 0 0 8px 0;
	  letter-spacing: 1px;
	  padding-top: 35px;
	}
	
	.contents-desc p {
	  color: #222;
	  font-size: 1.4rem;
	  font-weight: 400;
	  line-height: 1.7;
	  margin: 0 0 16px 0;
	  font-weight: bold;
	}
	
	.contents-image-small img {
	  width: 100%;
	  max-width: 170px;
	  margin-top: 10px;
	  border-radius: 10px;
	  object-fit: cover;
	  box-shadow: 0 2px 8px 0 rgba(0,0,0,0.07);
	}
	
	@media (max-width: 700px) {
	  .contents-section {
	    max-width: 98vw;
	    padding: 0 4vw;
	  }
	  .contents-row {
	    flex-direction: column;
	    align-items: center;
	    gap: 100px;
	  }
	  .contents-desc, .contents-image {
	    min-width: 0;
	    width: 100%;
	    max-width: 100%;
	  }
	  .contents-image img, .contents-image-small img {
	    max-width: 100%;
	  }
	  .contents-desc h2 {
	    font-size: 2.5rem;
	    text-align: center;
	  }
	  .contents-desc p {
	    text-align: center;
	  }
	}
	
	.online-contents {
	  max-width: 1000px;
	  margin: 150px auto 70px auto;
	  padding: 0 20px;
	}
	
	.online-contents-title {
	  font-size: 2rem;
	  font-weight: 800;
	  margin-bottom: 28px;
	  letter-spacing: -1px;
	}
	
	.online-contents-row {
	  display: flex;
	  gap: 32px;
	  justify-content: flex-start;
	  flex-wrap: wrap;
	}
	
	.online-content-card {
	  display: flex;
	  flex-direction: column;
	  width: 340px;
	  background: #fff;
	  border-radius: 6px;
	  text-decoration: none;
	  color: #111;
	  transition: box-shadow 0.14s, transform 0.15s;
	  box-shadow: 0 2px 10px 0 rgba(60,60,60,0.06);
	  cursor: pointer;
	}
	.online-content-card:hover {
	  box-shadow: 0 4px 18px 0 rgba(50,80,200,0.10);
	  transform: translateY(-2px) scale(1.018);
	}
	
	.online-content-img {
	  width: 100%;
	  height: 175px;
	  object-fit: cover;
	  border-radius: 6px 6px 0 0;
	  background: #e5e5e5;
	}
	
	.online-content-text {
	  padding: 16px 14px 18px 14px;
	  display: flex;
	  flex-direction: column;
	  gap: 5px;
	}
	
	.online-content-name {
	  font-size: 1.18rem;
	  font-weight: 700;
	  margin-bottom: 2px;
	}
	
	.online-content-desc {
	  font-size: 1.03rem;
	  color: #444;
	  font-weight: 400;
	  margin-top: 2px;
	}
	
	@media (max-width: 800px) {
	  .online-contents-row {
	    flex-direction: column;
	    gap: 22px;
	    align-items: center;
	  }
	  .online-content-card {
	    width: 98vw;
	    max-width: 360px;
	  }
	}
</style>

</head>
<body>
<jsp:include page="header.jsp" />
<div class="main-container">
    <!-- 왼쪽: 바다 배경 + 텍스트 -->
  <section class="main-left">
    <div class="main-left-content">
      <h1>
        오션랜드<br>
        <span class="highlight">in 부산</span>
      </h1>
      <hr class="divider">
    </div>
  </section>
  <!-- 오른쪽: 세로 텍스트 + 해파리 이미지 + 연도 -->
  <section class="main-right">
    <div class="right-inner">
      <div class="vertical-text">Sea of Busan</div>
      <div class="jellyfish-box">
        <img src="images/jellyfish_index.jpg" alt="해파리" class="jellyfish-img">
      </div>
      <div class="year">2025 |</div>
    </div>
  </section>
  </div>
  
	<!-- 메인 소개/슬로건 영역 (필요시) -->
	<section class="main-intro">
	  <h1><b>Ocean Land</b> <span class="thin">Busan</span></h1>
	  <div class="subtitle">
	    부산 바다를 담다, 오션랜드 부산<br>
	    <span class="small">아름다운 바다 속 세상을 보여드리겠습니다.</span>
	  </div>
	</section>
	
	<!-- 컨텐츠 소개 영역 -->
	<section class="contents-section">
	  <div class="contents-row">
	    <div class="contents-image">
	      <img src="/images/index_img1.jpg" alt="수족관 이미지">
	    </div>
	    <div class="contents-desc">
	      <h2>Contents</h2>
	      <p>오션랜드 부산에서만 즐길 수 있는<br>
	      트렌디한 전시, 공연, 체험을 즐겨보세요.</p>
	    </div>
	  </div>
	  <div class="contents-row">
	    <div class="contents-image">
	      <img src="/images/index_img3.jpg" alt="편의 서비스 이미지">
	    </div>
	    <div class="contents-desc">
	      <h2>Convenience</h2>
	      <p>관람에 집중할 수 있도록<br>
	      최고의 서비스를 제공합니다!</p>
	    </div>
	  </div>
	</section>
	
	<!-- 퀴즈 & 도감 -->
	<section class="online-contents">
	  <h2 class="online-contents-title">온라인 컨텐츠</h2>
	  <div class="online-contents-row">
	    <!-- 카드 1 -->
	    <a class="online-content-card" href="/quiz">
	      <img src="/images/index_card1(game).jpg" alt="해양 퀴즈" class="online-content-img">
	      <div class="online-content-text">
	        <div class="online-content-name">해양 Quiz</div>
	        <div class="online-content-desc">해양 생물 이름 맞추기 게임</div>
	      </div>
	    </a>
	    <!-- 카드 2 -->
	    <a class="online-content-card" href="/userGuide/seaFriends">
	      <img src="/images/index_card(book).jpg" alt="해양 도감" class="online-content-img">
	      <div class="online-content-text">
	        <div class="online-content-name">해양 도감</div>
	        <div class="online-content-desc">오션랜드에 살고 있는 해양 동물 도감</div>
      	 </div>
	    </a>
	  </div>
	</section>
	
  <jsp:include page="footer.jsp" />
</body>
</html>