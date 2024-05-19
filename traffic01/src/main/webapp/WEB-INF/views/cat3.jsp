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
	    	<div class="button1"> 오늘 지하철은 </div>
	    	<div class="button2"> 오늘 버스는 </div>
	    </div>
	    <div class="content_wrap1">
	    	<div class="content1_1_wrap">
	    		<div class="title1_1">
	    		<i class="fa-duotone fa-train-subway"></i>
	    		승차역
	    		</div>
	    		<div class="top5_1_1"> 1위 ~ 5위 </div>
	    		<div class="rank1_1">
	    			<i class="fa-solid fa-square-1"></i>
	    			<div class="rank1_1_name">
	    			강남
	    			</div>
	    			<div class="rank1_1_cnt">
	    			89,947
	    			</div>
	    		</div>
	    		<div class="rank1_1">
	    			<i class="fa-solid fa-square-1"></i>
	    			<div class="rank1_1_name">
	    			강남
	    			</div>
	    			<div class="rank1_1_cnt">
	    			89,947
	    			</div>
	    		</div>
	    		<div class="rank1_1">
	    			<i class="fa-solid fa-square-1"></i>
	    			<div class="rank1_1_name">
	    			강남
	    			</div>
	    			<div class="rank1_1_cnt">
	    			89,947
	    			</div>
	    		</div>
	    		<div class="rank1_1">
	    			<i class="fa-solid fa-square-1"></i>
	    			<div class="rank1_1_name">
	    			강남
	    			</div>
	    			<div class="rank1_1_cnt">
	    			89,947
	    			</div>
	    		</div>
	    		<div class="rank1_1">
	    			<i class="fa-solid fa-square-1"></i>
	    			<div class="rank1_1_name">
	    			강남
	    			</div>
	    			<div class="rank1_1_cnt">
	    			89,947
	    			</div>
	    		</div>
	    	</div>
	    	<div class="content1_2_wrap">
	    		<div class="title1_1">
	    		<i class="fa-duotone fa-train-subway"></i>
	    		하차역
	    		</div>
	    		<div class="top5_1_2"> 1위 ~ 5위 </div>
	    		<div class="rank1_1">
	    			<i class="fa-solid fa-square-1"></i>
	    			<div class="rank1_1_name">
	    			강남
	    			</div>
	    			<div class="rank1_1_cnt">
	    			89,947
	    			</div>
	    		</div>
	    		<div class="rank1_1">
	    			<i class="fa-solid fa-square-1"></i>
	    			<div class="rank1_1_name">
	    			강남
	    			</div>
	    			<div class="rank1_1_cnt">
	    			89,947
	    			</div>
	    		</div>
	    		<div class="rank1_1">
	    			<i class="fa-solid fa-square-1"></i>
	    			<div class="rank1_1_name">
	    			강남
	    			</div>
	    			<div class="rank1_1_cnt">
	    			89,947
	    			</div>
	    		</div>
	    		<div class="rank1_1">
	    			<i class="fa-solid fa-square-1"></i>
	    			<div class="rank1_1_name">
	    			강남
	    			</div>
	    			<div class="rank1_1_cnt">
	    			89,947
	    			</div>
	    		</div>
	    		<div class="rank1_1">
	    			<i class="fa-solid fa-square-1"></i>
	    			<div class="rank1_1_name">
	    			강남
	    			</div>
	    			<div class="rank1_1_cnt">
	    			89,947
	    			</div>
	    		</div>
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
	    		<div class="title1_1"> 승차역 TOP 5 </div>
	    		<div class="top5_1"> 1위 ~ 5위 </div>

	    		<div class="rank1_1">
	    			
	    			<i class="fa-solid fa-square-1"></i>
	    			<i class="fa-solid fa-square-2"></i>
	    			<i class="fa-solid fa-square-3"></i>
	    			<i class="fa-solid fa-square-4"></i>
	    			<i class="fa-solid fa-square-5"></i>
	    			<div class="rank1_1_name"></div>
	    			<div class="rank1_1_cnt">
	    			
	    			</div>
	    		</div>
	    	</div>
	    </div>
</div>


<!-- Script -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/chart.js/dist/chart.umd.min.js"></script>

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
</script>

</body>
<jsp:include page="layout/footer.jsp" />
</html>


<!-- 

임시코드

    <c:forEach var="sub" items="${SubList}" varStatus="status">
        <c:if test="${status.index < 5}">
            <div class="rank1_1">
                <i class="fa-solid fa-square-${status.index + 1}"></i>
                <div class="rank1_1_name"> ${sub.name} </div>
                <div class="rank1_1_name"> ${sub.cnt} </div>
            </div>
        </c:if>
    </c:forEach>

 -->
