<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./header.jsp" %>
<!-- 본문 시작 template.jsp -->  

	<div style="height: 100px;"></div> <!-- 여기서 20px는 필요한 만큼 조절하십시오. -->

	<div class="text-center">
    <h2>수강 시청 페이지</h2>
    <div style="height: 100px;"></div> <!-- 여기서 20px는 필요한 만큼 조절하십시오. -->
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
    </div>
    <!-- 검색 끝 -->


<div class="text-center">
	<div class="container mt-5">
		<h3>수강 리스트</h3>
		<table class="table">
			<thead>
				<tr>
					<th scope="col"></th>
					<th scope="col">NO</th>
					<th scope="col">강좌명</th>
					<th scope="col">강사명</th>
					<th scope="col">수업기간</th>
					<th scope="col">수업일정</th>
					<th scope="col">수업시간</th>
					<th scope="col">수강인원</th>
					<th scope="col">모집현황</th>
				</tr>
			</thead>
			<tbody>
				<!-- 여기에 수강 리스트 데이터를 동적으로 생성하는 코드를 추가 -->
				<tr>
					<td><input type="checkbox"></td>
					<td>1</td>
					<td>웹개발 입문</td>
					<td>김자바</td>
					<td>2024.01.04~2024.06.06</td>
					<td>월~금</td>
					<td>09:00 - 18:00</td>
					<td>10/30</td>
					<td>모집중</td>
				</tr>
				<tr>
					<td><input type="checkbox"></td>
					<td>1</td>
					<td>웹개발 입문</td>
					<td>김자바</td>
					<td>2024.01.04~2024.06.06</td>
					<td>월~금</td>
					<td>09:00 - 18:00</td>
					<td>10/30</td>
					<td>모집중</td>
				</tr>
				<tr>
					<td><input type="checkbox"></td>
					<td>1</td>
					<td>웹개발 입문</td>
					<td>김자바</td>
					<td>2024.01.04~2024.06.06</td>
					<td>월~금</td>
					<td>09:00 - 18:00</td>
					<td>10/30</td>
					<td>모집중</td>
				</tr>
				<tr>
					<td><input type="checkbox"></td>
					<td>1</td>
					<td>웹개발 입문</td>
					<td>김자바</td>
					<td>2024.01.04~2024.06.06</td>
					<td>월~금</td>
					<td>09:00 - 18:00</td>
					<td>10/30</td>
					<td>모집중</td>
				</tr>
				<tr>
					<td><input type="checkbox"></td>
					<td>1</td>
					<td>웹개발 입문</td>
					<td>김자바</td>
					<td>2024.01.04~2024.06.06</td>
					<td>월~금</td>
					<td>09:00 - 18:00</td>
					<td>10/30</td>
					<td>모집중</td>
				</tr>
				<tr>
					<td><input type="checkbox"></td>
					<td>1</td>
					<td>웹개발 입문</td>
					<td>김자바</td>
					<td>2024.01.04~2024.06.06</td>
					<td>월~금</td>
					<td>09:00 - 18:00</td>
					<td>10/30</td>
					<td>모집중</td>
				</tr>
				<tr>
					<td><input type="checkbox"></td>
					<td>1</td>
					<td>웹개발 입문</td>
					<td>김자바</td>
					<td>2024.01.04~2024.06.06</td>
					<td>월~금</td>
					<td>09:00 - 18:00</td>
					<td>10/30</td>
					<td>모집중</td>
				</tr>
				<!-- 추가적인 수강 리스트 항목들을 추가할 수 있습니다. -->
			</tbody>
		</table>
	</div>
</div>

<br>
<button class="bu float-end">수강신청 하기</button>


  

<!-- 본문 끝 -->
<%@ include file="./footer.jsp" %>