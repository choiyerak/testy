<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../template/header_v1.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- 본문 시작 pay/home.jsp -->
<div class="container text-center">
	<!-- 본문 헤더 시작 -->
	<div class="text-center">
		<p><h3>주문/결제</h3></p>
	</div>
	<!-- 본문 헤더 끝 -->
	<!-- 본문 컨텐츠 시작 -->
	<div class="content text-center">
		<form action="">
		<div class="accordion" id="accordionExample">
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="headingOne">
		      <button class="accordion-button  collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#destiny" aria-expanded="false" aria-controls="destiny">
		        배송지
		      </button>
		    </h2>
		    <div id="destiny" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
		      <div class="accordion-body">
		        <strong>배송지 상세 적어라</strong> 
		        여기는 먼가 적음됨
		      </div>
		    </div>
		  </div>
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="headingTwo">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#customer" aria-expanded="false" aria-controls="customer">
		        주문자
		      </button>
		    </h2>
		    <div id="customer" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
		      <div class="accordion-body">
		        <strong>주문자 상세 적어라</strong> 
		        여기는 먼가 적음됨
		      </div>
		    </div>
		  </div>
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="headingThree">
		      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#order" aria-expanded="true" aria-controls="order">
		        <strong>주문 강의</strong>
		      </button>
		    </h2>
		    <div id="order" class="accordion-collapse collapse show" aria-labelledby="headingThree" data-bs-parent="#accordionExample" >
		      <div class="accordion-body text-start">
		      	<ul class="orderlist">
		      		<li>
		      			<table class="table">
		      			<c:if test="${count == 0}">
		      				<tr>
		      					<td colspan="2">주문한 강의가 없습니다.</td>
		      				</tr>
		      			</c:if>
		      			<c:if test="${count > 0}">
		      				<c:forEach items="${list}" var="dto" varStatus="vs">
		      					<tr>
			      					<td rowspan="3" class="order-img-wrap">
			      						<img alt="photo" src="../img/team-1.jpg" class="order-img img-fluid img-thumbnail">
			      					</td>
			      					<td>수강 신청 번호: ${dto.sin_code}</td>
			      				</tr>
			      				<tr>
				      				<td>지불 방법: ${dto.p_method}</td>
			      				</tr>
			      				<tr>
			      					<td>총 가격: ${dto.p_total}</td>
			      				</tr>
		      				</c:forEach>
		      			</c:if>
		      			</table>
		      		</li>
		      	</ul>
		      </div>
		    </div>
		  </div>
		</div>
		
		</form>
	</div>
	<!-- 본문 컨텐츠 끝 -->
</div>
<!-- 본문 끝 -->
<%@ include file="../template/footer_v1.jsp" %>