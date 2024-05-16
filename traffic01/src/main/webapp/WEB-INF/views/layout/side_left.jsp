<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="resources/css/side_left.css">
	<link href="https://cdn.jsdelivr.net/gh/eliyantosarage/font-awesome-pro@main/fontawesome-pro-6.5.2-web/css/all.min.css" rel="stylesheet">
	<title>Insert title here</title>
</head>
<body>
    <div class="side_left_wrap">
        <div class="cat" OnClick="location.href='cat1'"><div class="cat_title title1"> 실시간 <br /> 교통 정보 </div></div>
        <div class="cat" OnClick="location.href='cat2'"><div class="cat_title title2"> 서울시 <br /> 생활 이동 <br /> 통계 </div></div>
        <div class="cat" OnClick="location.href='cat3'"><div class="cat_title title3"> 오늘 <br /> 서울은 </div></div>
		<div class="dropdown">
		    <button class="dropdown-button">Dropdown</button>
		    <div class="dropdown-content">
		        <a href="#">Link 1</a>
		        <a href="#">Link 2</a>
		        <a href="#">Link 3</a>
		    </div>
		</div>
    </div>
</body>
</html>