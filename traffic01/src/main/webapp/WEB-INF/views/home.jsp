<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="resources/css/home.css">
    <title>Traffic Home</title>
</head>
<jsp:include page="layout/header.jsp" />
<body>
<div class="body_section">
	<div class="body_img_section">
		<div class="cat1">
			<img src="resources/img/logo1.jpg" alt="#" onclick="location.href='cat1'" />
		</div>
		<div class="cat2">
			<img src="resources/img/logo2.jpg" alt="#" onclick="location.href='cat2'" />
		</div>
		<div class="cat3">
			<img src="resources/img/logo3.jpg" alt="#" onclick="location.href='cat3'" />
		</div>
	</div>
	<div class="body_name_section">
		<div class="cat1_name" onclick="location.href='cat1'"> 실시간 <br /> 교통 정보 </div>
		<div class="cat2_name" onclick="location.href='cat2'"> 서울시 <br /> 생활 이동 통계 </div>
		<div class="cat3_name" onclick="location.href='cat3'"> 오늘 <br /> 서울은 </div>
	</div>
</div>


<!-- Script -->


</body>
<jsp:include page="layout/footer.jsp" />
</html>
