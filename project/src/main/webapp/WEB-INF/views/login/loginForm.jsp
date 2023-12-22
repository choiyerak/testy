<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"      prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"       prefix="fmt" %>

<!-- 본문 시작 template.jsp --> 
	<div style="height:50px;"></div>
	<div class="text-center">
	<h3>로그인</h3>
	<form name="loginfrm" id="loginfindfrm" action="/loginProc" onsubmit="return loginCheck()" method="post" style="margin:0 auto; width:300px;">
        <hr>
        <div class="form-group">
            <input type="text" name="u_id" id="u_id" class="form-control" maxlength="20" placeholder="아이디" required>
        </div>
        <br>
        <div class="form-group">
            <input type="password" name="u_pw" id="u_pw" class="form-control" maxlength="20" placeholder="비밀번호" required>
        </div>
        <br>
        <!--
        <c:if test = "${loginSuccess == false}">
            <div class = "login_warn">아이디 또는 비밀번호를 잘못 입력하셨습니다</div>
        </c:if>
        -->
        <div class="form-group small clearfix">
            <label class="checkbox-inline"><input type="checkbox" checked id="c_id"> 아이디 저장 </label>&nbsp&nbsp
            <a href="/findLogin" class="forgot-link">아이디, 비밀번호를 잊으셨나요?</a>
        </div>
        <br>
        <c:if test = "${s_id != null}">
            <input type="submit" class="btn btn-primary btn-block" value="로그아웃">
        </c:if>
		<c:if test="${s_id == null}">
			<input type="submit" class="btn btn-primary btn-block" value="로그인">   
		</c:if>
              
    </form>
    </div>
    <br> 
    <div class="text-center small">계정이 없으신가요? &nbsp&nbsp<a href="/join">회원가입</a></div>
 
 <!-- 유효성 검사 -->   
 <script>
    // 1) 아이디 5~20글자 인지?
   	let u_id = document.getElementById("u_id").value;
   	u_id = u_id.trim();
   	if(!(u_id.length>=5 && u_id.length<=20)){
   		alert("아이디는 5~20글자 이내로 입력해주세요");
   		document.getElementById("u_id").focus();
   		return false;
   	} // if end
	    	
	// 비밀번호가 숫자, 영문자(대소문자 구분없음)를 포함한 8~20글자 인지?
	let passwordRegex = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{8,20}$/;
	let u_pw = document.getElementById("u_pw").value;
	   u_pw = u_pw.trim();
	   if(!u_pw.match(passwordRegex)){
	       alert("비밀번호는 숫자, 영문자(대소문자 구분없음)를 포함한 8자~20자 이내로 입력해주세요");
	       document.getElementById("u_pw").focus();
	       return false;
	   } // if end
	} // loginCheck() end
</script>
<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>