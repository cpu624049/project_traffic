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

	    	</div>
	    	<div class="content1_2_wrap">
	    	</div>
	    	<div class="content1_3_wrap">
				<div class="graph1">
					<i class="fa-solid fa-timer"></i>
					<canvas id="Chart1" class="chart1"></canvas>
				</div>
	    	</div>
	    	<div class="content1_4_wrap"></div>
				<div class="graph1">
					<i class="fa-solid fa-swap"></i>
					<canvas id="Chart1" class="chart1"></canvas>
				</div>
	    </div>
	    <div class="content_wrap2"></div>
</div>


<!-- Script -->

    <script>
    </script>

</body>
<jsp:include page="layout/footer.jsp" />
</html>
