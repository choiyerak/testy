/**
 * join.js
 */

function idCheck(){	// 아이디 중복확인
	
	window.open("idCheckForm.jsp", "idwin", "width=400, height=350");
	
} // idCheck() end

function emailCheck(){
	
	window.open("emailCheckForm.jsp", "emailwin", "width=400, height=350");
	
} // emailCheck() end

function memberCheck(){	// 회원가입 유효성 검사
	
	// 1) 아이디 5~10글자 인지?
	let u_id = document.getElementById("u_id").value;
	u_id = u_id.trim();
	if(!(u_id.length>=5 && u_id.length<=10)){
		alert("아이디는 5~10글자 이내로 입력해주세요");
		document.getElementById("u_id").focus();
		return false;
	} // if end
	
	// 2) 비밀번호 10~20글자 인지?
	let u_pw = document.getElementById("u_pw").value;
    u_pw = u_pw.trim();
    if(!(u_pw.length>=10 && u_pw.length<=20)){
        alert("비밀번호는 10~20글자 이내로 입력해주세요");
        document.getElementById("u_pw").focus();
        return false;
    } // if end
    
    // 3) 비밀번호와 비밀번호확인이 서로 일치하는지?       
	let repasswd = document.getElementById("repasswd").value;
    repasswd = repasswd.trim();
    if(repasswd!=u_pw){
        alert("비밀번호가 일치하지 않습니다");
        document.getElementById("repasswd").focus();
        return false;
    } // if end
    
    // 4) 이름 두글자 이상 인지?
    let u_name = document.getElementById("u_name").value;
    u_name = u_name.trim();
    if(u_name.length<2){
        alert("이름은 2글자 이상 입력해주세요");
        document.getElementById("u_name").focus();
        return false;
    } // if end
    
    /*
    // 5) 이메일 5글자 이상인지?
    let u_email = document.getElementById("u_email").value;
    u_email = u_email.trim();
    if(u_email.length<5){	
	    alert("이메일은 5글자 이상 정확하게 입력해주세요");
	    document.getElementById("u_email").focus();
	    return false;
    } // if end
    */
   
    // 6) 이메일 주소확인
     let emailRegex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/;
     let u_email = document.getElementById("u_email").value;
     u_email  = u_email.trim();   
     if(!email.match(emailRegex)){
	     alert("이메일주소가 틀립니다!!");
	     document.getElementById("u_email").focus()
	     return false;
     }//if end
    
    // 7) 전화번호를 입력했는지?
    let u_phone = document.getElementById("u_phone").value;
    u_phone = u_phone.trim();
    if(u_phone.length>14 || u_phone.length == 0 || u_phone.length<=7 || !/^[0-9 -]*$/.test(u_phone)){
      alert("유효하지 않은 전화번호 형식입니다!! 전화번호는 14자 이하여야 하며 숫자, 하이픈, 공백만 입력하세요");
      document.getElementById("u_phone").focus()
      return false;
    }//if end
}


