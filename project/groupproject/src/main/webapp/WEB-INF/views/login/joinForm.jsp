<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!-- 본문 시작 template.jsp -->  

<div style="height:70px;"></div>
<div class="text-center">
<h3>* 회원가입 *</h3>
</div>
<div style="height:50px;"></div>

<span style="color:red; font-weight: bold">* 필수입력</span>
<br>
														 <!-- join.js -->
<form name="memfrm" id="memfrm" method="post" onsubmit="return memberCheck()">
<table class="table">
<tr>
    <th>*아이디</th>
    <td style="text-align: left">
    	<input type="text" name="u_id" id="u_id" size="10" maxlength="10" readonly>
    	<input type="button" value="ID중복확인" onclick="idCheck()" class="btn btn-primary"><!-- join.js -->
    </td>
</tr>
<tr>
    <th>*비밀번호</th>
    <td style="text-align: left">
    	<input type="password" name="u_pw" id="u_pw" size="10" maxlength="20" required>
    </td>
</tr>
<tr>
    <th>*비밀번호 확인</th>
    <td style="text-align: left">
    	<input type="password" name="repasswd" id="repasswd" size="10" maxlength="20" required>
    </td>
</tr>
<tr>
    <th>*이름</th>
    <td style="text-align: left">
    	<input type="text" name="u_name" id="u_name" size="20" maxlength="10" required>
    </td>
</tr>
<tr>
    <th>*성별</th>
    <td style="text-align: left">
    	<input type="radio" class="form-check-input" id="mf" name="mf" value="M" checked>남성
  		<label class="form-check-label" for="radio1"></label>
  		<input type="radio" class="form-check-input" id="mf" name="mf" value="F">여성
  		<label class="form-check-label" for="radio2"></label>
    </td>
</tr>
<tr>
	<th>*생년월일</th>
	<td style="text-align: left">
		<input type="text" name="birth" id="birth" size="20" maxlength="20" required >
	</td>
</tr>
<tr>
    <th>*이메일</th>
    <td style="text-align: left">
    	<input type="text" name="u_email" id="u_email" size="20" maxlength="50" required readonly>
    	<input type="button" value="Email중복확인" onclick="emailCheck()" class="btn btn-primary">
    </td>
</tr>
<tr>
    <th>전화번호</th>
    <td style="text-align: left"><input type="text" name=u_phone id="u_phone" size="15" maxlength="14"></td>
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
        <input type="submit" value="회원가입" class="btn btn-primary" />
        <input type="reset"  value="취소"     class="btn btn-light"/>
    </td>
</tr>
</table>
</form>

<!-- ----- DAUM 우편번호 API 시작 ----- -->
  <div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
    <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
  </div>

  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
      // 우편번호 찾기 찾기 화면을 넣을 element
      var element_wrap = document.getElementById('wrap');

      function foldDaumPostcode() {
          // iframe을 넣은 element를 안보이게 한다.
          element_wrap.style.display = 'none';
      }

      function DaumPostcode() {
          // 현재 scroll 위치를 저장해놓는다.
          var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
          new daum.Postcode({
              oncomplete: function(data) {
                  // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

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

                  // iframe을 넣은 element를 안보이게 한다.
                  // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                  element_wrap.style.display = 'none';

                  // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                  document.body.scrollTop = currentScroll;
              },
              // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
              onresize : function(size) {
                  element_wrap.style.height = size.height+'px';
              },
              width : '100%',
              height : '100%'
          }).embed(element_wrap);

          // iframe을 넣은 element를 보이게 한다.
          element_wrap.style.display = 'block';
      }
  </script>
<!-- ----- DAUM 우편번호 API 종료----- -->

<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>