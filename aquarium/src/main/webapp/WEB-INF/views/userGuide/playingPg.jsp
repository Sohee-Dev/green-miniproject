<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PlayingPage</title>

<style>
    input[type="radio"] {
        display: none; /* 라디오 버튼 숨김 */
    }

    .tabs {
        display: flex;
        gap: 10px;
    }

    .tab {
        padding: 10px 20px;
        background: #eee;
        border: 1px solid #ccc;
        cursor: pointer;
        border-radius: 5px;
    }

    .tab:hover {
        background: #ddd;
    }

    .content {
        display: none;
        margin-top: 10px;
        padding: 10px;
        border: 1px solid #ccc;
        width: 1000px;
        height: 500px;
    }

    .sales_content {
        display: none;
        margin-top: 10px;
        padding: 10px;
        border: 1px solid #ccc;
        width: 1000px;
        height: 500px;
    }

    #tab1:checked ~ #content1,
    #tab2:checked ~ #content2{
        display: block;
    }
    #map {
        width: 100%;
        height: 400px;
    }
    .guide_ul {
      list-style-position: inside; /* 리스트 마커를 내부로 */
      padding-left: 0;             /* 좌측 여백 제거 */
      margin-left: 0;              /* 좌측 마진 제거 */
    }
    .guide_ul > li {
      margin-left: 0;              /* li의 여백 제거 */
    }
    img{
    	width:200px;
    	heigh:170px;
    }
</style>
</head>
<body>
<jsp:include page="../header.jsp" />
	<h2>이용안내</h2>
    <input type="radio" name="tab" id="tab1" checked>
    <input type="radio" name="tab" id="tab2">

    <div class="tabs">
    <label for="tab1" class="tab">전시·체험·공연</label>
    <label for="tab2" class="tab">해양친구들 소개</label>
    </div>
    <br>
     <!-- 전시·체험·공연 -->
    <div class="content" id="content1">
    	<h2>전시·체험·공연</h2>

		<div>
		    <ul class="guide_ul">
		      <li>
		      	<img alt="해파리" src="/images/jellyfish.jpg">
		      	<h3>해파리 연구소</h3>
		      	해파리의 신비한 비밀을 파헤쳐라!<br>
		      	해파리의 종류 및 먹이 등에 대해 알아보고, 함께 사진찍을 수 있는 공간
		      	<p style="color:#fc6358; background-color: #f7f7f7;" >#포토존 #전시</p>
		      </li>
		      <li>
		      	<img alt="바다거북" src="/images/turtle.jpg">
		      	<h3>바다 거북 구조대<span style="color:#969696">(사전 신청)</span></h3>
		      	다친 거북이를 무사히 돌려 보내라!<br>
		      	바다 거북이를 구조하는 과정을 체험하고, 해양 생물 보호의 중요성을 깨닫는 체험
		      	<p style="color:#fc6358; background-color: #f7f7f7;" >#체험 #토요일 17시 #전화 문의</p>
		      </li>
		      <li>
		      	<img alt="수달" src="/images/otter.jpg">
		      	<h3>아기 수달의 식사</h3>
		      	수달의 식사를 도와라!<br>
		      	아기 수달이 좋아하는 먹이에 대해 알아보고, 아쿠아리스트가 먹이 주는 모습을 관람할 수 있는 공연
		      	<p style="color:#fc6358; background-color: #f7f7f7;" >#체험 #토요일 17시 #전화 문의</p>
		      </li>
		    </ul>
		</div>
    </div> <!-- content1 end -->
    <!-- 해양 친구들 소개 -->
    <div class="content" id="content2">
    	<h1>오션랜드 부산에서 볼 수 있는 해양 친구들</h1> 
    	<a href="/userGuide/seaFriends"><button>자세히 보기 ></button></a> 
    </div>
    
</body>
</html>