<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/gh/eliyantosarage/font-awesome-pro@main/fontawesome-pro-6.5.2-web/css/all.min.css" rel="stylesheet">
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="resources/css/loading.css">
	<title> Loading </title>
</head>
<body>

<div id="loading">
	<img src="resources/img/loading.gif" alt="" id="loading-image" />
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function(){
        // API 호출 시작
        $.ajax({
            url: 'api-call-endpoint',  // API 호출 엔드포인트를 여기에 설정
            method: 'GET',
            success: function(data) {
                // API 호출이 성공하면 최종 페이지로 이동
                window.location.href = 'cat1.jsp';
            },
            error: function(xhr, status, error) {
                console.error("API 호출 실패:", status, error);
                // 실패 시 처리 로직 추가 (예: 에러 페이지로 이동)
                window.location.href = 'errorPage.jsp';
            }
        });
    });
</script>
</body>
</html>