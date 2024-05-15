<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="resources/css/side_right.css">
	<link href="https://cdn.jsdelivr.net/gh/eliyantosarage/font-awesome-pro@main/fontawesome-pro-6.5.2-web/css/all.min.css" rel="stylesheet">
	<title>Insert title here</title>
</head>
<body>
    <div class="side_right_wrap">
    	<div class="wrap1">
	        <div class="side_right_title"> 실시간 서울시 교통정보 </div>
	        <div class="wrap2">
	        	<c:forEach var="i" begin="1" end="10">
		        	<div class="traffic_content">
		        		<div class="content_title">
		        			<i class="fa-solid fa-triangle-person-digging"></i>
		        			마곡중앙로
		        			<i class="fa-duotone fa-traffic-cone"></i>
		        		</div>
		        		<div class="content_content">
		        			(LG사이언스파크 → 마곡나루역)
		        			<br />
		        			3차로 시설물보수
		        		</div>
		        		<div class="content_time">
		        			<div class="time_1">
		        				발생일시 05.14 20:51
		        			</div>
		        			<div class="time_2">
		        				완료예정 05.14 23:00
		        			</div>
		        		</div>
		        	</div>
	        	</c:forEach>
	        </div>
    	</div>
    </div>
</body>
</html>