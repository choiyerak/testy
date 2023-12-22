<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD:project/src/main/webapp/WEB-INF/views/home.jsp
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"      prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"       prefix="fmt" %>    
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <!-- 탭 이름 -->
    <title>학원 프로젝트</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

  <path d="M6.445 11.688V6.354h-.633A12.6 12.6 0 0 0 4.5 7.16v.695c.375-.257.969-.62 1.258-.777h.012v4.61h.675zm1.188-1.305c.047.64.594 1.406 1.703 1.406 1.258 0 2-1.066 2-2.871 0-1.934-.781-2.668-1.953-2.668-.926 0-1.797.672-1.797 1.809 0 1.16.824 1.77 1.676 1.77.746 0 1.23-.376 1.383-.79h.027c-.004 1.316-.461 2.164-1.305 2.164-.664 0-1.008-.45-1.05-.82h-.684zm2.953-2.317c0 .696-.559 1.18-1.184 1.18-.601 0-1.144-.383-1.144-1.2 0-.823.582-1.21 1.168-1.21.633 0 1.16.398 1.16 1.23"/>
  <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5M1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4z"/>
</svg>

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">
	<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.0.0/uicons-thin-straight/css/uicons-thin-straight.css'>
    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap" rel="stylesheet">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>
<script src="js/modernizer.js"></script>
<body>
    <div class="container-xxl bg-white p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->
        <!-- 템플릿 헤더 시작 -->
        <!-- Navbar Start -->
        <div class="container-fluid nav-bar bg-transparent">
            <nav class="navbar navbar-expand-lg bg-white navbar-light py-0 px-4">
                <a href="home" class="navbar-brand d-flex align-items-center text-center">
                    <div class="icon p-2 me-2">
                        <img class="img-fluid" src="img/icon-deal.png" alt="Icon" style="width: 30px; height: 30px;">
                    </div>
                    <h1 class="m-0 text-primary">Gangnam Culture</h1>
                </a>
                <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto">
                        <a href="about.html" class="nav-item nav-link active">공지사항</a>
                        <a href="about.html" class="nav-item nav-link">문의사항</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">시설</a>
                            <div class="dropdown-menu rounded-0 m-0">
                                <a href="center" class="dropdown-item">센터소개</a>
                                <a href="property-type.html" class="dropdown-item">시설소개</a>
                                <a href="teacher" class="dropdown-item">강사소개</a>
                                <a href="property-agent.html" class="dropdown-item">찾아오는 길</a>
                            </div>
                        </div>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">강좌</a>
                            <div class="dropdown-menu rounded-0 m-0">
                            	<a href="testimonial.html" class="dropdown-item">수강 개설</a><!-- 강사만 접근 가능  -->
                                <a href="testimonial.html" class="dropdown-item">수강 목록</a>
                                <a href="sugang" class="dropdown-item">수강 신청</a>
                            </div>
                        </div>
                        <a href="contact.html" class="nav-item nav-link">커뮤니티</a>
                        <a href="contact.html" class="nav-item nav-link">마이페이지</a>
                    </div>
                    <c:if test="${s_id != null}">
				    	<a href="login" class="btn btn-primary px-3 d-none d-lg-flex">로그아웃</a>
				    </c:if>
				    <c:if test="${s_id == null}">
				    	<a href="login" class="btn btn-primary px-3 d-none d-lg-flex">로그인</a>
					</c:if>
                </div>
            </nav>
        </div>
        <!-- Navbar End -->
        <!-- 템플릿 헤더 시작 -->
        
        <!-- 인덱스 페이지 본문 시작 -->
=======
<%@ include file="../template/header_v1.jsp" %>
<!-- 본문 시작 home.jsp -->
<!-- 인덱스 페이지 본문 시작 -->
>>>>>>> 59114d0c28a67bc88e76599c07e67d66141c0961:project/src/main/webapp/WEB-INF/views/home/home.jsp
        <!-- Header Start -->
        <div class="container-fluid header bg-white p-0">
       		<!-- Carousel -->
			<div id="demo" class="carousel slide" data-bs-ride="carousel">
			  <!-- Indicators/dots -->
			  <!-- <div class="carousel-indicators">
			    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
			    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
			    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
			  </div> -->
				  
			  <!-- The slideshow/carousel : 슬라이드 쇼 -->
			  <div class="carousel-inner">
			  	<!-- 첫번째 사진 -->
			    <div class="carousel-item active">
			      <img src="img/center001.jpg" alt="Los Angeles" class="d-block" style="width:100%">
			    </div>
			    <!-- 두번째 사진 -->
			    <div class="carousel-item">
			      <img src="img/center004.jpg" alt="Chicago" class="d-block" style="width:100%">
			    </div>
			  </div>
  
  			  <!-- 슬라이드 쇼 좌우 이동 -->
			  <!-- Left and right controls/icons -->
			  <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon"></span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
			    <span class="carousel-control-next-icon"></span>
			  </button>
			</div>
        </div>
        <!-- Header End -->
<!-- 검색 시작 -->
        <div class="container-fluid bg-primary mb-5 wow fadeIn" data-wow-delay="0.1s" style="padding: 35px;">
            <div class="container">
                <div class="row g-2">
                    <div class="col-md-10">
                        <div class="row g-2">
                            
                            <div class="col-md-4">
                                <select class="form-select border-0 py-3">
                                    <option selected>센터 검색</option>
                                    <option value="1">강남구센터 </option>
                                    <option value="2">논현동센터</option>
                                    <option value="3">대치동센터</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <select class="form-select border-0 py-3">
                                    <option selected>강좌 카테고리</option>
                                    <option value="1">웹개발</option>
                                    <option value="2">웹디자인</option>
                                    <option value="3">AI</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <input type="text" class="form-control border-0 py-3" placeholder="강좌검색">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <button class="btn btn-dark border-0 w-100 py-3">검색</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- 검색 끝 -->

		<!-- 탭 테이블 시작 -->
		<section class="whats-news-area pt-50 pb-20">
        <div class="container">
            <div class="row">
            <div class="col-lg-8">
                <div class="row d-flex justify-content-between">
                    <!-- 테이블 -->
                    <div class="col-lg-12 col-md-12">
                        <div class="properties__button">
                            <!--Nav Button  -->                                            
                            <nav>                                                                     
                                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">공지사항</a>
                                    <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">문의사항</a>
                                    <a class="nav-item nav-link" id="nav-last-tab" data-toggle="tab" href="#nav-last" role="tab" aria-controls="nav-contact" aria-selected="false">강좌</a>
                                    <a class="nav-item nav-link" id="nav-Sports" data-toggle="tab" href="#nav-nav-Sport" role="tab" aria-controls="nav-contact" aria-selected="false">커뮤니티</a>
                                </div>
                            </nav>
                            <!--End Nav Button  -->
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <!-- Nav Card -->
                        <div class="tab-content" id="nav-tabContent">
                            <!-- card one -->
                            <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">           
                                <div class="whats-news-caption">
                                    <table class="table">
                                    	<tr>
                                    		<th>
                                    			<a href="#">
	                                    			<span class="badge bg-primary">강남점</span>
	                                    			<span>자바 150기 모집중</span>
                                    			</a></th>
                                    		<td>접수중</td>
                                    	</tr>
                                    	<tr>
                                    		<th>
                                    			<a href="#">
	                                    			<span class="badge bg-warning">압구정점</span>
	                                    			<span>빅데이터 30001기 모집중</span></th>
                                    			</a>
                                    		<td>접수중</td>
                                    	</tr>
                                    	<tr>
                                    		<th>
                                    			<a href="#">
	                                    			<span class="badge bg-dark">인천점</span>
	                                    			<span>웹디자인 111기</span>
                                    			</a>
                                   			</th>
                                    		<td>접수중</td>
                                    	</tr>
                                    	<tr>
                                    		<th>
                                    			<a href="#">
                                    				<span class="badge bg-primary">강남점</span>
                                    				<span>자바 150기 모집중</span>
                                    			</a>
                                    		</th>
                                    		<td>접수전</td>
                                    	</tr>
                                    	<tr>
                                    		<th>
	                                    		<a href="#">
	                                   				<span class="badge bg-danger">부산점</span>
	                                    			<span>머신러닝 3기</span></th>
	                                    		</a>
                                    		
                                    		<td>접수전</td>
                                    	</tr>
                                    	<tr>
                                    		<th>
	                                    		<a href="#">
                                    				<span class="badge bg-secondary">원주점</span>
	                                    			<span>C언어 1기</span></a></th>
	                                    		</a>
                                    		<td>접수전</td>
                                    	</tr>
                                    </table>
                                </div>
                            </div>
                            <!-- Card One ends -->
                    	</div>
               		</div>
            	</div>
            </div>
            <!-- 내용 추가 예정  -->
            <div class="col-lg-4">
            	<div class="loginRec">
             	<h3>인기 강좌</h3>
	             	<table>
	             	<tr>
	             		<th>
	             		1
	             		</th>
	             		<td>
							자바             		
	             		</td>
	             		
	             	</tr>
	             	<tr>
	             		<th>
	             		2	
	             		</th>
	             		<td>
							파이썬             		
	             		</td>
	             	</tr>
	             	<tr>
	             		<th>
	             		3	
	             		</th>
	             		<td>
							AI             		
	             		</td>
	             	</tr>
	             	<tr>
	             		<th>
	             		4	
	             		</th>
	             		<td>
							빅데이터             		
	             		</td>
	             	</tr>
	             	<tr>
	             		<th>
	             		5	
	             		</th>
	             		<td>
							머신러닝             		
	             		</td>
	             	</tr>
	             	</table>
             	</div>
            </div>
        </div>
    </section>
    <!-- 탭 테이블 끝 -->
    <!-- 카테고리 시작 -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                <h1 class="mb-3">수강 일정</h1>
            </div>
            <div class="row g-4">
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.1s">
                    <a class="cat-item d-block bg-light text-center rounded p-3" href="">
                        <div class="rounded p-4">
                            <div class="icon mb-3">
                                <!-- <img class="img-fluid" src="img/icon-apartment.png" alt="Icon"> -->
                                <i class="bi bi-book"></i>
                            </div>
                            <h6>온라인 수강 신청</h6>
                            <span>123 강의 접수중</span>
                        </div>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.3s">
                    <a class="cat-item d-block bg-light text-center rounded p-3" href="">
                        <div class="rounded p-4">
                            <div class="icon mb-3">
                                <!-- <img class="img-fluid" src="img/icon-villa.png" alt="Icon"> -->
                                <i class="bi bi-calendar-date"></i>
                            </div>
                            <h6>강좌일정</h6>
                            <span>강좌일정</span>
                        </div>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.5s">
                    <a class="cat-item d-block bg-light text-center rounded p-3" href="">
                        <div class="rounded p-4">
                            <div class="icon mb-3">
                                <!-- <img class="img-fluid" src="img/icon-house.png" alt="Icon"> -->
                                <i class="bi bi-house-door"></i>
                            </div>
                            <h6>센터 시설 정보</h6>
                            <span>시설 정보입니다</span>
                        </div>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                    <a class="cat-item d-block bg-light text-center rounded p-3" href="">
                        <div class="rounded p-4">
                            <div class="icon mb-3">
                                <!-- <img class="img-fluid" src="img/icon-housing.png" alt="Icon"> -->
                                <i class="bi bi-question-circle"></i>
                            </div>
                            <h6>QnA</h6>
                            <span>질문 사절</span>
                        </div>
                    </a>
                </div>
                
            </div>
        </div>
    </div>
    <!-- 카테고리 시작 -->

    <!-- Property List Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="row g-0 gx-5 align-items-end">
            	<!--  -->
                <div class="col-lg-6">
                    <div class="text-start mx-auto mb-5 wow slideInLeft" data-wow-delay="0.1s">
                        <h1 class="mb-3">현재 모집중인 강좌</h1>
                    </div>
                </div>
                <div class="col-lg-6 text-start text-lg-end wow slideInRight" data-wow-delay="0.1s">
                    <ul class="nav nav-pills d-inline-flex justify-content-end mb-5">
                        <li class="nav-item me-2">
                            <a class="btn btn-outline-primary active" data-bs-toggle="pill" href="#tab-1">웹개발</a>
                        </li>
                        <li class="nav-item me-2">
                            <a class="btn btn-outline-primary" data-bs-toggle="pill" href="#tab-2">웹디자인</a>
                        </li>
                        <li class="nav-item me-0">
                            <a class="btn btn-outline-primary" data-bs-toggle="pill" href="#tab-3">전산회계</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="tab-content">
                <div id="tab-1" class="tab-pane fade show p-0 active">
                    <div class="row g-4">
                        <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="property-item rounded overflow-hidden">
                                <div class="position-relative overflow-hidden">
                                    <a href=""><img class="img-fluid" src="img/java1.png" alt=""></a>
                                    <div class="bg-primary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">마감임박</div>
                                    <div class="bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3">강남점</div>
                                </div>
                                <div class="p-4 pb-0">
                                    <h5 class="text-primary mb-3">자바 기초</h5>
                                    <a class="d-block h5 mb-2" href="">2024.01.02 - 2024.04.02</a>
                                </div>
                                <div class="d-flex border-top">
                                    <small class="flex-fill text-center border-end py-2">30명</small>
                                    <small class="flex-fill text-center border-end py-2">301강의장</small>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="property-item rounded overflow-hidden">
                                <div class="position-relative overflow-hidden">
                                    <a href=""><img class="img-fluid" src="img/bigdata.png" alt=""></a>
                                    <div class="bg-primary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">모집중</div>
                                    <div class="bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3">부산점</div>
                                </div>
                                <div class="p-4 pb-0">
                                    <h5 class="text-primary mb-3">빅데이터 기초</h5>
                                    <a class="d-block h5 mb-2" href="">2024.01.26 - 2024.07.27</a>
                                </div>
                                <div class="d-flex border-top">
                                    <small class="flex-fill text-center border-end py-2">30명</small>
                                    <small class="flex-fill text-center border-end py-2">401강의장</small>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="property-item rounded overflow-hidden">
                                <div class="position-relative overflow-hidden">
                                    <a href=""><img class="img-fluid" src="img/java1.png" alt=""></a>
                                    <div class="bg-primary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">모집예정</div>
                                    <div class="bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3">강남점</div>
                                </div>
                                <div class="p-4 pb-0">
                                    <h5 class="text-primary mb-3">자바 기초</h5>
                                    <a class="d-block h5 mb-2" href="">2024.05.02 - 2024.11.02</a>
                                </div>
                                <div class="d-flex border-top">
                                    <small class="flex-fill text-center border-end py-2">30명</small>
                                    <small class="flex-fill text-center border-end py-2">301강의장</small>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="property-item rounded overflow-hidden">
                                <div class="position-relative overflow-hidden">
                                    <a href=""><img class="img-fluid" src="img/java1.png" alt=""></a>
                                    <div class="bg-primary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">모집예정</div>
                                    <div class="bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3">신촌점</div>
                                </div>
                                <div class="p-4 pb-0">
                                    <h5 class="text-primary mb-3">오라클 DB</h5>
                                    <a class="d-block h5 mb-2" href="">2024.03.11 - 2024.06.21</a>
                                </div>
                                <div class="d-flex border-top">
                                    <small class="flex-fill text-center border-end py-2">20명</small>
                                    <small class="flex-fill text-center border-end py-2">201 강의장</small>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="property-item rounded overflow-hidden">
                                <div class="position-relative overflow-hidden">
                                    <a href=""><img class="img-fluid" src="img/running.png" alt=""></a>
                                    <div class="bg-primary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">모집중</div>
                                    <div class="bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3">인천점</div>
                                </div>
                                <div class="p-4 pb-0">
                                    <h5 class="text-primary mb-3">머신러닝</h5>
                                    <a class="d-block h5 mb-2" href="">2024.01.11 - 2024.06.21</a>
                                </div>
                                <div class="d-flex border-top">
                                    <small class="flex-fill text-center border-end py-2">20명</small>
                                    <small class="flex-fill text-center border-end py-2">404 강의장</small>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="property-item rounded overflow-hidden">
                                <div class="position-relative overflow-hidden">
                                    <a href=""><img class="img-fluid" src="img/c.png" alt=""></a>
                                    <div class="bg-primary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">모집중</div>
                                    <div class="bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3">원주점</div>
                                </div>
                                <div class="p-4 pb-0">
                                    <h5 class="text-primary mb-3">c언어</h5>
                                    <a class="d-block h5 mb-2" href="">2024.03.11 - 2024.06.21</a>
                                </div>
                                <div class="d-flex border-top">
                                    <small class="flex-fill text-center border-end py-2">20명</small>
                                    <small class="flex-fill text-center border-end py-2">201 강의장</small>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-12 text-center wow fadeInUp" data-wow-delay="0.1s">
                            <a class="btn btn-primary py-3 px-5" href="">더보기</a>
                        </div>
                    </div>
                </div>
                <div id="tab-2" class="tab-pane fade show p-0">
                    <div class="row g-4">
                        <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="property-item rounded overflow-hidden">
                                <div class="position-relative overflow-hidden">
                                    <a href=""><img class="img-fluid" src="img/java1.png" alt=""></a>
                                    <div class="bg-primary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">마감임박</div>
                                    <div class="bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3">강남점</div>
                                </div>
                                <div class="p-4 pb-0">
                                    <h5 class="text-primary mb-3">자바 기초</h5>
                                    <a class="d-block h5 mb-2" href="">2024.01.02 - 2024.04.02</a>
                                </div>
                                <div class="d-flex border-top">
                                    <small class="flex-fill text-center border-end py-2">30명</small>
                                    <small class="flex-fill text-center border-end py-2">301강의장</small>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="property-item rounded overflow-hidden">
                                <div class="position-relative overflow-hidden">
                                    <a href=""><img class="img-fluid" src="img/bigdata.png" alt=""></a>
                                    <div class="bg-primary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">모집중</div>
                                    <div class="bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3">부산점</div>
                                </div>
                                <div class="p-4 pb-0">
                                    <h5 class="text-primary mb-3">빅데이터 기초</h5>
                                    <a class="d-block h5 mb-2" href="">2024.01.26 - 2024.07.27</a>
                                </div>
                                <div class="d-flex border-top">
                                    <small class="flex-fill text-center border-end py-2">30명</small>
                                    <small class="flex-fill text-center border-end py-2">401강의장</small>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="property-item rounded overflow-hidden">
                                <div class="position-relative overflow-hidden">
                                    <a href=""><img class="img-fluid" src="img/java1.png" alt=""></a>
                                    <div class="bg-primary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">모집예정</div>
                                    <div class="bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3">강남점</div>
                                </div>
                                <div class="p-4 pb-0">
                                    <h5 class="text-primary mb-3">자바 기초</h5>
                                    <a class="d-block h5 mb-2" href="">2024.05.02 - 2024.11.02</a>
                                </div>
                                <div class="d-flex border-top">
                                    <small class="flex-fill text-center border-end py-2">30명</small>
                                    <small class="flex-fill text-center border-end py-2">301강의장</small>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="property-item rounded overflow-hidden">
                                <div class="position-relative overflow-hidden">
                                    <a href=""><img class="img-fluid" src="img/java1.png" alt=""></a>
                                    <div class="bg-primary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">모집예정</div>
                                    <div class="bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3">신촌점</div>
                                </div>
                                <div class="p-4 pb-0">
                                    <h5 class="text-primary mb-3">오라클 DB</h5>
                                    <a class="d-block h5 mb-2" href="">2024.03.11 - 2024.06.21</a>
                                </div>
                                <div class="d-flex border-top">
                                    <small class="flex-fill text-center border-end py-2">20명</small>
                                    <small class="flex-fill text-center border-end py-2">201 강의장</small>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="property-item rounded overflow-hidden">
                                <div class="position-relative overflow-hidden">
                                    <a href=""><img class="img-fluid" src="img/running.png" alt=""></a>
                                    <div class="bg-primary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">모집중</div>
                                    <div class="bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3">인천점</div>
                                </div>
                                <div class="p-4 pb-0">
                                    <h5 class="text-primary mb-3">머신러닝</h5>
                                    <a class="d-block h5 mb-2" href="">2024.01.11 - 2024.06.21</a>
                                </div>
                                <div class="d-flex border-top">
                                    <small class="flex-fill text-center border-end py-2">20명</small>
                                    <small class="flex-fill text-center border-end py-2">404 강의장</small>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="property-item rounded overflow-hidden">
                                <div class="position-relative overflow-hidden">
                                    <a href=""><img class="img-fluid" src="img/c.png" alt=""></a>
                                    <div class="bg-primary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">모집중</div>
                                    <div class="bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3">원주점</div>
                                </div>
                                <div class="p-4 pb-0">
                                    <h5 class="text-primary mb-3">c언어</h5>
                                    <a class="d-block h5 mb-2" href="">2024.03.11 - 2024.06.21</a>
                                </div>
                                <div class="d-flex border-top">
                                    <small class="flex-fill text-center border-end py-2">20명</small>
                                    <small class="flex-fill text-center border-end py-2">201 강의장</small>
                                    
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-12 text-center">
                            <a class="btn btn-primary py-3 px-5" href="">더보기</a>
                        </div>
                    </div>
                </div>
                <div id="tab-3" class="tab-pane fade show p-0">
                    <div class="row g-4">
                        <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="property-item rounded overflow-hidden">
                                <div class="position-relative overflow-hidden">
                                    <a href=""><img class="img-fluid" src="img/java1.png" alt=""></a>
                                    <div class="bg-primary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">마감임박</div>
                                    <div class="bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3">강남점</div>
                                </div>
                                <div class="p-4 pb-0">
                                    <h5 class="text-primary mb-3">자바 기초</h5>
                                    <a class="d-block h5 mb-2" href="">2024.01.02 - 2024.04.02</a>
                                </div>
                                <div class="d-flex border-top">
                                    <small class="flex-fill text-center border-end py-2">30명</small>
                                    <small class="flex-fill text-center border-end py-2">301강의장</small>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="property-item rounded overflow-hidden">
                                <div class="position-relative overflow-hidden">
                                    <a href=""><img class="img-fluid" src="img/bigdata.png" alt=""></a>
                                    <div class="bg-primary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">모집중</div>
                                    <div class="bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3">부산점</div>
                                </div>
                                <div class="p-4 pb-0">
                                    <h5 class="text-primary mb-3">빅데이터 기초</h5>
                                    <a class="d-block h5 mb-2" href="">2024.01.26 - 2024.07.27</a>
                                </div>
                                <div class="d-flex border-top">
                                    <small class="flex-fill text-center border-end py-2">30명</small>
                                    <small class="flex-fill text-center border-end py-2">401강의장</small>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="property-item rounded overflow-hidden">
                                <div class="position-relative overflow-hidden">
                                    <a href=""><img class="img-fluid" src="img/java1.png" alt=""></a>
                                    <div class="bg-primary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">모집예정</div>
                                    <div class="bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3">강남점</div>
                                </div>
                                <div class="p-4 pb-0">
                                    <h5 class="text-primary mb-3">자바 기초</h5>
                                    <a class="d-block h5 mb-2" href="">2024.05.02 - 2024.11.02</a>
                                </div>
                                <div class="d-flex border-top">
                                    <small class="flex-fill text-center border-end py-2">30명</small>
                                    <small class="flex-fill text-center border-end py-2">301강의장</small>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="property-item rounded overflow-hidden">
                                <div class="position-relative overflow-hidden">
                                    <a href=""><img class="img-fluid" src="img/java1.png" alt=""></a>
                                    <div class="bg-primary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">모집예정</div>
                                    <div class="bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3">신촌점</div>
                                </div>
                                <div class="p-4 pb-0">
                                    <h5 class="text-primary mb-3">오라클 DB</h5>
                                    <a class="d-block h5 mb-2" href="">2024.03.11 - 2024.06.21</a>
                                </div>
                                <div class="d-flex border-top">
                                    <small class="flex-fill text-center border-end py-2">20명</small>
                                    <small class="flex-fill text-center border-end py-2">201 강의장</small>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="property-item rounded overflow-hidden">
                                <div class="position-relative overflow-hidden">
                                    <a href=""><img class="img-fluid" src="img/running.png" alt=""></a>
                                    <div class="bg-primary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">모집중</div>
                                    <div class="bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3">인천점</div>
                                </div>
                                <div class="p-4 pb-0">
                                    <h5 class="text-primary mb-3">머신러닝</h5>
                                    <a class="d-block h5 mb-2" href="">2024.01.11 - 2024.06.21</a>
                                </div>
                                <div class="d-flex border-top">
                                    <small class="flex-fill text-center border-end py-2">20명</small>
                                    <small class="flex-fill text-center border-end py-2">404 강의장</small>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="property-item rounded overflow-hidden">
                                <div class="position-relative overflow-hidden">
                                    <a href=""><img class="img-fluid" src="img/c.png" alt=""></a>
                                    <div class="bg-primary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">모집중</div>
                                    <div class="bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3">원주점</div>
                                </div>
                                <div class="p-4 pb-0">
                                    <h5 class="text-primary mb-3">c언어</h5>
                                    <a class="d-block h5 mb-2" href="">2024.03.11 - 2024.06.21</a>
                                </div>
                                <div class="d-flex border-top">
                                    <small class="flex-fill text-center border-end py-2">20명</small>
                                    <small class="flex-fill text-center border-end py-2">201 강의장</small>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-12 text-center">
                            <a class="btn btn-primary py-3 px-5" href="">더보기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Property List End -->

    <!-- Team Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                <h1 class="mb-3">강사 소개</h1>
            </div>
            <div class="row g-4">
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="team-item rounded overflow-hidden">
                        <div class="position-relative">
                            <img class="img-fluid" src="img/team-1.jpg" alt="">
                            <div class="position-absolute start-50 top-100 translate-middle d-flex align-items-center">
                                <a class="btn btn-square mx-1" href=""><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-square mx-1" href=""><i class="fab fa-twitter"></i></a>
                                <a class="btn btn-square mx-1" href=""><i class="fab fa-instagram"></i></a>
                            </div>
                        </div>
                        <div class="text-center p-4 mt-3">
                            <h5 class="fw-bold mb-0">김자바</h5>
                            <small>자바 강사</small>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="team-item rounded overflow-hidden">
                        <div class="position-relative">
                            <img class="img-fluid" src="img/team-2.jpg" alt="">
                            <div class="position-absolute start-50 top-100 translate-middle d-flex align-items-center">
                                <a class="btn btn-square mx-1" href=""><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-square mx-1" href=""><i class="fab fa-twitter"></i></a>
                                <a class="btn btn-square mx-1" href=""><i class="fab fa-instagram"></i></a>
                            </div>
                        </div>
                        <div class="text-center p-4 mt-3">
                            <h5 class="fw-bold mb-0">박철수</h5>
                            <small>웹디자인 강사</small>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="team-item rounded overflow-hidden">
                        <div class="position-relative">
                            <img class="img-fluid" src="img/team-3.jpg" alt="">
                            <div class="position-absolute start-50 top-100 translate-middle d-flex align-items-center">
                                <a class="btn btn-square mx-1" href=""><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-square mx-1" href=""><i class="fab fa-twitter"></i></a>
                                <a class="btn btn-square mx-1" href=""><i class="fab fa-instagram"></i></a>
                            </div>
                        </div>
                        <div class="text-center p-4 mt-3">
                            <h5 class="fw-bold mb-0">최회계</h5>
                            <small>전산회계 강사</small>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.7s">
                    <div class="team-item rounded overflow-hidden">
                        <div class="position-relative">
                            <img class="img-fluid" src="img/team-4.jpg" alt="">
                            <div class="position-absolute start-50 top-100 translate-middle d-flex align-items-center">
                                <a class="btn btn-square mx-1" href=""><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-square mx-1" href=""><i class="fab fa-twitter"></i></a>
                                <a class="btn btn-square mx-1" href=""><i class="fab fa-instagram"></i></a>
                            </div>
                        </div>
                        <div class="text-center p-4 mt-3">
                            <h5 class="fw-bold mb-0">정언어</h5>
                            <small>C언어 강사</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Team End -->


    <!-- Testimonial Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                <h1 class="mb-3">수강생 후기</h1>
            </div>
            <div class="owl-carousel testimonial-carousel wow fadeInUp" data-wow-delay="0.1s">
                <div class="testimonial-item bg-light rounded p-3">
                    <div class="bg-white border rounded p-4">
                        <p>강남점 최고</p>
                        <div class="d-flex align-items-center">
                            <img class="img-fluid flex-shrink-0 rounded" src="img/testimonial-1.jpg" style="width: 45px; height: 45px;">
                            <div class="ps-3">
                                <h6 class="fw-bold mb-1">이학생</h6>
                                <small>강남 자바 154기</small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="testimonial-item bg-light rounded p-3">
                    <div class="bg-white border rounded p-4">
                        <p>부산 시설 최고</p>
                        <div class="d-flex align-items-center">
                            <img class="img-fluid flex-shrink-0 rounded" src="img/testimonial-2.jpg" style="width: 45px; height: 45px;">
                            <div class="ps-3">
                                <h6 class="fw-bold mb-1">전학생</h6>
                                <small>부산점</small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="testimonial-item bg-light rounded p-3">
                    <div class="bg-white border rounded p-4">
                        <p>감사합니다</p>
                        <div class="d-flex align-items-center">
                            <img class="img-fluid flex-shrink-0 rounded" src="img/testimonial-3.jpg" style="width: 45px; height: 45px;">
                            <div class="ps-3">
                                <h6 class="fw-bold mb-1">우학생</h6>
                                <small>인천점</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Testimonial End -->


<!-- 본문 끝 -->
<%@ include file="../template/footer_v1.jsp" %>