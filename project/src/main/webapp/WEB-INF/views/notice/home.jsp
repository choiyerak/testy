<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../template/header_v1.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- 본문 시작 notice/home.jsp -->
<div class="admin-area text-center">
	<h6>관리자 공간</h6>
	<form name="admintb" action="home/admin" method="post">
		<input type="hidden" name="tname" id="tname" value="noticelist">
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
					<input id="noticelist-btn" type="submit" class="btn btn-primary" value="등록">			
				</td>
			</tr>
		</table>
	</form>
</div>
<!-- 본문 -->
<div class="container text-center">
	<!-- 본문 헤더 -->
	<div class="text-center">
	   <p><h2>공지사항</h2></p>
	</div>
	<!-- 본문 컨텐츠 시작 -->
	<div class="content text-center">
	<form action="home">
		<!-- 목록 시작 -->
		<div class="noticelist">
			<table class="table">
				<thead>
					<tr>
						<th>no</th>
					  	<th>제목</th>
					  	<th>작성자</th>
					  	<th>조회수</th>
					  	<th>작성일</th>
					</tr>
				</thead>
				<tbody>
				<c:if test="${count == 0 }">
					<tr>
						<td colspan="5">등록된 글이 없습니다.</td>
					</tr>
				</c:if> 
				<c:if test="${count > 0 }">
				<c:forEach items="${list}" var="dto" varStatus="vs">
					<tr>
						<td>${vs.count}</td>
						<td><a href="#">${dto.n_subject}</a></td>
						<td>관리자</td>
						<td>${dto.n_readcnt}</td>
						<td>${dto.n_date}</td>
					</tr>
				</c:forEach>
				</c:if>
				</tbody>
			</table>
		</div>
		<!-- 목록 끝 -->
		<!-- 검색 시작 -->
		<div class="notice-search row">
	        <div class="col-md-12">
	            <select name="col">
	                <option value="subject_content">제목+내용</option>
	                <option value="subject">제목</option>
	                <option value="content">내용</option>
	                <option value="wname">작성자</option>
	            </select>
	            <input type="text" name="word" id="word">
	            <input type="submit" value="검색" class="btn btn-primary">
	        </div>
    	</div>
		<!-- 검색 끝 -->
		<!-- 페이지 리스트 시작  -->
		<div class="page-list col-md-12">
		<script src="js/page.js"></script>
		<script>
	 		// 함수 호출 결과를 변수에 저장
	   		let paginationHtml = paging(${startPage}, ${endPage}, ${page}, ${totalPage}, ${pagePerBlock}, "home");
	
	   		// 변수 삽입  
	   		document.querySelector(".page-list").innerHTML = paginationHtml;
		</script>		
		</div>
		<!-- 페이지 리스트 끝  -->
	</form>
	</div>
	<!-- 본문 콘텐츠 끝 -->
	<!-- 본문 footer 시작-->
    <div class="btn-list text-center">
  		<a href='home' class="btn btn-primary">목록</a>
  		<a href='write' class="btn btn-primary">글쓰기</a>  
    </div>    
  	<!-- 본문 footer 끝-->
</div>
<!-- 본문 끝 -->
<%@ include file="../template/footer_v1.jsp" %>