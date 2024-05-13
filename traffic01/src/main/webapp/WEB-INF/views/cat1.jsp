<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<link href="https://cdn.jsdelivr.net/gh/eliyantosarage/font-awesome-pro@main/fontawesome-pro-6.5.2-web/css/all.min.css" rel="stylesheet">
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="resources/css/cat1.css">
    <title>Traffic Category 1</title>
</head>
<jsp:include page="layout/header.jsp" />
<body>
<div class="body_section">
	<jsp:include page="layout/side_left.jsp" />
	
	    <div id="map"></div>
	    <div class="color_info" id="ColorInfo"> 도로 색상 정보 </div>
	    <div class="info_wrap" id="InfoWrap">
	    	<div class="date_wrap">
		    	<div class="current_date" id="CurrentDate"></div>
		    	<div class="date_1"> 기준 </div>
	    		<div id="CloseButton">
	    			<i class="fa-solid fa-xmark"></i>
	    		</div>
	    	</div>
	    	<hr />
	    	<div class="color_wrap">
	    		<div class="green"></div>
	    		<div class="yellow"></div>
	    		<div class="orange"></div>
	    		<div class="red"></div>
	    	</div>
	    	<div class="color_name_wrap">
	    		<div class="name_green"> 원활 </div>
	    		<div class="name_yellow"> 서행 </div>
	    		<div class="name_orange"> 지체 </div>
	    		<div class="name_red"> 정체 </div>	    		
	    	</div>
	    	<hr />
	    	<div class="ps"> 시내 도로는 신호 정차 등의 이유로 실제 속도와 다를 수 있습니다. </div>
	    </div>
	    
	<jsp:include page="layout/side_right.jsp" />
</div>


<!-- Script -->
<script>
	function toggleInfo(){
        var infoWrap = document.getElementById("InfoWrap");
        var colorinfo = document.getElementById("ColorInfo");
		
        // Toggle the visibility of info_wrap and the button
        if (infoWrap.style.display === "none") {
            infoWrap.style.display = "block";
            colorinfo.style.display = "none";
        } else {
        	infoWrap.style.display = "none";
        	colorinfo.style.display = "block";
        }
	}
    document.getElementById("ColorInfo").addEventListener("click", function() {
    	toggleInfo();
    })
    document.getElementById("CloseButton").addEventListener("click", function(){
    	toggleInfo();
    })
</script>


<script src="https://cdn.jsdelivr.net/npm/moment@2.30.1/moment.min.js"></script>
<script>
	moment.locale('ko');
	const today = moment().format('YYYY.MM.DD HH:mm');
	document.getElementById("CurrentDate").innerText = today;
</script>

<!-- JavaScript Key -->
<!-- c7487984efed303effe7e29917b7de05 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c7487984efed303effe7e29917b7de05"></script>
   
  	<script>
   	const rect = document.querySelector('div').getBoundingClientRect();
   	console.log(rect);
   	
	var container = document.getElementById('map');
	var options = {
		center: new kakao.maps.LatLng(37.4820079456921, 126.898086155932),
		level: 6
	};

	var map = new kakao.maps.Map(container, options);
	
	map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);    
	
	var geocoder = new kakao.maps.services.Geocoder(), // 좌표계 변환 객체를 생성합니다
    wtmX = 184802.75329, // 변환할 WTM X 좌표 입니다
    wtmY = 451856.441097; // 변환할 WTM Y 좌표 입니다

	// WTM 좌표를 WGS84 좌표계의 좌표로 변환합니다
	geocoder.transCoord(wtmX, wtmY, transCoordCB, {
	    input_coord: kakao.maps.services.Coords.WTM, // 변환을 위해 입력한 좌표계 입니다
	    output_coord: kakao.maps.services.Coords.WGS84 // 변환 결과로 받을 좌표계 입니다 
	});
    
	// 좌표 변환 결과를 받아서 처리할 콜백함수 입니다.
	function transCoordCB(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	    if (status === kakao.maps.services.Status.OK) {

	        // 마커를 변환된 위치에 표시합니다
	        var tm_marker = new kakao.maps.Marker({
	            position: new kakao.maps.LatLng(result[0].y, result[0].x), // 마커를 표시할 위치입니다
	            map: map // 마커를 표시할 지도객체입니다
	        })
	    }
	}
	
	// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
	var positions = [
	    {
	        content: '<div>카카오</div>', 
	        latlng: new kakao.maps.LatLng(33.450705, 126.570677)
	    },
	    {
	        content: '<div>생태연못</div>', 
	        latlng: new kakao.maps.LatLng(33.450936, 126.569477)
	    },
	    {
	        content: '<div>텃밭</div>', 
	        latlng: new kakao.maps.LatLng(33.450879, 126.569940)
	    },
	    {
	        content: '<div>근린공원</div>',
	        latlng: new kakao.maps.LatLng(33.451393, 126.570738)
	    }
	];

	for (var i = 0; i < positions.length; i ++) {
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng // 마커의 위치
	    });

	    // 마커에 표시할 인포윈도우를 생성합니다 
	    var infowindow = new kakao.maps.InfoWindow({
	        content: positions[i].content // 인포윈도우에 표시할 내용
	    });

	    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
	    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	}
	// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, marker, infowindow) {
	    return function() {
	        infowindow.open(map, marker);
	    };
	}

	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
	    return function() {
	        infowindow.close();
	    };
	}
</script>
</body>
<jsp:include page="layout/footer.jsp" />
</html>
