<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../template/header_v1.jsp" %>
<!-- jstl 가져오기 -->    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script src="../js/jquery-3.7.1.min.js"></script>
<script src="../js/jquery.cookie.js"></script>


<!-- 본문 시작 userList.jsp -->
<div class="admin-area text-center">
	<h6>관리자 공간</h6>
	<form name="admintb" action="userlist/admin" method="post">
	<input type="hidden" name="tname" id="tname" value="userlist">
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
				<input id="userlist-btn" type="submit" class="btn btn-primary" value="등록">			
			</td>
		</tr>
	</table>
	</form>
</div>

<div class="user-list text-centers">
<h3 class="text-center">유저 목록 </h3>
<form action="userlist">
<table class="table user-table text-center">
	<thead>
		<tr>
			<th>#</th>	
			<th>회원 아이디</th>
			<th>회원 이름</th>	
		</tr>
	</thead>
	<tbody>
		<c:if test="${count == 0 }">
			<tr>
				<td colspan="3">등록된 회원이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${count > 0 }">
			<c:forEach items="${list}" var="dto" varStatus="vs">
			<tr>
				<td class="table-no">${count - (page - 1) * numPerPage - vs.index}</td>
				<td class="table-id"><a href="#">${dto.u_id}</a></td>
				<td class="table-name">${dto.u_name}</td>
			</tr>
			</c:forEach>
		</c:if>
	</tbody>
</table>
<!-- 검색 -->
<div class="admin-userlist-search text-center col-md-12">
	<span>
		<select name="user_col">
			<option value="id_name">전체</option>
			<option value="id">회원아이디</option>
			<option value="name">회원이름</option>
		</select>
	</span>
	<span class="search-box">
		<input type="text" name="user_word">
	</span>
	<span>
		<input class="btn btn-primary" type="submit" value="검색">
	</span>
</div>

<!-- 페이지 리스트  -->
<div class="page-list col-md-12">		
<!-- 글 개수가 0이 아니라면 -->
<c:if test="${count > 0}">
	<!-- 변수 설정 및 값 넣기 -->
	<c:set var="pageCount" value="${totalPage}" /> 	<!-- 전체 페이지 -->
	<c:set var="startPage" value="${startPage}" /> 	<!-- 첫 페이지 -->
	<c:set var="endPage"   value="${endPage}" />   	<!-- 마지막 페이지 -->
	<nav aria-label="Page navigation"> 			   	<!-- 페이지네이션을 감싸는 태그 -->
		<ul class="pagination justify-content-center">						<!-- 순서없는 리스트 -->
			<c:if test="${endPage > pageCount }">	<!-- 마지막 페이지가 전체 페이지보다 큰 경우 -->
				<c:set var="endPage" value="${pageCount+1}"></c:set> <!-- 새로운 마지막 페이지 변수를 설정하고 값을 넣어줌 -->
			</c:if>
			<c:if test="${startPage == 0}">			<!-- 첫 페이지가 0과 같다면 -->
				<li class="page-item">
					<a class="page-link disabled" aria-label="Previous">
						<span aria-hidden="true">&laquo</span>
					</a>
				</li>
			</c:if>
			<c:if test="${startPage > 0}">			<!-- 첫 페이지가 0보다 크다면 -->
				<li class="page-item">
					<a class="page-link" href="./userlist?page=${startPage}" aria-label="Previous">
						<span aria-hidden="true">&laquo</span>
					</a>
				</li>
			</c:if>
			<c:if test="${page == 1}">			<!-- 첫 페이지가 1과 같다면 -->
				<li class="page-item">
					<a class="page-link disabled" aria-label="Previous">
						<span aria-hidden="true">&lsaquo;</span>
					</a>
				</li>
			</c:if>
			<c:if test="${page > 1}">			<!-- 첫 페이지가 1보다 크다면 -->
				<li class="page-item">
					<a class="page-link" href="./userlist?page=${page - 1}" aria-label="Previous">
						<span aria-hidden="true">&lsaquo;</span>
					</a>
				</li>
			</c:if>
			<c:forEach var="i" begin="${startPage + 1}" end="${endPage-1}">
				<c:choose>
					<c:when test="${page == i}">
						<li class="page-item">
							<span class="page-link">${i}</span>
						</li>
					</c:when>
					<c:when test="${page != i}">
						<li class="page-item">
							<a class="page-link" href="./userlist?page=${i}">${i}</a>
						</li>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${page == pageCount}">	<!-- 마지막 페이지보다 전체 페이지가 큰 경우 -->	
				<li class="page-item">
			      <a class="page-link disabled" href="./userlist?page=${page + 1}" aria-label="Next">
			        <span aria-hidden="true">&rsaquo;</span>
			      </a>
			    </li>	
			</c:if>
			<c:if test="${page < pageCount}">	<!-- 마지막 페이지보다 전체 페이지가 큰 경우 -->	
				<li class="page-item">
			      <a class="page-link" href="./userlist?page=${page + 1}" aria-label="Next">
			        <span aria-hidden="true">&rsaquo;</span>
			      </a>
			    </li>	
			</c:if>
			<c:if test="${endPage == pageCount + 1}">	<!-- 마지막 페이지와 전체 페이지 같은 경우 -->	
				<li class="page-item">
			      <a class="page-link disabled" href="./userlist?page=${startPage+ pagePerBlock + 1}" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>	
			</c:if>
			<c:if test="${endPage < pageCount + 1}">	<!-- 마지막 페이지보다 전체 페이지가 큰 경우 -->	
				<li class="page-item">
			      <a class="page-link" href="./userlist?page=${startPage+ pagePerBlock + 1}" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>	
			</c:if>
		</ul>
	</nav>	
</c:if>
</div>
<!-- 페이지 리스트 끝 -->
</form>
<div class="btn-list text-center">
	<a class="btn btn-primary" href="userlist">목록</a>
</div>
</div>


<%@ include file="../template/footer_v1.jsp" %>