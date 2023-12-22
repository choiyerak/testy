<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!-- 본문 시작 template.jsp -->  
<div style="height: 100px;"></div>
<!-- 여기서 20px는 필요한 만큼 조절하십시오. -->
<div class="col-md-12 text-center">
    <h1 class="display-4 mb-4">강사소개</h1>
</div>
<div style="height: 100px;"></div>

<div class="container mt-5 mx-5">
    <div class="row">
        <div class="col-md-3">
            <!-- 이미지 영역 --><!--img/${teacher.t_pic} img 폴더에 있을시 아래는 이미지 주소로 불러옴-->
            <img src="${teacher.t_pic}" alt="강사 이미지" class="img-fluid rounded">
        </div>
        <div style="width: 20px;"></div>
        <div class="col-md-8">
            <!-- 강사 정보를 표시하는 폼 시작 -->
            <form>
                <div class="form-group">
                    <label for="teacherName">강사 이름:</label>
                    <input type="text" class="form-control" id="teacherName" value="${teacher.t_name}" disabled>
                </div>
                <div class="form-group">
                    <label for="teacherSubject">담당 과목:</label>
                    <input type="text" class="form-control" id="teacherSubject" value="${teacher.t_levname}" disabled>
                </div>
                <div class="form-group">
                    <label for="teacherDescription">경력 사항:</label>
                    <textarea class="form-control" id="teacherDescription" rows="4" disabled>${teacher.t_career}</textarea>
                </div>
                
                <!-- 원하는 강사 정보를 추가할 수 있습니다. -->

                <br>
                <!-- 뒤로 가기 버튼 -->
                <a href="teacher" class="btn btn-secondary">뒤로 가기</a>
            </form>
            <!-- 강사 정보를 표시하는 폼 끝 -->
        </div>
    </div>
</div>

<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>