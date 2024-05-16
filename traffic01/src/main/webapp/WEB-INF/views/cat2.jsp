<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="org.json.simple.JSONObject, org.json.simple.parser.JSONParser, org.json.simple.parser.ParseException" %>
<html>
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="resources/css/cat2.css">
    <title>Traffic Category 2</title>
</head>
<jsp:include page="layout/header.jsp" />
<body>
<div class="body_section">
	<jsp:include page="layout/side_left.jsp" />

    <div id="map"></div>
	    
	<jsp:include page="layout/side_right_2.jsp" />
</div>

<!-- Script -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c7487984efed303effe7e29917b7de05&libraries=services"></script>

<script>

	// 지도에 폴리곤으로 표시할 영역데이터 배열입니다 
	var areas = [];
	
	/* 1. JSON 파일을 읽어들여 areas 배열을 채워넣는 작업 */
	
	// 1) getJSON도 ajax 메소드와 같이 async(비동기) 방식으로 동작하는데, 순차실행을 위해 이걸 강제로 sync 방식으로 동작하도록 함.
	$.ajaxSetup({
		async : false 
	}); 
	
	// 2) getJSON 메소드를 이용해 JSON 파일을 파싱함
	$.getJSON("resources/json/sp5.json", function(geojson) {
		var units = geojson.features; // 파일에서 key값이 "features"인 것의 value를 통으로 가져옴(이것은 여러지역에 대한 정보를 모두 담고있음)			
		$.each(units, function(index, unit) { // 1개 지역씩 꺼내서 사용함. val은 그 1개 지역에 대한 정보를 담음
			var coordinates = []; //좌표 저장할 배열
			var name = ''; // 지역 이름

			coordinates = unit.geometry.coordinates; // 1개 지역의 영역을 구성하는 도형의 모든 좌표 배열을 가져옴 
			name = unit.properties.SIG_KOR_NM; // 1개 지역의 이름을 가져옴

			var ob = new Object();
			ob.name = name;
			ob.path = [];

			$.each(coordinates[0], function(index, coordinate) { // []로 한번 더 감싸져 있어서 index 0번의 것을 꺼내야 배열을 접근가능.
				ob.path
						.push(new kakao.maps.LatLng(coordinate[1],
								coordinate[0]));
			});

			areas[index] = ob;
		});//each
	});//getJSON

	/* 2. 지도 띄우기 */
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 8 // 지도의 확대 레벨
    };	

	var map = new kakao.maps.Map(mapContainer, mapOption),
    customOverlay = new kakao.maps.CustomOverlay({}),
    infowindow = new kakao.maps.InfoWindow({removable: true});
	
	map.setMinLevel(8);
	map.setMaxLevel(8);
	
	// Tileset을 생성하고 지도 오버레이로 추가합니다
	kakao.maps.Tileset.add('TILE_NUMBER', 
	    new kakao.maps.Tileset({
	        width: 256,
	        height: 256,
	        getTile: function(x, y, z) {
	            var div = document.createElement('div');
	            	div.style.background = '#e2f0fe';
	            return div;
	        }
	    }));

	// 지도 위에 TILE_NUMBER 오버레이 레이어를 추가합니다
	map.addOverlayMapTypeId(kakao.maps.MapTypeId.TILE_NUMBER);
	
	/* 3. 폴리곤 도형을 지도위에 띄우고 마우스 이벤트 붙이기 */
	
	// 지도에 영역데이터를 폴리곤으로 표시합니다 
	for (var i = 0, len = areas.length; i < len; i++) {
		displayArea(areas[i]);
	}

	// 다각형을 생상하고 이벤트를 등록하는 함수입니다
	function displayArea(area) {

	    // 다각형을 생성합니다 
	    var polygon = new kakao.maps.Polygon({
	        map: map, // 다각형을 표시할 지도 객체
	        path: area.path,
	        strokeWeight: 2,
	        strokeColor: '#004c80',
	        strokeOpacity: 0.8,
	        fillColor: '#fff',
	        fillOpacity: 0.7 
	    });
	    
		var districts = {
		    "강남구": { latitude: 37.4927, longitude: 127.0623 },
		    "강동구": { latitude: 37.5512, longitude: 127.1475 },
		    "강북구": { latitude: 37.6328, longitude: 127.0164 },
		    "강서구": { latitude: 37.5655, longitude: 126.8230 },
		    "관악구": { latitude: 37.4676, longitude: 126.9458 },
		    "광진구": { latitude: 37.5457, longitude: 127.0859 },
		    "구로구": { latitude: 37.4981, longitude: 126.8593 },
		    "금천구": { latitude: 37.4610, longitude: 126.9010 },
		    "노원구": { latitude: 37.6513, longitude: 127.0755 },
		    "도봉구": { latitude: 37.6686, longitude: 127.0324 },
		    "동대문구": { latitude: 37.5812, longitude: 127.0552 },
		    "동작구": { latitude: 37.5054, longitude: 126.9444 },
		    "마포구": { latitude: 37.5587, longitude: 126.9077 },
		    "서대문구": { latitude: 37.5786, longitude: 126.9389 },
		    "서초구": { latitude: 37.4913, longitude: 127.0091 },
		    "성동구": { latitude: 37.5524, longitude: 127.0414 },
		    "성북구": { latitude: 37.5942, longitude: 127.0244 },
		    "송파구": { latitude: 37.5054, longitude: 127.1159 },
		    "양천구": { latitude: 37.5183, longitude: 126.8542 },
		    "영등포구": { latitude: 37.5224, longitude: 126.9081 },
		    "용산구": { latitude: 37.5314, longitude: 126.9809 },
		    "은평구": { latitude: 37.6193, longitude: 126.9283 },
		    "종로구": { latitude: 37.5809, longitude: 126.9874 },
		    "중구": { latitude: 37.5596, longitude: 126.9961 },
		    "중랑구": { latitude: 37.5985, longitude: 127.0932 }
		};
		
		// 각 자치구의 중앙 위치에 CustomOverlay 추가
		for (var district in districts) {
		    var position = new kakao.maps.LatLng(districts[district].latitude, districts[district].longitude);

		    var content = '<div class="district">' + district + '</div>';

		    var customOverlay = new kakao.maps.CustomOverlay({
		        position: position,
		        content: content,
		        xAnchor: 0.5,
		        yAnchor: 0.5
		    });

		    customOverlay.setMap(map);
		}
			
	    // 다각형에 mouseover 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 변경합니다 
	    // 지역명을 표시하는 커스텀오버레이를 지도위에 표시합니다
	    kakao.maps.event.addListener(polygon, 'mouseover', function(mouseEvent) {
	        polygon.setOptions({fillColor: '#1e90ff'});

	        customOverlay.setContent('<div class="area">' + area.name + '</div>');
	        
	        customOverlay.setPosition(mouseEvent.latLng); 
	        customOverlay.setMap(map);
	    });

	    // 다각형에 mousemove 이벤트를 등록하고 이벤트가 발생하면 커스텀 오버레이의 위치를 변경합니다 
	    kakao.maps.event.addListener(polygon, 'mousemove', function(mouseEvent) {
	        
	        customOverlay.setPosition(mouseEvent.latLng); 
	    });

	    // 다각형에 mouseout 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 원래색으로 변경합니다
	    // 커스텀 오버레이를 지도에서 제거합니다 
	    kakao.maps.event.addListener(polygon, 'mouseout', function() {
	        polygon.setOptions({fillColor: '#fff'});
	        customOverlay.setMap(null);
	    }); 

	    // 다각형에 click 이벤트를 등록하고 이벤트가 발생하면 다각형의 이름과 면적을 인포윈도우에 표시합니다 
	    kakao.maps.event.addListener(polygon, 'click', function(mouseEvent) {
	        var content = '<div class="info">' + 
	                    '   <div class="title">' + area.name + '</div>' +
	                    '   <div class="size">총 면적 : 약 ' + Math.floor(polygon.getArea()) + ' m<sup>2</sup></div>' +
	                    '</div>';

	        infowindow.setContent(content); 
	        infowindow.setPosition(mouseEvent.latLng); 
	        infowindow.setMap(map);
	    });
	}
	
</script>

</body>
<jsp:include page="layout/footer.jsp" />
</html>
