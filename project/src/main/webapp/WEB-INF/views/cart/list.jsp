<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../template/header_v1.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- 본문 시작 cart/list.jsp -->
<!-- 관리자 공간 시작  -->
<div class="admin-area text-center">
	<h6>관리자 공간</h6>
	<form name="admintb" action="userlist/admin" method="post">
	<input type="hidden" name="tname" id="tname" value="cartlist">
	<table class="table">
		<tr>
			<th>게시물 개수</th>
			<td>
				<input type="number" name="numPerPage" id="numPerPage" min="1" value="${numPerPage}">
			</td>
			<th>페이지 개수</th>
			<td>
				<input type="number" name="pagePerBlock" id="pagePerBlock" min="1" value="${pagePerBlock}">
			</td>
		</tr>
		<tr>
			<td colspan="4">
				<input id="cartlist-btn" type="submit" class="btn btn-primary" value="등록">			
			</td>
		</tr>
	</table>
	</form>
</div>
<!-- 관리자 공간 끝  -->
<!-- 본문 시작 -->
<div class="container text-center">
	<!-- 본문 헤더 시작 -->
	<div class="text-center">
		<p><h3>장바구니</h3></p>
	</div>
	<!-- 본문 헤더 끝 -->
	<!-- 본문 컨텐츠 시작 -->
	<div class="content text-center">
	<form action="/pay/home">
		<!-- 목록 시작 -->
		<table class="table">
			<thead>
				<tr>
					<th><input type="checkbox"></th>
					<th>#</th>
					<th>강좌</th>
					<th>강사</th>
					<th>강의 일정</th>
					<th>강의 시간</th>
					<th>수강료</th>
					<th>모집현황</th>
					<th>장바구니 담은날</th>					
				</tr>
			</thead>
			<tbody>
				<c:if test="${count == 0 }">
					<tr>
						<td colspan="0">장바구니에 등록된 강의가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${count > 0 }">
					<c:forEach items="${list}" var="dto" varStatus="vs">
						<tr>
							<td><input type="checkbox" name="sin_code" value="${dto.sin_code}"></td>
							<td>${vs.count }</td>
							<td><a href="#">${dto.su_name}</a></td>
							<td>${dto.u_id}</td>
							<td>${dto.su_date_start}-${dto.su_date_end}</td>
							<td>${dto.su_time_start}-${dto.su_time_end}</td>
							<td>${dto.su_mo_status}</td>
							<td>${dto.sin_regdate}</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<!-- 목록 끝 -->
		<!-- 페이지 리스트 시작  -->
		<div class="page-list col-md-12">
		<script src="../js/page.js"></script>
		<script>
	 		// 함수 호출 결과를 변수에 저장
	   		let paginationHtml = paging(${startPage}, ${endPage}, ${page}, ${totalPage}, ${pagePerBlock}, "list");
	
	   		// 변수 삽입  
	   		document.querySelector(".page-list").innerHTML = paginationHtml;
		</script>		
		</div>
		<!-- 페이지 리스트 끝  -->
		<!-- 결제 버튼 -->
		<!-- 본문 footer 시작 -->
		<div class="btn-list text-center">
			<input type="submit" class="btn btn-primary" value="결제하기">  
		</div>
		<!-- 본문 footer 끝 -->
	</form>
	</div>
	<!-- 본문 컨텐츠 끝 -->
	
</div>
<!-- 본문 끝 -->
<%@ include file="../template/footer_v1.jsp" %>
