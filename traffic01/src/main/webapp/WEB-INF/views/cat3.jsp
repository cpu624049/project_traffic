<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="resources/css/cat3.css">
    <title>Traffic Category 3</title>
</head>
<jsp:include page="layout/header.jsp" />
<body>
<div class="body_section">
	<jsp:include page="layout/side_left.jsp" />
	
	    <div> Traffic Category 3 </div>
	    <canvas id="myCanvas"></canvas>
	    
	<jsp:include page="layout/side_right.jsp" />
</div>


<!-- Script -->

    <script>
        var canvas = document.getElementById("myCanvas");
        var ctx = canvas.getContext("2d");

        // 서울시 각 자치구의 폴리곤 좌표 (WGS84 좌표계)
        var polygons = [
            // 광진구
            [[127.122358, 37.568256], [127.120872, 37.561881], [127.109672, 37.556863], [127.100151, 37.555842], [127.093221, 37.557533], [127.092479, 37.560938], [127.090476, 37.563056], [127.087960, 37.561513], [127.087722, 37.560954], [127.084419, 37.563461], [127.081019, 37.566120], [127.080502, 37.567472], [127.080734, 37.568588], [127.081938, 37.568967], [127.085142, 37.572785], [127.085867, 37.573352], [127.090200, 37.572062], [127.095905, 37.571550], [127.101949, 37.569520], [127.109134, 37.567628], [127.111676, 37.567829], [127.114214, 37.569577], [127.115526, 37.569099], [127.117481, 37.566111], [127.120354, 37.566196], [127.120853, 37.568058], [127.122358, 37.568256]],
            // 강남구
            [[127.058075, 37.517964], [127.067487, 37.519137], [127.071878, 37.518088], [127.076307, 37.516603], [127.080685, 37.515817], [127.085369, 37.514736], [127.094361, 37.514466], [127.096210, 37.512956], [127.093900, 37.509998], [127.090498, 37.507949], [127.090169, 37.505757], [127.087960, 37.504532], [127.085642, 37.502759], [127.085721, 37.500692], [127.087115, 37.498383], [127.090543, 37.495986], [127.087992, 37.495167], [127.084251, 37.495292], [127.080455, 37.496497], [127.077212, 37.498549], [127.070542, 37.498741], [127.067988, 37.499472], [127.067398, 37.500566], [127.064122, 37.501975], [127.061005, 37.504823], [127.060308, 37.505605], [127.058636, 37.509666], [127.058075, 37.517964]]
            // 다른 자치구들의 폴리곤 좌표도 추가할 수 있음
        ];

        // 서울시청의 좌표 (WGS84 좌표계)
        var seoulCityHall = [126.977945, 37.566295];

        // 서울시 중심으로 이동
        var center = [seoulCityHall[0], seoulCityHall[1]];

        // Canvas에 폴리곤 그리기
        function drawPolygons() {
            ctx.clearRect(0, 0, canvas.width, canvas.height); // Canvas 초기화

            var halfCanvasWidth = canvas.width / 2;
            var halfCanvasHeight = canvas.height / 2;

            for (var i = 0; i < polygons.length; i++) {
                var coords = polygons[i];
                ctx.beginPath();
                ctx.moveTo((coords[0][0] - center[0]) * 10000 + halfCanvasWidth, (center[1] - coords[0][1]) * 10000 + halfCanvasHeight);
                for (var j = 1; j < coords.length; j++) {
                    ctx.lineTo((coords[j][0] - center[0]) * 10000 + halfCanvasWidth, (center[1] - coords[j][1]) * 10000 + halfCanvasHeight);
                }
                ctx.closePath();
                ctx.lineWidth = 2;
                ctx.strokeStyle = "#FF0000";
                ctx.fillStyle = "rgba(255, 0, 0, 0.5)";
                ctx.stroke();
                ctx.fill();
            }
        }

        drawPolygons();
    </script>

</body>
<jsp:include page="layout/footer.jsp" />
</html>
