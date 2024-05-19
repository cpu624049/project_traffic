<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        .number-container {
            font-size: 48px;
            font-weight: bold;
            text-align: center;
            margin-top: 50px;
        }
    </style>
</head>
<body>
    <div class="number-container">0</div>
    <div class="number-container">0</div>
    <div class="number-container">0</div>
    <div class="number-container">0</div>
    <div class="number-container">0</div>
    
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script>
        window.onload = function() {
            // getElementsByClassName을 사용하여 클래스 이름으로 요소 선택
            const numberContainers = document.getElementsByClassName('number-container');
            let intervals = [];

            // 1초 동안 랜덤 숫자 보여주기
            const showRandomNumbers = () => {
                for (let i = 0; i < numberContainers.length; i++) {
                    intervals[i] = setInterval(() => {
                        const randomNum = Math.floor(Math.random() * 1000); // 0부터 999까지의 랜덤 숫자
                        numberContainers[i].innerText = randomNum;
                    }, 10); // 0.1초마다 숫자 갱신
                }
            };

            // 1초 후 지정된 숫자로 변경
            const setFinalNumbers = () => {
                const finalNumbers = [111111, 222222, 333333, 444444, 555555]; // 지정된 숫자들
                for (let i = 0; i < numberContainers.length; i++) {
                    clearInterval(intervals[i]);
                    numberContainers[i].innerText = finalNumbers[i];
                }
            };

            // 초기화
            showRandomNumbers();

            // 1초 후 지정된 숫자로 변경
            setTimeout(setFinalNumbers, 700);
        };
    </script>
</body>
</html>