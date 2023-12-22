<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../template/header.jsp" %>
<!-- 본문 시작 login.jsp -->
	<div id="login" class="lg-8">
		<form action="">
			<table class="table table-borderless">
				<tr>
					<th class="login-text">아이디</th>
					<td>
						<input class="login-textbox" type="text" placeholder="">
					</td>
				</tr>
				<tr>
					<th class="login-text">비밀번호</th>
					<td>
						<input class="login-textbox" type="password" placeholder="">
					</td>
				</tr>
			</table>
		</form>
		<a href="join" class="btn btn-primary">회원가입</a>
		<a href="/oauth/google" class="btn btn-primary">구글</a>
	</div>
<!-- 본문 끝 -->
<%@ include file="../template/footer.jsp" %>