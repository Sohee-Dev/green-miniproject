<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.umd.min.js"></script>

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
        width: auto;
        height: auto;
    }

    .sales_content {
        display: none;
        margin-top: 10px;
        padding: 10px;
        border: 1px solid #ccc;
        width: auto;
        height: 700px;
    }
    
    .sales_content{
    	padding-bottom: 50px;
    }

    #tab1:checked ~ #content1,
    #tab2:checked ~ #content2,
    #tab3:checked ~ #content3 {
        display: block;
    }

    #sales_tab1:checked ~ #sales_content1,
    #sales_tab2:checked ~ #sales_content2 {
        display: block;
    }


    </style>
</head>
<body>
	<jsp:include page="a_header.jsp" />
	
	<h2>보고서</h2>
    <!-- 보고서 종류-->
    <input type="radio" name="tab" id="tab1" checked>
    <input type="radio" name="tab" id="tab2">
    <input type="radio" name="tab" id="tab3">

    <div class="tabs">
    <label for="tab1" class="tab">매출 통계</label>
    <label for="tab2" class="tab">방문객 수 통계</label>
    <label for="tab3" class="tab">서비스 이용자 통계</label>
    </div>
    <br>
    


    <div class="content" id="content1">
        <!--매출 통계에서 나뉘는 메뉴-->
        <input type="radio" name="sales_tab" id="sales_tab1" checked>
        <input type="radio" name="sales_tab" id="sales_tab2">
        <input type="radio" name="sales_tab" id="sales_tab3">

        <div class="sales_tabs tabs">
            <label for="sales_tab1" class="tab">주간 매출 조회</label>
            <label for="sales_tab2" class="tab">월간 매출 조회</label>
        </div>

        <!--주간 매출-->
        <div class="sales_content" id="sales_content1">
            <label>조회 일자: </label> <input type="date" id="sales_date" name="sales_date">
            <button onclick="getSalesOfDay()">조회하기</button>
			<br>
          	<canvas id="sales_date_chart" width="100%" height="100%"></canvas>
        </div>
        <!--월간 매출-->
        <div class="sales_content" id="sales_content2">
	        <label>조회 연도: </label><select id="yearSelect">
			  <option value="2024">2024년</option>
			  <option value="2025" selected="selected">2025년</option>
			</select>
	        <button onclick="getSalesOfMonth()">조회하기</button><br>
			
	      	<canvas id="sales_month_chart" width="100%" height="100%"></canvas>
        </div>

        
    </div>
    <div class="content" id="content2">
    	[ 방문객 수 통계 탭 ]
    	※추후 제공 예정※
    </div>
    <div class="content" id="content3">
    	[서비스 이용자 통계 탭]
    	※추후 제공 예정※
    </div>
</body>

<script>
	const today = new Date();
	
	//한국 보정시간(UTC+9)
	const koreaTime = new Date(today.getTime() + (9 * 60 * 60 * 1000));
	const koreaDate = koreaTime.toISOString().split('T')[0];
	document.getElementById('sales_date').value = koreaDate;
	document.getElementById('sales_date').max = koreaDate;
	document.getElementById('sales_date').min = "2024-01-01";
    function getSalesOfDay(){ // 주간차트
        let sales_date = document.getElementById('sales_date').value;
        
        fetch('/admin/drawDayChart',{
            method:"POST",
            headers:{
                'Content-Type':'application/json'
            },
            body: JSON.stringify({sales_date})
        }).then((response) => response.json())
        .then((data) => {
        	const result1 = Object.entries(data);
        	result1.sort((a, b) => a[0].localeCompare(b[0]));
        	//날짜부분을 정렬시킴 a: 첫번째 비교항목, b: 두번째 비교항목
        	//a[0], b[0] : 날짜 문자열 부분 
        	drawChart(result1);
        }).catch((error) => {
            console.error("데이터 불러오는 중 오류 발생:", error);
        });
    }
    let myChart = null; // 차트 정의
    
    function drawChart(result){ // 주간 차트 그리기
    	let sales_date = document.getElementById('sales_date').value;
    	let sdCt = document.getElementById('sales_date_chart');

    	if (myChart) {
            myChart.destroy(); // 차트 초기화
        }
    	const mapLabels = result.map(entry => entry[0]);
    	const values = result.map(entry => entry[1]);
        myChart = new Chart(sdCt, {
        type: 'line',
        data: {
            labels: mapLabels,
            datasets: [
            {
                label: sales_date + " 전후 3일 매출",
                data: values,
                backgroundColor:'rgba(0, 55, 255, 0.7)',
				borderColor: '#82b6ff',
				pointRadius: 5,
            }
            ]
        },
        options:{
        	spanGaps: true,
            responsive: true,
            maintainAspectRatio: false,
            scales: { // y축 값에 단위 추가
                y: {
                  ticks: {
                    callback: function(value) {
                      return value.toLocaleString() + '원'; // 1000 → "1,000원"
                    }
                  }
                }
              },
            plugins: {
            	title: { // 제목
           	      display: true,
           	      text: '주간매출(조회 일자 기준 전후 3일)',
           	      font: {
           	        size: 20,
           	        weight: 'bold',
           	      },
            	},
            	tooltip: {
           	      enabled: true, // 툴팁 on
           	      mode: 'index', // x축 인덱스 기준으로 한꺼번에 표시
           	      intersect: false, // 포틴트와 정확히 겹치지 않아도 표시 => 범위 내에만 들어가면 표시 됨
            	}
            }
        } // options -end-
      }); // myChart -end-
    }
   
    function getSalesOfMonth(){ // 월간차트
		let year = document.getElementById('yearSelect').value;
        
        fetch('/admin/drawMonthChart',{
            method:"POST",
            headers:{
                'Content-Type':'application/json'
            },
            body: JSON.stringify({year})
        }).then((response) => response.json())
        .then((data) => {
        	const result1 = Object.entries(data);
        	result1.sort((a, b) => a[0].localeCompare(b[0]));
        	//날짜부분을 정렬시킴 a: 첫번째 비교항목, b: 두번째 비교항목
        	//a[0], b[0] : 날짜 문자열 부분 
        	
        	const labels = result1.map(entry => entry[0]); // ["2024-04", "2024-05"]
  			const values = result1.map(entry => entry[1]);
  			drawChart_Month(labels, values);
        }).catch((error) => {
            console.error("데이터 불러오는 중 오류 발생:", error);
        });
    }
    
    function drawChart_Month(labels, values){ // 월간차트 그리기
    	let smCt = document.getElementById('sales_month_chart');

    	if (myChart) {
            myChart.destroy();
        }
        myChart = new Chart(smCt, {
        type: 'line',
        data: {
            labels: labels,
            datasets: [
            {
                label: '월간매출',
                data: values,
                backgroundColor:'#82b6ff',
				borderColor: '#f0f0f0',
				pointRadius: 5,
            }
            ]
        },
        options:{
            responsive: true,
            maintainAspectRatio: false,
            scales: { // y축 값에 단위 추가
                y: {
                  ticks: {
                    callback: function(value) {
                      return value.toLocaleString() + '원'; // 1000 → "1,000원"
                    }
                  }
                }
              },
            plugins: {
            	title: { // 제목
           	      display: true,
           	      text: '월별 매출',
           	      font: {
           	        size: 20,
           	        weight: 'bold',
           	      },
            	},
            	tooltip: {
           	      enabled: true, // 툴팁 on
           	      mode: 'index', // x축 인덱스 기준으로 한꺼번에 표시
           	      intersect: false, // 포틴트와 정확히 겹치지 않아도 표시 => 범위 내에만 들어가면 표시 됨
            	}
            }
        }
        });
    }
    
</script>
</html>