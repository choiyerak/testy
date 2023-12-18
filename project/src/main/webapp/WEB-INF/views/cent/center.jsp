<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문 시작 center.jsp -->

<!-- Center List Start -->

<div style="height: 100px;"></div>
<!-- 여기서 20px는 필요한 만큼 조절하십시오. -->
<div class="text-center">
	<h1>센터 소개</h1>
</div>
<div style="height: 100px;"></div>
<br>
<div class="center">
	<div class="col-lg-6 mx-auto wow slideInRight" data-wow-delay="0.1s">
		<ul class="nav nav-pills d-inline-flex justify-content-end mb-5">
			<li class="nav-item me-2"><a
				class="btn btn-outline-primary active" data-bs-toggle="pill"
				href="#GN01">강남센터</a></li>
			<li class="nav-item me-2"><a class="btn btn-outline-primary"
				data-bs-toggle="pill" href="#NW01">노원센터</a></li>
			<li class="nav-item me-2"><a class="btn btn-outline-primary"
				data-bs-toggle="pill" href="#YD01">영등포센터</a></li>
			<li class="nav-item me-2"><a class="btn btn-outline-primary"
				data-bs-toggle="pill" href="#JR01">종로센터</a></li>
			<li class="nav-item me-2"><a class="btn btn-outline-primary"
				data-bs-toggle="pill" href="#BU01">부산센터</a></li>
			<li class="nav-item me-2"><a class="btn btn-outline-primary"
				data-bs-toggle="pill" href="#IC01">인천센터</a></li>
		</ul>
	</div>
</div>
<div class="tab-content">
	<div id="GN01" class="tab-pane fade show p-0 active">
		<div class="row g-4">
			<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
				<div class="property-item rounded overflow-hidden">
					<div class="position-relative overflow-hidden">
						<a href=""><img class="img-fluid" src="img/GN01.jpg" alt=""></a>
						<div
							class="bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3">
							강남점</div>
					</div>
					<div class="p-4 pb-0">
						<h5 class="text-primary mb-3">강남센터</h5>
						<a class="d-block h5 mb-2" href="">2024.01.02 - 2024.04.02</a>
					</div>
					<div class="d-flex border-top">
						<small class="flex-fill text-center border-end py-2">시설
							상세보기</small>

					</div>
				</div>
			</div>
			<div class="col-lg-8 col-md-6 wow fadeInUp" data-wow-delay="0.1s"
				style="padding-left: 100px; padding-right: 100px; text-align: center; display: flex; align-items: center; justify-content: center; height: 250px;">
				<H3>모든학생이 언제든 공부할수있도록 쾌적한 장소, 최신 시설 및 장비로 교육울 진행합니다. 강남역 11번출구
					도보로 3분 거리</H3>
			</div>
		</div>



		<div style="height: 100px;"></div>

		<div class="text-center">
			<h1>시설 소개</h1>
		</div>
		<div style="height: 50px;"></div>
		<div class="text-center"
			style="padding-left: 100px; padding-right: 100px;">
			<h3>최고 사양의 PC와 모니터를 동시에 펴서 공부할수 있도록 넉넉한 책상 사이즈로 구성되어 있는 강의실이
				준비되어 있습니다</h3>
		</div>
		<div style="height: 100px;"></div>
		<!-- The slideshow/carousel: 슬라이드 쇼 -->
		<div id="demo" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-inner">
				<!-- 첫번째 사진 -->
				<div class="carousel-item active">
					<img src="img/GN02.jpg" alt="Los Angeles"
						class="d-block w-50 mx-auto">
				</div>
				<!-- 두번째 사진 -->
				<div class="carousel-item">
					<img src="img/GN03.jpg" alt="Chicago" class="d-block w-50 mx-auto">
				</div>
				<!-- 세번째 사진 -->
				<div class="carousel-item">
					<img src="img/GN04.jpg" alt="Chicago" class="d-block w-50 mx-auto">
				</div>
				<!-- 네번째 사진 -->
				<div class="carousel-item">
					<img src="img/GN05.jpg" alt="Chicago" class="d-block w-50 mx-auto">
				</div>
				<!-- 다섯번째 사진 -->
				<div class="carousel-item">
					<img src="img/GN06.jpg" alt="Chicago" class="d-block w-50 mx-auto">
				</div>

			</div>

			<!-- 슬라이드 쇼 좌우 이동 -->
			<!-- Left and right controls/icons -->
			<button class="carousel-control-prev" type="button"
				data-bs-target="#demo" data-bs-slide="prev"
				style="width: 5%; position: absolute; top: 50%; transform: translateY(-50%); background-color: #333; border: none;">
				<span class="carousel-control-prev-icon" aria-hidden="true"
					style="color: #fff;"></span> <span class="visually-hidden">이전</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#demo" data-bs-slide="next"
				style="width: 5%; position: absolute; top: 50%; right: 0; transform: translateY(-50%); background-color: #333; border: none;">
				<span class="carousel-control-next-icon" aria-hidden="true"
					style="color: #fff;"></span> <span class="visually-hidden">다음</span>
			</button>
		</div>
	</div>


	<div id="NW01" class="tab-pane fade show p-0">
		<div class="row g-4">
			<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
				<div class="property-item rounded overflow-hidden">
					<div class="position-relative overflow-hidden">
						<a href=""><img class="img-fluid" src="img/NW01.jpg" alt=""></a>
						<div
							class="bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3">
							노원점</div>
					</div>
					<div class="p-4 pb-0">
						<h5 class="text-primary mb-3">노원센터</h5>
						<a class="d-block h5 mb-2" href="">2024.01.02 - 2024.04.02</a>
					</div>
					<div class="d-flex border-top">
						<small class="flex-fill text-center border-end py-2">시설
							상세보기</small>

					</div>
				</div>
			</div>
			<div class="col-lg-8 col-md-6 wow fadeInUp" data-wow-delay="0.1s"
				style="padding-left: 100px; padding-right: 100px; text-align: center; display: flex; align-items: center; justify-content: center; height: 250px;">
				<H3>모든학생이 언제든 공부할수있도록 쾌적한 장소, 최신 시설 및 장비로 교육울 진행합니다. 강남역 11번출구
					도보로 3분 거리</H3>
			</div>
		</div>



		<div style="height: 100px;"></div>

		<div class="text-center">
			<h1>시설 소개</h1>
		</div>
		<div style="height: 50px;"></div>
		<div class="text-center"
			style="padding-left: 100px; padding-right: 100px;">
			<h3>최고 사양의 PC와 모니터를 동시에 펴서 공부할수 있도록 넉넉한 책상 사이즈로 구성되어 있는 강의실이
				준비되어 있습니다</h3>
		</div>
		
		
		<div style="height: 100px;"></div>
		<!-- The slideshow/carousel: 슬라이드 쇼 -->
		<!-- div id = "demo 이름 바꿈" -->
		<div id="demo1" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-inner">
				<!-- 첫번째 사진 -->
				<div class="carousel-item active">
					<img src="img/NW02.jpg" alt="Chicago" class="d-block w-50 mx-auto">
				</div>
				<!-- 두번째 사진 -->
				<div class="carousel-item">
					<img src="img/NW03.jpg" alt="Chicago" class="d-block w-50 mx-auto">
				</div>
				<!-- 세번째 사진 -->
				<div class="carousel-item">
					<img src="img/NW04.jpg" alt="Chicago" class="d-block w-50 mx-auto">
				</div>
				<!-- 네번째 사진 -->
				<div class="carousel-item">
					<img src="img/NW05.jpg" alt="Chicago" class="d-block w-50 mx-auto">
				</div>
				<!-- 다섯번째 사진 -->
				<div class="carousel-item">
					<img src="img/NW06.jpg" alt="Chicago" class="d-block w-50 mx-auto">
				</div>

			</div>

			<!-- 슬라이드 쇼 좌우 이동 -->
			<!-- Left and right controls/icons -->
			<!-- 슬라이드 id에 따라 data-bs-target="#demo" 이름 바꿔야 함  -->
			<button class="carousel-control-prev" type="button"
				data-bs-target="#demo1" data-bs-slide="prev"
				style="width: 5%; position: absolute; top: 50%; transform: translateY(-50%); background-color: #333; border: none;">
				<span class="carousel-control-prev-icon" aria-hidden="true"
					style="color: #fff;"></span> <span class="visually-hidden">이전</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#demo1" data-bs-slide="next"
				style="width: 5%; position: absolute; top: 50%; right: 0; transform: translateY(-50%); background-color: #333; border: none;">
				<span class="carousel-control-next-icon" aria-hidden="true"
					style="color: #fff;"></span> <span class="visually-hidden">다음</span>
			</button>
		</div>
	</div>
	
	<div id="YD01" class="tab-pane fade show p-0">
		<div class="row g-4">
			<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
				<div class="property-item rounded overflow-hidden">
					<div class="position-relative overflow-hidden">
						<a href=""><img class="img-fluid" src="img/YD01.png" alt=""></a>
						<div
							class="bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3">
							영등포점</div>
					</div>
					<div class="p-4 pb-0">
						<h5 class="text-primary mb-3">영등포센터</h5>
						<a class="d-block h5 mb-2" href="">2024.01.02 - 2024.04.02</a>
					</div>
					<div class="d-flex border-top">
						<small class="flex-fill text-center border-end py-2">시설
							상세보기</small>

					</div>
				</div>
			</div>
			<div class="col-lg-8 col-md-6 wow fadeInUp" data-wow-delay="0.1s"
				style="padding-left: 100px; padding-right: 100px; text-align: center; display: flex; align-items: center; justify-content: center; height: 250px;">
				<H3>모든학생이 언제든 공부할수있도록 쾌적한 장소, 최신 시설 및 장비로 교육울 진행합니다. 강남역 11번출구
					도보로 3분 거리</H3>
			</div>
		</div>



		<div style="height: 100px;"></div>

		<div class="text-center">
			<h1>시설 소개</h1>
		</div>
		<div style="height: 50px;"></div>
		<div class="text-center"
			style="padding-left: 100px; padding-right: 100px;">
			<h3>최고 사양의 PC와 모니터를 동시에 펴서 공부할수 있도록 넉넉한 책상 사이즈로 구성되어 있는 강의실이
				준비되어 있습니다</h3>
		</div>
		
		
		<div style="height: 100px;"></div>
		<!-- The slideshow/carousel: 슬라이드 쇼 -->
		<!-- div id = "demo 이름 바꿈" -->
		<div id="demo2" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-inner">
				<!-- 첫번째 사진 -->
				<div class="carousel-item active">
					<img src="img/YD02.png" alt="Chicago" class="d-block w-50 mx-auto">
				</div>
				<!-- 두번째 사진 -->
				<div class="carousel-item">
					<img src="img/YD03.png" alt="Chicago" class="d-block w-50 mx-auto">
				</div>
				<!-- 세번째 사진 -->
				<div class="carousel-item">
					<img src="img/YD04.png" alt="Chicago" class="d-block w-50 mx-auto">
				</div>
				<!-- 네번째 사진 -->
				<div class="carousel-item">
					<img src="img/YD05.png" alt="Chicago" class="d-block w-50 mx-auto">
				</div>				

			</div>

			<!-- 슬라이드 쇼 좌우 이동 -->
			<!-- Left and right controls/icons -->
			<!-- 슬라이드 id에 따라 data-bs-target="#demo" 이름 바꿔야 함  -->
			<button class="carousel-control-prev" type="button"
				data-bs-target="#demo2" data-bs-slide="prev"
				style="width: 5%; position: absolute; top: 50%; transform: translateY(-50%); background-color: #333; border: none;">
				<span class="carousel-control-prev-icon" aria-hidden="true"
					style="color: #fff;"></span> <span class="visually-hidden">이전</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#demo2" data-bs-slide="next"
				style="width: 5%; position: absolute; top: 50%; right: 0; transform: translateY(-50%); background-color: #333; border: none;">
				<span class="carousel-control-next-icon" aria-hidden="true"
					style="color: #fff;"></span> <span class="visually-hidden">다음</span>
			</button>
		</div>
	</div>
	
	
	<div id="JR01" class="tab-pane fade show p-0">
		<div class="row g-4">
			<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
				<div class="property-item rounded overflow-hidden">
					<div class="position-relative overflow-hidden">
						<a href=""><img class="img-fluid" src="img/JR01.png" alt=""></a>
						<div
							class="bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3">
							종로점</div>
					</div>
					<div class="p-4 pb-0">
						<h5 class="text-primary mb-3">종로센터</h5>
						<a class="d-block h5 mb-2" href="">2024.01.02 - 2024.04.02</a>
					</div>
					<div class="d-flex border-top">
						<small class="flex-fill text-center border-end py-2">시설
							상세보기</small>

					</div>
				</div>
			</div>
			<div class="col-lg-8 col-md-6 wow fadeInUp" data-wow-delay="0.1s"
				style="padding-left: 100px; padding-right: 100px; text-align: center; display: flex; align-items: center; justify-content: center; height: 250px;">
				<H3>모든학생이 언제든 공부할수있도록 쾌적한 장소, 최신 시설 및 장비로 교육울 진행합니다. 강남역 11번출구
					도보로 3분 거리</H3>
			</div>
		</div>



		<div style="height: 100px;"></div>

		<div class="text-center">
			<h1>시설 소개</h1>
		</div>
		<div style="height: 50px;"></div>
		<div class="text-center"
			style="padding-left: 100px; padding-right: 100px;">
			<h3>최고 사양의 PC와 모니터를 동시에 펴서 공부할수 있도록 넉넉한 책상 사이즈로 구성되어 있는 강의실이
				준비되어 있습니다</h3>
		</div>
		
		
		<div style="height: 100px;"></div>
		<!-- The slideshow/carousel: 슬라이드 쇼 -->
		<!-- div id = "demo 이름 바꿈" -->
		<div id="demo3" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-inner">
				<!-- 첫번째 사진 -->
				<div class="carousel-item active">
					<img src="img/JR02.png" alt="Chicago" class="d-block w-50 mx-auto">
				</div>
				<!-- 두번째 사진 -->
				<div class="carousel-item">
					<img src="img/JR03.png" alt="Chicago" class="d-block w-50 mx-auto">
				</div>
				<!-- 세번째 사진 -->
				<div class="carousel-item">
					<img src="img/JR04.png" alt="Chicago" class="d-block w-50 mx-auto">
				</div>
				<!-- 네번째 사진 -->
				<div class="carousel-item">
					<img src="img/JR05.png" alt="Chicago" class="d-block w-50 mx-auto">
				</div>				

			</div>

			<!-- 슬라이드 쇼 좌우 이동 -->
			<!-- Left and right controls/icons -->
			<!-- 슬라이드 id에 따라 data-bs-target="#demo" 이름 바꿔야 함  -->
			<button class="carousel-control-prev" type="button"
				data-bs-target="#demo3" data-bs-slide="prev"
				style="width: 5%; position: absolute; top: 50%; transform: translateY(-50%); background-color: #333; border: none;">
				<span class="carousel-control-prev-icon" aria-hidden="true"
					style="color: #fff;"></span> <span class="visually-hidden">이전</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#demo3" data-bs-slide="next"
				style="width: 5%; position: absolute; top: 50%; right: 0; transform: translateY(-50%); background-color: #333; border: none;">
				<span class="carousel-control-next-icon" aria-hidden="true"
					style="color: #fff;"></span> <span class="visually-hidden">다음</span>
			</button>
		</div>
	</div>
	
	
	<div id="BU01" class="tab-pane fade show p-0">
		<div class="row g-4">
			<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
				<div class="property-item rounded overflow-hidden">
					<div class="position-relative overflow-hidden">
						<a href=""><img class="img-fluid" src="img/BU01.jpg" alt=""></a>
						<div
							class="bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3">
							부산점</div>
					</div>
					<div class="p-4 pb-0">
						<h5 class="text-primary mb-3">부산센터</h5>
						<a class="d-block h5 mb-2" href="">2024.01.02 - 2024.04.02</a>
					</div>
					<div class="d-flex border-top">
						<small class="flex-fill text-center border-end py-2">시설
							상세보기</small>

					</div>
				</div>
			</div>
			<div class="col-lg-8 col-md-6 wow fadeInUp" data-wow-delay="0.1s"
				style="padding-left: 100px; padding-right: 100px; text-align: center; display: flex; align-items: center; justify-content: center; height: 250px;">
				<H3>모든학생이 언제든 공부할수있도록 쾌적한 장소, 최신 시설 및 장비로 교육울 진행합니다. 강남역 11번출구
					도보로 3분 거리</H3>
			</div>
		</div>



		<div style="height: 100px;"></div>

		<div class="text-center">
			<h1>시설 소개</h1>
		</div>
		<div style="height: 50px;"></div>
		<div class="text-center"
			style="padding-left: 100px; padding-right: 100px;">
			<h3>최고 사양의 PC와 모니터를 동시에 펴서 공부할수 있도록 넉넉한 책상 사이즈로 구성되어 있는 강의실이
				준비되어 있습니다</h3>
		</div>
		
		
		<div style="height: 100px;"></div>
		<!-- The slideshow/carousel: 슬라이드 쇼 -->
		<!-- div id = "demo 이름 바꿈" -->
		<div id="demo4" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-inner">
				<!-- 첫번째 사진 -->
				<div class="carousel-item active">
					<img src="img/BU02.jpg" alt="Chicago" class="d-block w-50 mx-auto">
				</div>
				<!-- 두번째 사진 -->
				<div class="carousel-item">
					<img src="img/BU03.jpg" alt="Chicago" class="d-block w-50 mx-auto">
				</div>
				<!-- 세번째 사진 -->
				<div class="carousel-item">
					<img src="img/BU04.jpg" alt="Chicago" class="d-block w-50 mx-auto">
				</div>
				<!-- 네번째 사진 -->
				<div class="carousel-item">
					<img src="img/BU05.jpg" alt="Chicago" class="d-block w-50 mx-auto">
				</div>				

			</div>

			<!-- 슬라이드 쇼 좌우 이동 -->
			<!-- Left and right controls/icons -->
			<!-- 슬라이드 id에 따라 data-bs-target="#demo" 이름 바꿔야 함  -->
			<button class="carousel-control-prev" type="button"
				data-bs-target="#demo4" data-bs-slide="prev"
				style="width: 5%; position: absolute; top: 50%; transform: translateY(-50%); background-color: #333; border: none;">
				<span class="carousel-control-prev-icon" aria-hidden="true"
					style="color: #fff;"></span> <span class="visually-hidden">이전</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#demo4" data-bs-slide="next"
				style="width: 5%; position: absolute; top: 50%; right: 0; transform: translateY(-50%); background-color: #333; border: none;">
				<span class="carousel-control-next-icon" aria-hidden="true"
					style="color: #fff;"></span> <span class="visually-hidden">다음</span>
			</button>
		</div>
	</div>
	
	
	<div id="IC01" class="tab-pane fade show p-0">
		<div class="row g-4">
			<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
				<div class="property-item rounded overflow-hidden">
					<div class="position-relative overflow-hidden">
						<a href=""><img class="img-fluid" src="img/IC01.png" alt=""></a>
						<div
							class="bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3">
							인천점</div>
					</div>
					<div class="p-4 pb-0">
						<h5 class="text-primary mb-3">인천센터</h5>
						<a class="d-block h5 mb-2" href="">2024.01.02 - 2024.04.02</a>
					</div>
					<div class="d-flex border-top">
						<small class="flex-fill text-center border-end py-2">시설
							상세보기</small>

					</div>
				</div>
			</div>
			<div class="col-lg-8 col-md-6 wow fadeInUp" data-wow-delay="0.1s"
				style="padding-left: 100px; padding-right: 100px; text-align: center; display: flex; align-items: center; justify-content: center; height: 250px;">
				<H3>모든학생이 언제든 공부할수있도록 쾌적한 장소, 최신 시설 및 장비로 교육울 진행합니다. 강남역 11번출구
					도보로 3분 거리</H3>
			</div>
		</div>



		<div style="height: 100px;"></div>

		<div class="text-center">
			<h1>시설 소개</h1>
		</div>
		<div style="height: 50px;"></div>
		<div class="text-center"
			style="padding-left: 100px; padding-right: 100px;">
			<h3>최고 사양의 PC와 모니터를 동시에 펴서 공부할수 있도록 넉넉한 책상 사이즈로 구성되어 있는 강의실이
				준비되어 있습니다</h3>
		</div>
		
		
		<div style="height: 100px;"></div>
		<!-- The slideshow/carousel: 슬라이드 쇼 -->
		<!-- div id = "demo 이름 바꿈" -->
		<div id="demo5" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-inner">
				<!-- 첫번째 사진 -->
				<div class="carousel-item active">
					<img src="img/IC02.png" alt="Chicago" class="d-block w-50 mx-auto">
				</div>
				<!-- 두번째 사진 -->
				<div class="carousel-item">
					<img src="img/IC03.png" alt="Chicago" class="d-block w-50 mx-auto">
				</div>
				<!-- 세번째 사진 -->
				<div class="carousel-item">
					<img src="img/IC04.png" alt="Chicago" class="d-block w-50 mx-auto">
				</div>
				<!-- 네번째 사진 -->
				<div class="carousel-item">
					<img src="img/IC05.png" alt="Chicago" class="d-block w-50 mx-auto">
				</div>				

			</div>

			<!-- 슬라이드 쇼 좌우 이동 -->
			<!-- Left and right controls/icons -->
			<!-- 슬라이드 id에 따라 data-bs-target="#demo" 이름 바꿔야 함  -->
			<button class="carousel-control-prev" type="button"
				data-bs-target="#demo5" data-bs-slide="prev"
				style="width: 5%; position: absolute; top: 50%; transform: translateY(-50%); background-color: #333; border: none;">
				<span class="carousel-control-prev-icon" aria-hidden="true"
					style="color: #fff;"></span> <span class="visually-hidden">이전</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#demo5" data-bs-slide="next"
				style="width: 5%; position: absolute; top: 50%; right: 0; transform: translateY(-50%); background-color: #333; border: none;">
				<span class="carousel-control-next-icon" aria-hidden="true"
					style="color: #fff;"></span> <span class="visually-hidden">다음</span>
			</button>
		</div>
	</div>
	
	
</div>


<!-- 본문 끝 -->
<%@ include file="../footer.jsp"%>