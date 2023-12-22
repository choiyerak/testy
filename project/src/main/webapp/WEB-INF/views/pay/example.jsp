<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../template/header_v1.jsp" %>
<!-- 본문 시작 example.jsp -->

<!-- 결제 버튼 -->
<br>
<br>
<div class="text-center">
<a class="btn btn-primary text-center" onclick="proceedPay('java', 100, '주문중', 'angel12')">결제하기</a>
<a class="btn btn-primary text-center" onclick="getToken(123, 100)">환불하기</a>
</div>
<h1 class="dontknow"></h1>

<!-- imaport -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"
 >
</script>
<script src="/js/pay.js"></script>
<script src="/js/refund.js"></script>
<!-- 본문 끝 -->
<%@ include file="../template/footer_v1.jsp" %>