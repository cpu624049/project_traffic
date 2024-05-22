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
	        <div class="side_right_title"> 실시간 사고 정보 </div>
	        <div class="wrap2">
	        	<c:forEach items="${xmlDataList1 }" var="xml1">
		        	<div class="traffic_content">
		        		<div class="content_title">
		        			<i class="fa-solid fa-triangle-person-digging"></i>
		        			<c:set var="accTypeName" value="" />
							<c:choose>
								<c:when test="${xml1.accType eq 'A01'}">
									<c:set var="accTypeName" value="교통사고" />
									<c:out value="${accTypeName }" />
								</c:when>
								<c:when test="${xml1.accType eq 'A02'}">
									<c:set var="accTypeName" value="차량고장" />
									<c:out value="${accTypeName }" />
								</c:when>
								<c:when test="${xml1.accType eq 'A03'}">
									<c:set var="accTypeName" value="보행사고" />
									<c:out value="${accTypeName }" />
								</c:when>
								<c:when test="${xml1.accType eq 'A04'}">
									<c:set var="accTypeName" value="공사" />
									<c:out value="${accTypeName }" />
								</c:when>
								<c:when test="${xml1.accType eq 'A05'}">
									<c:set var="accTypeName" value="낙하물" />
									<c:out value="${accTypeName }" />
								</c:when>
								<c:when test="${xml1.accType eq 'A06'}">
									<c:set var="accTypeName" value="버스사고" />
									<c:out value="${accTypeName }" />
								</c:when>
								<c:when test="${xml1.accType eq 'A07'}">
									<c:set var="accTypeName" value="지하철사고" />
									<c:out value="${accTypeName }" />
								</c:when>
								<c:when test="${xml1.accType eq 'A08'}">
									<c:set var="accTypeName" value="화재" />
									<c:out value="${accTypeName }" />
								</c:when>
								<c:when test="${xml1.accType eq 'A09'}">
									<c:set var="accTypeName" value="기상 / 재난" />
									<c:out value="${accTypeName }" />
								</c:when>
								<c:when test="${xml1.accType eq 'A10'}">
									<c:set var="accTypeName" value="집회 및 행사" />
									<c:out value="${accTypeName }" />
								</c:when>
								<c:when test="${xml1.accType eq 'A11'}">
									<c:set var="accTypeName" value="기타" />
									<c:out value="${accTypeName }" />
								</c:when>
								<c:when test="${xml1.accType eq 'A12'}">
									<c:set var="accTypeName" value="제보" />
									<c:out value="${accTypeName }" />
								</c:when>
								<c:when test="${xml1.accType eq 'A13'}">
									<c:set var="accTypeName" value="단순정보" />
									<c:out value="${accTypeName }" />
								</c:when>
							</c:choose>
		        			<i class="fa-duotone fa-traffic-cone"></i>
		        		</div>
		        		<div class="content_content">
		        			${xml1.accInfo }
		        		</div>
		        		<div class="content_time" id="content_time">
		        			<div class="time_1">
		        				발생 일시 : 
		        				<fmt:parseDate value="${xml1.occrDate }" var="occrDate" pattern="yyyyMMdd" />
		        				<fmt:formatDate value="${occrDate }" pattern="yyyy.MM.dd" />
		        				<c:set var="formattedTime1" value="${xml1.occrTime.substring(0,2)}:${xml1.occrTime.substring(2,4)}" />
		        				${formattedTime1 }
		        			</div>
		        			<div class="time_2">
		        				완료 예정 : 
		        				<fmt:parseDate value="${xml1.expClrDate }" var="expClrDate" pattern="yyyyMMdd" />
		        				<fmt:formatDate value="${expClrDate }" pattern="yyyy.MM.dd" />
		        				<c:set var="formattedTime2" value="${xml1.expClrTime.substring(0,2)}:${xml1.occrTime.substring(2,4)}" />
		        				${formattedTime2 }		        				
		        			</div>
		        		</div>
		        	</div>
	        	</c:forEach>
	        </div>
    	</div>
    </div>
</body>
</html>