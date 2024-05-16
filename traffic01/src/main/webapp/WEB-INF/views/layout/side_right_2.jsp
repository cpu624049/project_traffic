<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="resources/css/side_right_2.css">
	<link href="https://cdn.jsdelivr.net/gh/eliyantosarage/font-awesome-pro@main/fontawesome-pro-6.5.2-web/css/all.min.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
    <div class="side_right_wrap">
    	<div class="wrap_title"> 생활 이동 통계 </div>
    	<div class="wrap1">
    		<div class="graph1_wrap">
    			<div class="graph1_title">
    				<i class="fa-solid fa-location-check"></i>
    				남여 유출 인구 비율
   				</div>
   				<div class="graph1">
   					<canvas id="Chart1" class="chart1"></canvas>
   				</div>
   				<div class="graph_legend">
   					<div class="legend1">
   					<i class="fa-solid fa-person"></i>
   					49%
   					</div>
   					<div class="legend2">
   					<i class="fa-solid fa-person-dress"></i>
   					51%
   					</div>
   				</div>
    		</div>
    		<div class="graph2_wrap">
    			<div class="graph2_title">
	    			<i class="fa-solid fa-location-check"></i>
	    			연령별 유출 인구
    			</div>
   				<div class="graph2">
					<canvas id="Chart2" width="250" height="400"></canvas>
   				</div>
    		</div>
    		<div class="graph3_wrap">
    			<div class="graph3_title">
	    			<i class="fa-solid fa-location-check"></i>
	    			동별 유출인구 top5
    			</div>
    			<div class="graph3">
    				<div class="content">
    					<div class="content_name"> Top 1. 이름</div>
    					<div class="content_cnt">
    						<i class="fa-solid fa-person-arrow-up-from-line"></i>
    						71,318
    					</div>
    				</div>
    				<div class="content">
    					<div class="content_name"> Top 2. 이름</div>
    					<div class="content_cnt">
    						<i class="fa-solid fa-person-arrow-up-from-line"></i>
    						71,318
    					</div>
    				</div>
    				<div class="content">
    					<div class="content_name"> Top 3. 종로1·2·3·4가동 </div>
    					<div class="content_cnt">
    						<i class="fa-solid fa-person-arrow-up-from-line"></i>
    						71,318
    					</div>
    				</div>
    				<div class="content">
    					<div class="content_name"> Top 4. 이름</div>
    					<div class="content_cnt">
    						<i class="fa-solid fa-person-arrow-up-from-line"></i>
    						71,318
    					</div>
    				</div>
    				<div class="content">
    					<div class="content_name"> Top 5. 이름</div>
    					<div class="content_cnt">
    						<i class="fa-solid fa-person-arrow-up-from-line"></i>
    						71,318
    					</div>
    				</div>
    			</div>
    		</div>
    	</div>
    </div>
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
	const half_doughnut = document.getElementById('Chart1');

	new Chart(half_doughnut, {
		type: 'doughnut',
		data: {
			datasets: [{
				label: '# of Votes',
				data: [49, 51],
				backgroundColor: [
				'#1e90ff',
				'#ff8d1e'
				],
				borderWidth: 1
			}]
		},
		options: {
			rotation: -90,
			circumference: 180,
			plugins: {
				legend: {
				display: true,
				position: 'bottom'
				}
			}
		}
	});
	
	// 가로 바 차트
	  const dataNutri = {
	    labels: ['10대', '20대', '30대', '40대', '50대', '60대', '70대', '그외'],
	    datasets: [{
	    	label: '1,000,000 명 단위',
	      data: [10, 30, 30, 30, 30, 30, 20, 20],
	      backgroundColor: [
	        'rgba(255, 139, 38, 0.2)',
	        'rgba(255, 139, 38, 0.2)',
	        'rgba(255, 139, 38, 0.2)',
	        'rgba(255, 139, 38, 0.2)',
	        'rgba(255, 139, 38, 0.2)',
	        'rgba(255, 139, 38, 0.2)',
	        'rgba(255, 139, 38, 0.2)',
	        'rgba(255, 139, 38, 0.2)'

	      ],
	      borderColor: [
	        'rgba(255, 139, 38, 1)',
	        'rgba(255, 139, 38, 1)',
	        'rgba(255, 139, 38, 1)',
	        'rgba(255, 139, 38, 1)',
	        'rgba(255, 139, 38, 1)',
	        'rgba(255, 139, 38, 1)',
	        'rgba(255, 139, 38, 1)',
	        'rgba(255, 139, 38, 1)'
	      ],
	      borderWidth: 1,
	      borderRadius: 5,
	      barPercentage: 0.8
	    }]
	  };

	// config
	  const configNutri = {
	    type: 'bar',
	    data: dataNutri,
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
	  const myChartNutri = new Chart(
	      document.getElementById('Chart2'),
	      configNutri
	  );
</script>
</body>
</html>