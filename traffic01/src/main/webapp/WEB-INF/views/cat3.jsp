<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/gh/eliyantosarage/font-awesome-pro@main/fontawesome-pro-6.5.2-web/css/all.min.css" rel="stylesheet">
	<link rel="stylesheet" href="resources/css/cat3.css">
    <title>Traffic Category 3</title>
</head>
<jsp:include page="layout/header.jsp" />
<body>
<div class="body_section">
	<jsp:include page="layout/side_left.jsp" />
	
	    <div class="switch_button">
	    	<div class="button1" onclick='switch1()'> 역별 승하차 순위 </div>
	    	<div class="button2" onclick='switch2()'> 호선별 승하차 순위 </div>
	    </div>
	    <div class="content_wrap1">
	    	<div class="content1_1_wrap">
	    		<div class="title1_1">
	    		<i class="fa-duotone fa-train-subway"></i>
	    		승차역
	    		</div>
	    		<div class="top5_1_1"> 1위 ~ 5위 </div>
	    		<c:forEach items="${cat3Data1 }" var="subway1">
		    		<div class="rank1_1">
		    			<i class="fa-solid fa-square-${subway1.rownum }"></i>
		    			<div class="rank1_1_name">
		    			${subway1.stationNum }
		    			</div>
		    			<div class="rank1_1_cnt">
		    			${subway1.ridePassengerNum }
		    			</div>
		    		</div>
	    		</c:forEach>
	    	</div>
	    	<div class="content1_2_wrap">
	    		<div class="title1_1">
	    		<i class="fa-duotone fa-train-subway"></i>
	    		하차역
	    		</div>
	    		<div class="top5_1_2"> 1위 ~ 5위 </div>
	    		<c:forEach items="${cat3Data2 }" var="subway2">
		    		<div class="rank1_1">
		    			<i class="fa-solid fa-square-${subway2.rownum }"></i>
		    			<div class="rank1_1_name">
		    			${subway2.stationNum }
		    			</div>
		    			<div class="rank1_1_cnt">
		    			${subway2.alightPassengerNum }
		    			</div>
		    		</div>
	    		</c:forEach>
	    	</div>
	    	<div class="content1_3_wrap">
	    		<div class="chart1_title"> 평균 이동 시간 </div>
	    		<canvas id="Chart1"></canvas>
	    		<div class="chart1_time"> 35분 </div>
	    	</div>
	    	<div class="content1_4_wrap">
	    		<div class="chart2_title"> 평균 이동 거리 </div>
	    		<canvas id="Chart2"></canvas>
	    		<div class="chart2_distance"> 13.5km </div>
	    	</div>
	    </div>
 	    <div class="content_wrap2">
	    	<div class="content1_1_wrap">
	    		<div class="title1_1">
	    		<i class="fa-duotone fa-bus"></i>
	    		승차 호선
	    		</div>
	    		<div class="top5_1_1"> 1위 ~ 5위 </div>
	    		<c:forEach items="${cat3Data3 }" var="subway3">
		    		<div class="rank1_1">
		    			<i class="fa-solid fa-square-${subway3.rownum }"></i>
		    			<div class="rank1_1_name">
		    			${subway3.lineNum }
		    			</div>
		    			<div class="rank1_1_cnt">
		    			${subway3.totalNum }
		    			</div>
		    		</div>
	    		</c:forEach>
	    	</div>
	    	<div class="content1_2_wrap">
	    		<div class="title1_1">
	    		<i class="fa-duotone fa-bus"></i>
	    		하차 호선
	    		</div>
	    		<div class="top5_1_2"> 1위 ~ 5위 </div>
	    		<c:forEach items="${cat3Data4 }" var="subway4">
		    		<div class="rank1_1">
		    			<i class="fa-solid fa-square-${subway4.rownum }"></i>
		    			<div class="rank1_1_name">
		    			${subway4.lineNum }
		    			</div>
		    			<div class="rank1_1_cnt">
		    			${subway4.totalNum }
		    			</div>
		    		</div>
	    		</c:forEach>
	    	</div>
	    	<div class="content1_3_wrap">
	    		<div class="chart1_title"> 2호선 역별 순위 </div>
	    		<canvas id="Chart3" width="300" height="400"></canvas>
	    	</div>
	    	<div class="content1_4_wrap">
	    		<div class="chart2_title"> 5호선 역별 순위 </div>
	    		<canvas id="Chart4" width="300" height="400"></canvas>
	    	</div>
	    </div>
</div>


<!-- Script -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/chart.js/dist/chart.umd.min.js"></script>

<script>

	const btn1 = document.querySelector('.button1');
	const btn2 = document.querySelector('.button2');
	const wrap1 = document.querySelector('.content_wrap1');
	const wrap2 = document.querySelector('.content_wrap2');

	function switch1() {
		btn1.style.cssText = 'border-top: 1px solid #b1b8c0; border-left: 1px solid #b1b8c0; border-right: 1px solid #b1b8c0;';
		btn2.style.cssText = 'border: none;';
		wrap1.style.display = 'flex';
		wrap2.style.display = 'none';
	}
	
	function switch2() {
		btn1.style.cssText = 'border: none;';
		btn2.style.cssText = 'border-top: 1px solid #b1b8c0; border-left: 1px solid #b1b8c0; border-right: 1px solid #b1b8c0;';
		wrap1.style.display = 'none';
		wrap2.style.display = 'flex';
	}
	
</script>
<script>
	const doughnut1 = document.getElementById('Chart1');
	
	new Chart(doughnut1, {
		type: 'doughnut',
		data: {
			datasets: [{
				data: [(35/60), (25/60)],
				backgroundColor: [
				'#1e90ff',
				'#b1b8c0'
				],
				borderWidth: 1
			}]
		},
		options: {
			plugins: {
				legend: {
				display: true,
				position: 'bottom'
				}
			}
		}
	});
	
	const doughnut2 = document.getElementById('Chart2');
	
	new Chart(doughnut2, {
		type: 'doughnut',
		data: {
			datasets: [{
				data: [(13.5/30), (16.5/30)],
				backgroundColor: [
				'#ff8d1e',
				'#b1b8c0'
				],
				borderWidth: 1
			}]
		},
		options: {
			plugins: {
				legend: {
				display: true,
				position: 'bottom'
				}
			}
		}
	});
	
	// 가로 바 차트
	  const stick1 = {
	    labels: ['잠실 (송파구청)', '홍대입구', '강남', '신도림', '신림'],
	    datasets: [{
	    	label: '단위 : 명',
	      data: [89925, 89667, 63867, 49692, 49634],
	      backgroundColor: [
	        '#00b140',
	        '#00b140',
	        '#00b140',
	        '#00b140',
	        '#00b140'
	      ],
	      borderColor: [
	        '#6ba979',
	        '#6ba979',
	        '#6ba979',
	        '#6ba979',
	        '#6ba979'
	      ],
	      borderWidth: 1,
	      borderRadius: 5,
	      barPercentage: 0.8
	    }]
	  };

	// config
	  const configStick1 = {
	    type: 'bar',
	    data: stick1,
	    options: {
	      indexAxis: 'y',
	      responsive: false,
	      scales: {
	        y: {
	          beginAtZero: true,
	          gride: {
	            display: false,
	            drawBorder: false
	          }
	        }
	      }
	    }
	  };

	// render init block
	  const myChartStick1 = new Chart(
	      document.getElementById('Chart3'),
	      configStick1
	  );
	
	// 가로 바 차트
	  const stick2 = {
	    labels: ['여의나루', '까치산', '화곡', '광화문', '천호'],
	    datasets: [{
	    	label: '단위 : 명',
	      data: [24469, 24065, 23800, 22662, 20841],
	      backgroundColor: [
	        '#a05eb5',
	        '#a05eb5',
	        '#a05eb5',
	        '#a05eb5',
	        '#a05eb5'
	      ],
	      borderColor: [
	        '#7e58ad',
	        '#7e58ad',
	        '#7e58ad',
	        '#7e58ad',
	        '#7e58ad'
	      ],
	      borderWidth: 1,
	      borderRadius: 5,
	      barPercentage: 0.8
	    }]
	  };

	// config
	  const configStick2 = {
	    type: 'bar',
	    data: stick2,
	    options: {
	      indexAxis: 'y',
	      responsive: false,
	      scales: {
	        y: {
	          beginAtZero: true,
	          gride: {
	            display: false,
	            drawBorder: false
	          }
	        }
	      }
	    }
	  };

	// render init block
	  const myChartStick2 = new Chart(
	      document.getElementById('Chart4'),
	      configStick2
	  );
</script>

</body>
<jsp:include page="layout/footer.jsp" />
</html>
