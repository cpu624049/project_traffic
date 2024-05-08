<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/header_footer.css" />
<link rel="stylesheet" href="mainCSS/sidebar.css" />
<link rel="stylesheet" href="mainCSS/main.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<title>Main</title>
</head>
<body>
	<!-- 헤더 -->
	<header>
		<!-- header_top : 헤더 윗부분 -->
		<div class="header_top">
			<!-- 왼쪽 여백 -->
			<div></div>
			<!-- header_logo : 로고 -->
			<div class="header_logo">
				<img src="${path}/resources/img/mainimg/logo_1_small_1459x344.jpg" alt="#" onclick="location.href='${path}/main'" />
			</div>
			<!-- header_search_box : 검색창 -->
			<div class="header_search_box">
				<form action="${path}/mainSearchView" method="get">
					<i class="fas fa-search header_search_box_icon"></i> <input
						type="text" name="mainSearchContent" value="${mainSearchContent }"
						class="header_search_box_input" placeholder="검색">
				</form>
			</div>
			<!-- header_login_box : 회원관리부분 -->
			<div class="header_login_box">
			<!-- 로그인 세션 부분 -->
				<c:choose>
				   <c:when test="${loginUserDto eq null }">
		   				<div class="header_login">
							<a href="${path}/my/loginform">로그인</a>
						</div>
						<div class="header_join">
							<a href="${path}/my/joinform">회원가입</a>
						</div>
				   </c:when>
				   <c:otherwise>
				   		<div class="header_nickname">
						   	${loginUserDto.nickname }님 <br />
				   		</div>
	   					<div class="header_login">
							<a href="${path}/my/logout">로그아웃</a>
						</div>
						<div class="header_join">
							<a href="${path}/my/mypage">mypage</a>
						</div>
				   </c:otherwise>
				</c:choose>
			</div>

			<!-- 오른쪽 여백 -->
			<div></div>
		</div>
		<!-- header_bottom : 헤더 아랫부분 -->
		<div id="header_bottom" class="header_bottom">
			<div class="header_category_list list_1">
				<a href="#" class="openModal">퀵견적</a>
			</div>
			<div class="header_category_list list_2">
				<a href="${path}/shop/list">소품샵</a>
			</div>
			<div class="header_category_list list_3">
				<a href="${path}/biz/search/bizAddrSearch">업체 둘러보기</a>
			</div>
			<div class="header_category_list list_4">
				<a href="${path}/oh/OHMainView">우리 집 자랑하기</a>
			</div>
			<div class="header_category_list list_5">
				<a href="${path}/cshome">고객센터</a>
			</div>
		</div>
	</header>
	<br />
	<br />
	<div class="body_section">
		<!--carousel_main : 최상위 클래스로 캐러셀의 전체 구조를 잡아줍니다.
        carousel_wrapper : 캐러셀 슬라이드의 전체 구조를 잡아줍니다.
        carousel_slide : 캐러셀 이미지를 설정합니다.
        carousel_button_container : 슬라이드를 넘기기 위한 사이드 버튼의 전체 구조를 잡아줍니다.
        carousel_pagination : 캐러셀 중앙 버튼의 전체 구조를 잡아줍니다.
        carousel_circle : 캐러셀 중앙 버튼을 설정합니다.-->
		<div class="carousel_whole_wrap">
			<div class="carousel_main">
				<div class="carousel_wrapper">
					<div class="carousel_slide">
						<img src="${path}/resources/img/mainimg/mgz1.jpg" alt="#" />
					</div>
					<div class="carousel_slide">
						<img src="${path}/resources/img/mainimg/mgz2.jpg" alt="#"
						onclick="location.href='${path}/biz/magazine/bizMgzList'" />
					</div>
					<div class="carousel_slide">
						<img src="${path}/resources/img/mainimg/mgz3.jpg" alt="#"
						onclick="location.href='${path}/biz/magazine/bizMgzList'" />
					</div>
					<div class="carousel_slide">
						<img src="${path}/resources/img/mainimg/mgz4.jpg" alt="#"
						onclick="location.href='${path}/biz/magazine/bizMgzList'" />
					</div>
					<div class="carousel_slide">
						<img src="${path}/resources/img/mainimg/mgz5.jpg" alt="#"
						onclick="location.href='${path}/biz/magazine/bizMgzList" />
					</div>
				</div>
			</div>
			<!-- 캐러셀 중앙 버튼 -->
			<div class="carousel_pagination">
				<div class="carousel_circle"></div>
				<div class="carousel_circle"></div>
				<div class="carousel_circle"></div>
				<div class="carousel_circle"></div>
				<div class="carousel_circle"></div>
			</div>
			<!-- 캐러셀 작동 js -->
			<script>
				var swiper = document.querySelector('.carousel_wrapper');
				var bullets = document.querySelectorAll('.carousel_circle');
				var currentSlide = 0;
				function showSlide(slideIndex) {
					swiper.style.transform = "translateX(-" + slideIndex * 700
							+ "px)";
					currentSlide = slideIndex;
					bullets.forEach(function(bullet, index) {
						if (index === currentSlide) {
							bullet.classList.add('active');
						} else {
							bullet.classList.remove('active');
						}
					});
				}
				bullets.forEach(function(bullet, index) {
					bullet.addEventListener('click', function() {
						showSlide(index);
					});
				});
				showSlide(0);
				setInterval(function(intervalSlide){
					if (currentSlide < 5) {
						showSlide(currentSlide + 1);
					}
					if (currentSlide == 5) {
						showSlide(0);
					}
				}, 2000);
			</script>
			
			<div class="carousel_main2">
				<div class="carousel_wrapper2">
					<div class="carousel_slide2">
						<img src="${path}/resources/img/mainimg/oh_preview_001.jpg" alt="#"
						onclick="location.href='${path}/oh/OHMainView'" />
					</div>
					<div class="carousel_slide2">
						<img src="${path}/resources/img/mainimg/oh_preview_002.jpg" alt="#"
						onclick="location.href='${path}/oh/OHMainView'" />
					</div>
					<div class="carousel_slide2">
						<img src="${path}/resources/img/mainimg/oh_preview_003.jpg" alt="#"
						onclick="location.href='${path}/oh/OHMainView'" />
					</div>
					<div class="carousel_slide2">
						<img src="${path}/resources/img/mainimg/oh_preview_004.jpg" alt="#"
						onclick="location.href='${path}/oh/OHMainView" />
					</div>
				</div>
			</div>
			<!-- 캐러셀 중앙 버튼 -->
			<div class="carousel_pagination2">
				<div class="carousel_circle2"></div>
				<div class="carousel_circle2"></div>
				<div class="carousel_circle2"></div>
				<div class="carousel_circle2"></div>
			</div>
		</div>
		<!-- 캐러셀 작동 js -->
		<script>
			var swiper2 = document.querySelector('.carousel_wrapper2');
			var bullets2 = document.querySelectorAll('.carousel_circle2');
			var currentSlide2 = 0;
			function showSlide2(slideIndex2) {
				swiper2.style.transform = "translateX(-" + slideIndex2 * 400
						+ "px)";
				currentSlide2 = slideIndex2;
				bullets2.forEach(function(bullet2, index2) {
					if (index2 === currentSlide2) {
						bullet2.classList.add('active');
					} else {
						bullet2.classList.remove('active');
					}
				});
			}
			bullets2.forEach(function(bullet2, index2) {
				bullet2.addEventListener('click', function() {
					showSlide2(index2);
				});
			});
			showSlide2(0);
			setInterval(function(intervalSlide2){
				if (currentSlide2 < 4) {
					showSlide2(currentSlide2 + 1);
				}
				if (currentSlide2 == 4) {
					showSlide2(0);
				}
			}, 3000);
		</script>
		<br />
		<div id="category_button" class="category_button_wrap">
			<button id="category_button" class="openModal category_button category_1">
				<span>퀵견적</span>
			</button>
			<button onclick="location.href='${path}/shop/list'" id="category_button" class="category_button category_2">
				<span>소품 샵</span>
			</button>
			<button onclick="location.href='${path}/biz/search/bizAddrSearch'" id="category_button" class="category_button category_3">
				<span>업체 <br> 둘러보기
				</span>
			</button>
			<button onclick="location.href='${path}/oh/OHMainView'" id="category_button" class="category_button category_4">
				<span>우리 집 <br> 자랑하기
				</span>
			</button>
			<button onclick="location.href='${path}/cshome'" id="category_button" class="category_button category_5">
				<span>고객센터</span>
			</button>
			<br />
		</div>
		<div class="main_preview_wrap">
			<div class="main_preview">
				<h1 class="main_preview_title"><a href="${path}/biz/search/bizAddrSearch">입점 업체 보기</a></h1>
				<hr />
				<div class="main_preview_biz">
					<c:forEach items="${bizPreviewList }" var="biz">
						<div class="main_preview_biz_list">
							<ul>
								<li class="main_preview_biz_img">
									<img src="${path}/resources/upload/biz/home/${biz.bh_img }" alt="#" onclick="location.href='${path}/biz/search/bizAddrSearch'" />
								</li>
							</ul>
							<ul>
								<li class="main_preview_biz_name"><a href="${path}/biz/search/bizAddrSearch">${biz.bh_name }</a></li>
							</ul>
							<ul>
								<li class="main_preview_biz_addr"><a href="${path}/biz/search/bizAddrSearch">${biz.bh_addr1 } <br /> ${biz.bh_addr2 } </a></li>
							</ul>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="main_preview">
				<h1 class="main_preview_title"><a href="${path}/shop/list">소품 샵</a></h1>
				<hr />
				<div class="main_preview_shop">
					<c:forEach items="${shopPreviewList }" var="shop">
						<div class="main_preview_shop_list">
							<ul>
								<li class="main_preview_shop_img">
									<img src="${path}/resources/upload/shop/${shop.file_src }" alt="#" onclick="location.href='${path}/shop/list'" />
								</li>
							</ul>
							<ul>
								<li class="main_preview_shop_name"><a href="${path}/shop/list">${shop.name }</a></li>
							</ul>
							<ul>
								<li class="main_preview_shop_price"><a href="${path}/shop/list">\ ${shop.rep_price }</a></li>
							</ul>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="main_preview">
				<h1 class="main_preview_title"><a href="${path}/oh/OHMainView">우리집 자랑하기</a></h1>
				<hr />
				<div class="main_preview_OH">
					<c:forEach items="${ohPreviewList }" var="oh">
						<div class="main_preview_OH_list">
							<ul>
								<li class="main_preview_OH_img">
									<img src="${path}/resources/upload/oh/photo/${oh.pa_attach }" alt="#" onclick="location.href='${path}/oh/OHMainView'" />
								</li>
							</ul>
							<ul>
								<li class="main_preview_OH_name"><a href="${path}/oh/OHMainView">${oh.pb_title }</a></li>
							</ul>
							<ul>
								<li class="main_preview_OH_content"><a href="${path}/oh/OHMainView">${oh.pb_content }</a></li>
							</ul>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="main_preview_cs">
				<div class="main_preview_cs_notice">
					<h1 class="main_preview_title"><a href="${path}/noticelist">공지사항</a></h1>
					<hr>
					<div class="main_preview_cs_notice_board">
						<ul>
							<li class="main_preview_cs_notice_category w10 bb">번호</li>
							<li class="main_preview_cs_notice_category w30 bb">제목</li>
							<li class="main_preview_cs_notice_category w20 bb">작성자</li>
							<li class="main_preview_cs_notice_category w15 bb">조회수</li>
							<li class="main_preview_cs_notice_category w24 bb">작성일</li>
						</ul>
						<c:forEach items="${noticePreviewList }" var="notice">
							<ul>
								<li class="main_preview_cs_notice_category w10"><a href="${path}/noticelist">${notice.notice_no }</a></li>
								<li class="main_preview_cs_notice_category w30"><a href="${path}/noticelist">${notice.notice_title }</a></li>
								<li class="main_preview_cs_notice_category w20"><a href="${path}/noticelist">${notice.notice_writer }</a></li>
								<li class="main_preview_cs_notice_category w15"><a href="${path}/noticelist">${notice.notice_hit }</a></li>
								<li class="main_preview_cs_notice_category w24"><a href="${path}/noticelist"><fmt:formatDate value="${notice.notice_date }" pattern="yyyy-MM-dd" /></a></li>
							</ul>
						</c:forEach>
					</div>
				</div>
				<div class="main_preview_cs_qna">
					<h1 class="main_preview_title"><a href="${path}/qnalist">QnA</a></h1>
					<hr>
					<div class="main_preview_cs_qna_board">
						<ul>
							<li class="main_preview_cs_qna_category w10 bb">번호</li>
							<li class="main_preview_cs_qna_category w30 bb">제목</li>
							<li class="main_preview_cs_qna_category w20 bb">작성자</li>
							<li class="main_preview_cs_qna_category w15 bb">조회수</li>
							<li class="main_preview_cs_qna_category w24 bb">작성일</li>
						</ul>
						<c:forEach items="${qnaPreviewList }" var="qna">
							<ul>
								<li class="main_preview_cs_qna_category w10"><a href="${path}/qnalist">${qna.qna_no }</a></li>
								<li class="main_preview_cs_qna_category w30"><a href="${path}/qnalist">${qna.qna_title }</a></li>
								<li class="main_preview_cs_qna_category w20"><a href="${path}/qnalist">${qna.qna_writer }</a></li>
								<li class="main_preview_cs_qna_category w15"><a href="${path}/qnalist">${qna.qna_hit }</a></li>
								<li class="main_preview_cs_qna_category w24"><a href="${path}/qnalist"><fmt:formatDate value="${qna.qna_date }" pattern="yyyy-MM-dd" /></a></li>
							</ul>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
        <div id="main_left_side_bar" class="main_left_side_bar">
            <button class="openModal side_bar_button button_1">
				<span>퀵견적</span>
			</button>
			<button onclick="location.href='${path}/shop/list'"	class="side_bar_button button_2">
				<span>소품 샵</span>
			</button>
			<button class="side_bar_button button_3" onclick="location.href='${path}/biz/search/bizAddrSearch'" >
				<span>업체 <br> 둘러보기
				</span>
			</button>
			<button onclick="location.href='${path}/oh/OHMainView'"	class="side_bar_button button_4">
				<span>우리 집 <br> 자랑하기
				</span>
			</button>
			<button onclick="location.href='${path}/cshome'" class="side_bar_button button_5">
				<span>고객센터</span>
			</button>
        </div>

        <script>
        window.addEventListener('scroll', function() {
            var scrollHeight = window.scrollY;
            var headerBottom = document.getElementById('header_bottom');
            var mainLeftSideBar = document.getElementById('main_left_side_bar');

            if(scrollHeight > 10) {
                headerBottom.style.visibility = 'hidden';
                headerBottom.style.opacity ='0';
            } else {
                headerBottom.style.visibility = 'visible';
                headerBottom.style.opacity ='1';
            }
            
            if(scrollHeight > 700) {
                mainLeftSideBar.style.visibility = 'visible';
                mainLeftSideBar.style.opacity = '1';
            } else {
                mainLeftSideBar.style.visibility = 'hidden';
                mainLeftSideBar.style.opacity = '0';
            }
        });
        </script>
		<hr />
	</div>
	<br />
	<br />
	<!-- 푸터 -->
	<footer>
		<!-- 푸터 로고 -->
		<div class="footer_logo">
			<img src="resources/img/mainimg/logo_3_1500x1500.jpg" alt="#" onclick="location.href='${path}/main'"  />
		</div>
		<!-- 푸터 내용 -->
		<div class="footer_content">(주) 카피바라 주소 : 대한민국 서울시 양천구 목동 655-19
			대표 : 조보근 전화번호 : 010-3017-5283</div>
		<!-- sns 아이콘 -->
		<div class="footer_sns">
			<a href="https://www.facebook.com/"><i class="fab fa-facebook fa-lg"></i></a>
			<a href="https://www.youtube.com/"><i class="fab fa-youtube fa-lg"></i></a>
			<a href="https://www.twitter.com/"><i class="fab fa-twitter fa-lg"></i></a>
			<a href="https://www.twitch.tv/"><i class="fab fa-twitch fa-lg"></i></a>
			<a href="https://www.instagram.com/"><i class="fab fa-instagram fa-lg"></i></a>
		</div>
	</footer>
</body>
</html>