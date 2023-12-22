<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
    
        <!-- 강사 소개 페이지 -->
        <div style="height: 100px;"></div>
        <!-- 여기서 20px는 필요한 만큼 조절하십시오. -->
        <div class="text-center">
            <h1>강사소개</h1>
        </div>
        <div style="height: 100px;"></div>
        <br>
        <div class="center">
            <div class="col-lg-6 mx-auto wow slideInRight" data-wow-delay="0.1s" id="centers">
                <ul class="nav nav-pills d-inline-flex justify-content-end mb-5">
                    <li class="nav-item me-2" data-value="0"><a class="btn btn-outline-primary active" data-bs-toggle="pill"
                            href="#GN01" >강남센터</a></li>
                    <li class="nav-item me-2" data-value="1"><a class="btn btn-outline-primary" data-bs-toggle="pill"
                            href="#NW01">노원센터</a></li>
                    <li class="nav-item me-2" data-value="2"><a class="btn btn-outline-primary" data-bs-toggle="pill"
                            href="#YD01">영등포센터</a></li>
                    <li class="nav-item me-2" data-value="3"><a class="btn btn-outline-primary" data-bs-toggle="pill"
                            href="#JR01">종로센터</a></li>
                    <li class="nav-item me-2" data-value="4"><a class="btn btn-outline-primary" data-bs-toggle="pill"
                            href="#BU01">부산센터</a></li>
                    <li class="nav-item me-2" data-value="5"><a class="btn btn-outline-primary" data-bs-toggle="pill"
                            href="#IC01">인천센터</a></li>
                </ul>
            </div>
        </div>
   
        <div id="display" class="rdisplay">
    		<!-- 여기에 강사 목록이 동적으로 추가될 예정입니다. -->
		</div>
        
            
<script>
  $(document).ready(function () {
    $(".nav-item").on("click", function () {
      var selectedValue = $(this).data("value");
      // 서버에 선택한 센터 값 전송
      $.ajax({
        type: "POST",
        url: "teacherss",
        data: { centers: selectedValue },
        success: function (result) {
          // 서버로부터 받은 응답 처리
          responseProc(result);
        },
        error: function (error) {
          console.log("에러: " + error);
        }
      });
    });

    function responseProc(result) {
      // 선택된 값에 따라 이미지 변경 등의 로직 수행
      console.log("선택된 값: " + result);
      // 서버로부터 받은 결과를 사용하여 다시 AJAX 요청
      $.ajax({
        type: "POST",
        url: "teacher",
        data: { centerCode: result },
        success: function (teachers) {
          // 서버로부터 받은 강사 목록 처리
          updateTeacherList(teachers);
        },
        error: function (error) {
          console.log("에러: " + error);
        }
      });
    }

  function updateTeacherList(teachers) {
	  // 각 센터에 대한 id가 센터 코드와 동일한 컨테이너를 가정합니다.
	  var teacherContainer = $("#display"); // 강사 목록을 표시할 컨테이너
	  console.log("선택된 값: " , teachers);


	  try {

	

	    // 강사 목록 추가
	    for (var i = 0; i < teachers.length; i++) {
	      var teacher = teachers[i];

	      var teacherElement = `
	        <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
	          <div class="property-item rounded overflow-hidden">
	            <div class="position-relative overflow-hidden">
	              <a href="teacherproc?t_id=${teacher.t_id}">
	                <img class="img-fluid" src="${teacher.t_pic}" alt="">
	              </a>
	            </div>
	            <div class="p-4 pb-0 text-center">
	              <h5 class="text-primary mb-3">${teacher.u_level}</h5>
	              <a class="d-block h5 mb-2" href="">${teacher.t_name}</a>
	            </div>
	          </div>
	        </div>
	      `;

	      teacherContainer.append(teacherElement);
	    }
	    

	    // "더보기" 버튼 추가 (필요에 따라 추가)
	    var moreButtonElement = `
	      <div class="col-12 text-center wow fadeInUp" data-wow-delay="0.1s">
	        <a class="btn btn-primary py-3 px-5" href="">더보기</a>
	      </div>
	    `;
	    teacherContainer.append(moreButtonElement);
	  } catch (e) {
	    console.error("데이터 파싱 오류: ", e);
	    console.log("받은 데이터: ", teachersResult); // 오류가 발생한 경우 받은 데이터를 확인
	  }
  }
	});
</script>
                    
                    
            

        <!-- 본문 끝 -->
        <%@ include file="../footer.jsp" %>