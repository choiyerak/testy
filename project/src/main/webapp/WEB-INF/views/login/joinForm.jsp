<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!-- 본문 시작 template.jsp -->  
<script>
	$('#u_id').keyup(function(){
		let u_id = $('#u_id').val();
		
		$.ajax({
			url:"idCheck",
			type:"post",
			data:{u_id:u_id},
			dataType:'json',
			success: function(result){
				if(result == 1){
					$("#idFeedback").html('이미 사용 중인 아이디입니다');
					$("#idFeedback").attr('color','red');
				}else{
					$("idFeedback").html('사용가능한 아이디입니다');
					$("#idFeedback").attr('color','blue');
				}
			},
			error:function(){
				alert("서버요청실패");
			}
		}) // ajax end
	}) // keyup end
</script>

<div style="height:50px;"></div>
<div class="text-center">
	<h3>[ 회원가입 ]</h3>
															 <!-- join.js -->
	<form name="memfrm" id="memfrm" method="post" onsubmit="return userCheck()" style="margin:0 auto; width:800px;">
	<hr>
	<span style="color:red; font-weight: bold; float: right;">* 필수입력</span>
		<table class="table">
		<tr>
		    <th>*아이디</th>
		    <td style="text-align: left">
		    	<input type="text" name="u_id" id="u_id" size="15" maxlength="20" >
		    	<input type="button" name="idCheck" id="idCheck" value="ID중복확인" class="btn btn-primary" onclick="idCheck()"><!-- join.js -->
		    	<br>
				<div id="idFeedback"></div>
		    </td>
		</tr>
		<tr>
		    <th>*비밀번호</th>
		    <td style="text-align: left">
		    	<input type="password" name="u_pw" id="u_pw" size="15" maxlength="20" required>
		    	<br>
		    	<span style="color:gray;">비밀번호는 숫자, 영문자(대소문자 구분없음)를 포함한 8자~20자 이내로 입력해주세요</span>
		    </td>
		</tr>
		<tr>
		    <th>*비밀번호 확인</th>
		    <td style="text-align: left">
		    	<input type="password" name="repasswd" id="repasswd" size="15" maxlength="20" required>
		    </td>
		</tr>
		<tr>
		    <th>*이름</th>
		    <td style="text-align: left">
		    	<input type="text" name="u_name" id="u_name" size="15" maxlength="7" required>
		    </td>
		</tr>
		<tr>
		    <th>*성별</th>
		    <td style="text-align: left">
		    	<!--
		    		<input type="radio" class="form-check-input" id="u_sex" name="u_sex" value="M" checked>남성
		  			<input type="radio" class="form-check-input" id="u_sex" name="u_sex" value="F">여성
		  		-->
		  		<input type="text" name="u_sex" id="u_sex" size="5" maxlength="2">
		    </td>
		</tr>
		<tr>
			<th>*생년월일</th>
			<td style="text-align: left">
				<!--
					<input type="date" name="u_birth" id="u_birth" size="20" maxlength="20" required >
				-->
				<input type="text" name="u_birth" id="u_birth" size="15" maxlength="8" placeholder="예) 19941208">
			</td>
		</tr>
		<tr>
		    <th>*이메일</th>
		    <td style="text-align: left">
		    	<input type="text" name="u_email" id="u_email" size="20" maxlength="50" required>
		    	<input type="button" value="Email중복확인" onclick="emailCheck()" class="btn btn-primary">
		    </td>
		</tr>
		<tr>
		    <th>전화번호</th>
		    <td style="text-align: left"><input type="text" name=u_phone id="u_phone" size="15" maxlength="11" placeholder="공백없이 작성"></td>
		</tr>
		<tr>
		    <th>우편번호</th>
		    <td style="text-align: left">
		      <input type="text" name="u_postcode" id="u_postcode" size="7"  readonly>
		      <input type="button" value="주소찾기" onclick="DaumPostcode()" class="btn btn-primary">    
		    </td>
		</tr>
		<tr>  
		    <th>주소</th>
		    <td style="text-align: left"><input type="text" name="u_addr" id="u_addr" size="45" readonly></td>
		</tr>
		<tr>  
		    <th>상세주소</th>
		    <td style="text-align: left"><input type="text" name="u_address" id="u_address" size="45"></td>
		</tr>
		<tr>
		    <td colspan="2" style="text-align: center">
		    	<input type="checkbox" name="agree" id="agree" value="Y"> 이용약관 개인정보 수집 및 이용, 마케팅 활용 선택에 모두 동의합니다.
		    	<hr>
		        <input type="submit" value="회원가입" class="btn btn-primary" />
		    </td>
		</tr>
		</table>
	</form>
</div>

<!-- ----- DAUM 우편번호 API 시작 ----- -->
  <div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
    <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
  </div>

  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
   function DaumPostcode() {
       new daum.Postcode({
           oncomplete: function(data) {
               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

               // 각 주소의 노출 규칙에 따라 주소를 조합한다.
               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               var addr = ''; // 주소 변수
               var extraAddr = ''; // 참고항목 변수

               //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
               if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                   addr = data.roadAddress;
               } else { // 사용자가 지번 주소를 선택했을 경우(J)
                   addr = data.jibunAddress;
               }

               // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
               if(data.userSelectedType === 'R'){
                   // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                   // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                   if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                       extraAddr += data.bname;
                   }
                   // 건물명이 있고, 공동주택일 경우 추가한다.
                   if(data.buildingName !== '' && data.apartment === 'Y'){
                       extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                   }
                   // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                   if(extraAddr !== ''){
                       extraAddr = ' (' + extraAddr + ')';
                   }
                   // 조합된 참고항목을 해당 필드에 넣는다.
                   document.getElementById("u_address").value = extraAddr;
               
               } else {
                   document.getElementById("u_address").value = '';
               }

               // 우편번호와 주소 정보를 해당 필드에 넣는다.
               document.getElementById('u_postcode').value = data.zonecode;
               document.getElementById("u_addr").value = addr;
               // 커서를 상세주소 필드로 이동한다.
               document.getElementById("u_address").focus();
           }
       }).open();
   }
   
  </script>
<!-- ----- DAUM 우편번호 API 종료----- -->

	<script>
	$.datepicker.setDefaults({
	    dateFormat: 'yy-mm-dd',
	    changeMonth: true,
	    changeYear: true,
	    yearRange: '1955:2030',
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	    showMonthAfterYear: true,
	    yearSuffix: '년'
	});

	$("#u_birth").datepicker();
	</script>

<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>