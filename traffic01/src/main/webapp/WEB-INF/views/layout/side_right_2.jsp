<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="resources/css/side_right_2.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<title>Insert title here</title>
</head>
<body>
    <div class="side_right_wrap">
    	<div class="wrap_title"> 생활 이동 통계 </div>
    	<div class="wrap1">
    		<div class="graph1_wrap">
    			<div class="graph1_title">
    				<i class="fa-solid fa-check"></i>
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
	    			<i class="fa-solid fa-check"></i>
	    			연령별 유출 인구
    			</div>
   				<div class="graph2">
					<canvas id="Chart2" width="250" height="400"></canvas>
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

<script>
	// JSP에서 전달된 JSON 문자열을 JavaScript 변수에 할당
	var cat2Data1 = ${cat2Data1 };
	var cat2Data2 = JSON.parse('${cat2Data2}');
	// cat2Data1과 cat2Data2를 콘솔에 출력 (예시)
	console.log(cat2Data1);
	console.log(cat2Data2);
	
	// 로컬 스토리지에 cat2Data을 저장
	localStorage.setItem('cat2Data1', JSON.stringify(cat2Data1));
	localStorage.setItem('cat2Data2', JSON.stringify(cat2Data2));
</script>
</body>
</html>