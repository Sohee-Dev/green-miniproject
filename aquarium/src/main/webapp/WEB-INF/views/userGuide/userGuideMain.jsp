<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UserGuideMain</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6a65e505d83a76dca68ba161fbc08190"></script>
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
    #tab2:checked ~ #content2,
    #tab3:checked ~ #content3,
    #tab4:checked ~ #content4 {
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
</style>
</head>
<body>
<jsp:include page="../header.jsp" />
	<h2>이용안내</h2>
    <input type="radio" name="tab" id="tab1" checked>
    <input type="radio" name="tab" id="tab2">
    <input type="radio" name="tab" id="tab3">
    <input type="radio" name="tab" id="tab4">

    <div class="tabs">
    <label for="tab1" class="tab">운영 시간</label>
    <label for="tab2" class="tab">층별 안내</label>
    <label for="tab3" class="tab">유의사항</label>
    <label for="tab4" class="tab">오시는 길</label>
    </div>
    <br>
    <!-- 운영 시간 -->
    <div class="content" id="content1">
    	<h2>운영 시간</h2>

		<div>
		    <p><strong>매일 10:00 - 20:00</strong> (입장은 <span style="color:red;">19시</span>까지 가능)</p>
		    <ul>
		      <li>이용권 구매 후 입장 가능합니다.</li>
		      <li>유효기간이 지난 이용권은 입장 불가합니다.</li>
		    </ul>
		</div>
		
		<div>
		    <h3>[ 제공 시설 및 서비스 ]</h3>
		    <ul>
		      <li>엘리베이터</li>
		      <li>주차장(유료)</li>
		      <li>남녀 구분 화장실</li>
		      <li>포토존, 사진 촬영</li>
		      <li>단체 방문 가능</li>
		      <li>이용 가이드</li>
		    </ul>
		    <p>* 장애인 편의시설:<br>
		      주차장 내 장애인 전용 구역, 장애인 전용 화장실 보유<br>
		      사전 혹은 매표소 당일 문의 시 휠체어 대여 가능
		    </p>
		</div> <!-- 제공 시설 및 서비스 end -->
    </div> <!-- content1 end -->
    <!-- 층별 안내 -->
    <div class="content" id="content2">
    	<img alt="층별안내 1" src="/images/guideMap1.png">
    	<img alt="층별안내 2" src="/images/guideMap2.png">
    	<img alt="층별안내 3" src="/images/guideMap3.png">
    </div>
    <!-- 유의사항 -->
    <div class="content" id="content3">
    	<img alt="유의사항 1" src="/images/notice1.png">
    	<img alt="유의사항 2" src="/images/notice2.png">
    </div>
    <!-- 오시는 길 -->
    <div class="content" id="content4">
    	<h3>대표 전화: 051-888-8888</h3>
    	<h3>주소: 부산광역시 해운대구 해운대해변로 266 (48100)</h3>
   		<div id="map" style="width:100%;height:350px;"></div>
   		<div>
		    <h3>[ 지하철 이용 시 ]</h3>
		    <ul class="guide_ul">
		      <li>해운대역 지하철 3번, 5번 출구</li>
		      <li>도보 10분 거리</li>
		    </ul>
		</div>
		<div>
		    <h3>[ 버스 이용 시 ]</h3>
		    <h4>(공항)307번</h4>
		    <ul class="guide_ul">
		      <li>김해공항 국제선 청사 정류장 승차</li>
		      <li>해운대해수욕장 정류장 하차</li>
		    </ul>
		    <h4>(부산역)1001번, 1003번</h4>
		    <ul class="guide_ul">
		    	<li>부산역 정류장 승차</li>
		    	<li>해운대해수욕장 정류장 하차</li>
		    </ul>
		</div>
		<div>
		    <h3>[ 주차장 요금 ]</h3>
		    <ul class="guide_ul">
		      <li>최초 120분 무료</li>
		      <li>(초과시 10분당 1000원)</li>
		    </ul>
		</div>
   		
    </div>

<script>
let map; // 지도 객체 전역으로 선언

document.getElementById('tab4').addEventListener('click', function () {
//document.getElementById('content4').style.display = 'block';

  // 좌표 지정 
  const lat = 35.158698;
  const lng = 129.160384;
  const position = new kakao.maps.LatLng(lat, lng);

  if (!map) {
    // 지도가 처음이면 생성
    const container = document.getElementById('map');
    const options = {
      center: position,
      level: 3
    };
    map = new kakao.maps.Map(container, options);

    // 마커 생성
    const marker = new kakao.maps.Marker({
      position: position
    });
    marker.setMap(map);

    // 텍스트가 들어간 커스텀 오버레이 생성
    const content = `
      <div style="
      	color:white;
    	font-weight:bold;
        padding:5px 10px;
        background:#87c5ff;
        border:1px solid white;
        border-radius:5px;
        font-size:14px;
        box-shadow: 2px 2px 5px rgba(0,0,0,0.3);
      ">
        Ocean Land
      </div>`;

    const overlay = new kakao.maps.CustomOverlay({
      content: content,
      position: position,
      yAnchor: 2.3 // 마커 위에 표시
    });
    overlay.setMap(map);

  } else {
    // 지도 이미 있으면 위치만 다시 설정
    setTimeout(() => {
      map.relayout();
      map.setCenter(position);
    }, 100);
  }
});
</script>
<jsp:include page="../footer.jsp" />
</body>
</html>