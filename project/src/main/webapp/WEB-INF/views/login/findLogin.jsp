<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!-- 본문 시작 findPW.jsp --> 
<div style="height:50px;"></div>
<div class="text-center">


	<h3>아이디 찾기</h3>
	<form name="findfrm" id="findfrm" method="post" action="findID" onrn findLogin()" style="margin:0 auto; width:270px;">
	<hr>
        <div class="form-group">
            <input type="text" name="u_name" id="u_name" class="form-control" maxlength="20" placeholder="이름" required="required">
        </div>
        <br>
        <div class="form-group">
            <input type="text" name="u_email" id="u_email" class="form-control" maxlength="50" placeholder="이메일" required="required">
        </div>
        <br>
        <div id="panel" style="display:none"></div> 
        <div id="idFeedback"></div>
        <br>
        <input type="submit" id="btn_userid" class="btn btn-primary btn-block" value="아이디 찾기">
	</form>	
	
	<div style="height: 100px;"></div>
	<!-- 여기서 20px는 필요한 만큼 조절하십시오. -->

	<h3>비밀번호 찾기</h3>
	<form name="findfrm" id="findfrm" method="post" action="findLogin" onsubmit="return findLogin()" style="margin:0 auto; width:270px;">
	<hr>
        <div class="form-group">
            <input type="text" name="u_id" id="u_id" class="form-control" maxlength="20" placeholder="아이디" required="required">
        </div>
        <br>
        <div class="form-group">
            <input type="text" name="u_email" id="u_email" class="form-control" maxlength="50" placeholder="이메일" required="required">
        </div>
        <br> 
        <input type="submit" class="btn btn-primary btn-block" value="비밀번호 찾기">
	</form>
</div>

<!-- 유효성 검사 -->
<script>
   function findLogin(){
	// 1) 아이디 5~20글자 인지?
		let u_id = document.getElementById("u_id").value;
		u_id = u_id.trim();
		if(!(u_id.length>=5 && u_id.length<=20)){
			alert("아이디는 5~20글자 이내로 입력해주세요");
			document.getElementById("u_id").focus();
			return false;
		} // if end
   	
   	// 2) 비밀번호가 숫자, 영문자(대소문자 구분없음)를 포함한 8~20글자 인지?
   	let passwordRegex = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{8,20}$/;
   	let u_pw = document.getElementById("u_pw").value;
       u_pw = u_pw.trim();
       if(!u_pw.match(passwordRegex)){
           alert("비밀번호는 숫자, 영문자(대소문자 구분없음)를 포함한 8자~20자 이내로 입력해주세요");
           document.getElementById("u_pw").focus();
           return false;
       } // if end
   } // findLogin() end
   
   
   
		//아이디 찾기
		$("#btn_userid").click(function (event) {
    	event.preventDefault(); // 기본 이벤트 중단
    	$.ajax({
	        type: "POST",
	        url: "findID",
	        data: {
	            username: $("#u_name").val().trim(),
	            useremail: $("#u_email").val().trim()
	        },
	        success: function (result) {
	            $("#panel").empty();
	            $("#panel").html(result);
	            $("#panel").show();
	        },
	        	error: function () {
	            alert("오류가 발생했습니다.");
	        }
	    	});
		});
   
</script>
<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>