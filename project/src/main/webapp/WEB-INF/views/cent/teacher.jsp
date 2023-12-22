<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>




<!-- 강사 소개 페이지 -->
<div style="height: 100px;"></div>
<!-- 여기서 20px는 필요한 만큼 조절하십시오. -->
<div class="text-center">
	<h1>강사소개</h1>
</div>
<div style="height: 100px;"></div>
<br>
<div class="center">
	<div class="col-lg-6 mx-auto wow slideInRight" data-wow-delay="0.1s"
		id="centers">
		<ul class="nav nav-pills d-inline-flex justify-content-end mb-5">
			<li class="nav-item me-2" data-value="GN01"><a
				class="btn btn-outline-primary active" data-bs-toggle="pill"
				href="#GN01" onclick="loadTeachers('GN01')">강남센터</a></li>
			<li class="nav-item me-2" data-value="NW01"><a
				class="btn btn-outline-primary" data-bs-toggle="pill" href="#NW01"
				onclick="loadTeachers('NW01')">노원센터</a></li>
			<li class="nav-item me-2" data-value="YD01"><a
				class="btn btn-outline-primary" data-bs-toggle="pill" href="#YD01"
				onclick="loadTeachers('YD01')">영등포센터</a></li>
			<li class="nav-item me-2" data-value="JR01"><a
				class="btn btn-outline-primary" data-bs-toggle="pill" href="#JR01"
				onclick="loadTeachers('JR01')">종로센터</a></li>
			<li class="nav-item me-2" data-value="BU01"><a
				class="btn btn-outline-primary" data-bs-toggle="pill" href="#BU01"
				onclick="loadTeachers('BU01')">부산센터</a></li>
			<li class="nav-item me-2" data-value="IC01"><a
				class="btn btn-outline-primary" data-bs-toggle="pill" href="#IC01"
				onclick="loadTeachers('IC01')">인천센터</a></li>
		</ul>
	</div>
</div>


<!-- 강사 목록 출력 -->
<div class="tab-content">
    <div id="teacherList" class="row g-4">
        <!-- 강사 목록이 여기에 추가됩니다. -->
    </div>
</div>

<!-- Ajax 요청 부분 -->
<script>
    $(document).ready(function() {
        // 초기 페이지 로딩 시 강남센터의 강사 목록을 불러옴
        loadTeachers('GN01');
    });

    function loadTeachers(centerCode) {
        // Ajax 요청
        $.ajax({
            type: 'POST',  // POST 방식으로 요청
            url: '/teacher',  // 실제 서버 엔드포인트로 교체
            data: { centerCode: centerCode },  // centerCode를 파라미터로 전달
            success: function(data) {
                //alert(data);
                //console.log(data);
                let a = ''; // 출력할 결과값
                $.each(data, function(key, value) {
                    a += '<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">';
                    a += '    <div class="property-item rounded overflow-hidden">';
                    a += '        <div class="position-relative overflow-hidden">';
                    a += '            <a href="teacherproc?t_id=' + value.t_id + '"><img class="img-fluid" src="' + value.t_pic + '" alt=""></a>';
                    a += '        </div>';
                    a += '        <div class="p-4 pb-0 text-center">';
                    a += '            <h5 class="text-primary mb-3">' + value.t_levname + '</h5>';
                    a += '            <a class="d-block h5 mb-2" href="">' + value.t_name + '</a>';
                    a += '        </div>';
                    a += '    </div>';
                    a += '</div>';
                });
                $("#teacherList").html(a);
            }
        });
    }
</script>

<!-- 본문 끝 -->
<%@ include file="../footer.jsp"%>