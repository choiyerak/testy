<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./header.jsp" %>
<!-- 본문 시작 template.jsp -->  
	
	<form action="/examples/actions/confirmation.php" method="post">
		<div class="avatar"><i class="material-icons">&#xE7FF;</i></div>
    	<h4 class="modal-title">로그인 :D</h4>
        <div class="form-group">
            <input type="text" class="form-control" placeholder="아이디" required="required">
        </div>
        <div class="form-group">
            <input type="password" class="form-control" placeholder="비밀번호" required="required">
        </div>
        <div class="form-group small clearfix">
            <label class="checkbox-inline"><input type="checkbox"> 아이디 저장 </label>
            <a href="#" class="forgot-link">비밀번호를 잊으셨나요?</a>
        </div> 
        <input type="submit" class="btn btn-primary btn-block btn-lg" value="로그인">              
    </form>			
    <div class="text-center small">계정이 없으신가요? <a href="#">회원가입</a></div>
	
<!-- 본문 끝 -->
<%@ include file="./footer.jsp" %>