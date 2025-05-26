<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 0526 김유진 수정사항 -->
<jsp:include page="header.jsp" />
<h1>비밀번호 수정</h1>
<hr>
<form action="/modify" method="POST" onsubmit="return submitForm()">
	<table border="1" width="700">
		<thead></thead>
		<tbody>
			<tr><th>현재 비밀번호</th><td><input type="password" name="pw" id="pw" onkeyup="check()" required></td><td><span id="pwMsg">기존 비밀번호 작성</span></td></tr>
			<tr><th>새 비밀번호</th><td><input type="password" name="newPw" id="newPw" onkeyup="pwCheck1()" required></td><td><span id="modifyPwMsg"> 영자로 시작, 영문/숫자/특수문자 조합 (10~15글자)</span></td></tr>
			<tr><th>비밀번호 확인</th><td><input type="password" name="newPwChec" id="newPwCheck" onkeyup="pwCheck2()" required></td><td><span id="modifyCheckPwMsg">확인을 위해 비밀번호를 다시 입력해 주세요.</span></td></tr>
		</tbody>
	</table>
			<input type="text" name="sessionId" id="sessionId" value="${id}">
			<input type="text" name="sessionPw" id="sessionPw" value="${pw}"><br>
			${modifyMsg }
			<button type="submit" id="submitBtn" disabled>수정</button>
</form>

<script>
let isPwValid = false; // 기존 비밀번호 유효성
let isNewPwValid = false;  // 새 비밀번호 유효성
let isNewCheckPwValid = false;  // 비밀번호 확인 유효성

// 유효성검사 - 비밀번호 (입력 조건, 재확인)
function check(){
	const pw = document.getElementById("pw").value;
	const sessionPw = document.getElementById("sessionPw").value;
	const pwMsg = document.getElementById("pwMsg");
	
	isPwValid = false;
	
	if (pw === sessionPw){
		pwMsg.innerText = "확인되었습니다.";
		pwMsg.style.color = "blue";
		isPwValid = true;
	} else {
		pwMsg.innerText = "기존 설정한 비밀번호와 다릅니다."
		pwMsg.style.color = "red";
		isPwValid = false;
	}
	updateSubmitBtn();
}

	function pwCheck1(){
		const pw = document.getElementById("pw").value;
		const newPw = document.getElementById("newPw").value;
		const modifyPwMsg = document.getElementById("modifyPwMsg");
		
		const regex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9])[a-zA-Z][a-zA-Z0-9!@#$%^&*]{9,14}$/;
		const pwStartOnly = /^[a-zA-Z]/; // 영자로 시작하는 조건만 충족
		const pwAlphabetOnly = /[a-zA-Z]/; // 영어 충족
		const pwNumberOnly = /[0-9]/; // 숫자 충족
		const pwSpecialOnly = /[^a-zA-Z0-9]/; // 특수문자 충족
		const pwLengthOnly = /^.{10,15}$/; // 길이 조건만 충족
		console.log(pw + ", " + newPw);
		
		isNewPwValid = false;
	    modifyPwMsg.innerText = "";
	    modifyPwMsg.style.color = "black";
		
		 if (!newPw) {
			 modifyPwMsg.innerText = "영자로 시작, 영문/숫자/특수문자 조합 (10~15글자)";
			 modifyPwMsg.style.color = "black";
		    } else if (pw === newPw){
		    	modifyPwMsg.innerText = "기존과 다른 비밀번호로 설정해 주세요.";
		    	modifyPwMsg.style.color = "red";
		    } else if (regex.test(newPw)){
		    	modifyPwMsg.innerText = "사용 가능한 비밀번호입니다.";
		    	modifyPwMsg.style.color = "blue";
		    	isNewPwValid = true;
		    } else if (!pwStartOnly.test(newPw)){
		    	modifyPwMsg.innerText = "영자로 시작해 주세요.";
		    	modifyPwMsg.style.color = "red";
		    } else if (!(pwAlphabetOnly.test(newPw) && pwNumberOnly.test(newPw) && pwSpecialOnly.test(newPw))){
		    	if (!pwAlphabetOnly.test(newPw)){
		    		modifyPwMsg.innerText = "영자를 추가해 주세요.";
		    		modifyPwMsg.style.color = "red";
		    	} else if (!pwNumberOnly.test(newPw)){
		    		modifyPwMsg.innerText = "숫자를 추가해 주세요.";
		    		modifyPwMsg.style.color = "red";
		    	} else if (!pwSpecialOnly.test(newPw)){
		    		modifyPwMsg.innerText = "특수문자를 추가해 주세요.";
		    		modifyPwMsg.style.color = "red";
		    	} else {
		    		modifyPwMsg.innerText = "영문/숫자/특수문자를 조합해서 입력해 주세요.";
		    		modifyPwMsg.style.color = "red";
		    	}
		    } else if (!pwLengthOnly.test(newPw)){
		    	modifyPwMsg.innerText = "10~15자 사이로 입력해 주세요.";
		    	modifyPwMsg.style.color = "red";
		    } else {
		    	modifyPwMsg.innerText = "형식이 올바르지 않습니다.";
		    	modifyPwMsg.style.color = "red";
		    }
		    	updateSubmitBtn();
	}
	
	function pwCheck2(){
		const newPw = document.getElementById("newPw").value;
		const newPwCheck = document.getElementById("newPwCheck").value;
		const modifyCheckPwMsg = document.getElementById("modifyCheckPwMsg");
		
		isNewCheckPwValid = false;
		
		if (!newPwCheck){
			modifyCheckPwMsg.innerText = "확인을 위해 비밀번호를 다시 입력해 주세요.";
			modifyCheckPwMsg.style.color = "black";
			isNewCheckPwValid = false;
			 updateSubmitBtn();
		} else if (!isNewPwValid){
			modifyCheckPwMsg.innerText = "비밀번호 설정부터 다시 확인해 주세요.";
			modifyCheckPwMsg.style.color = "red";
			isNewCheckPwValid = false;
			 updateSubmitBtn();
		} else if (isNewPwValid && newPw === newPwCheck){
			modifyCheckPwMsg.innerText = "확인되었습니다.";
			modifyCheckPwMsg.style.color = "blue";
			isNewCheckPwValid = true;
			 updateSubmitBtn();
		} else {
			modifyCheckPwMsg.innerText = "설정한 비밀번호와 맞지 않습니다. 다시 확인해 주세요.";
			modifyCheckPwMsg.style.color = "red";
			isNewCheckPwValid = false;
			 updateSubmitBtn();
		}
	}
	
	//제출

	function updateSubmitBtn(){
		const submitBtn = document.getElementById("submitBtn");
		
	    if (isPwValid && isNewPwValid && isNewCheckPwValid) {
	        submitBtn.disabled = false;
	    } else {
	        submitBtn.disabled = true;
	    }
	}
	
const inputsRequired = document.querySelectorAll("input[required]");
inputsRequired.forEach(input => {
	input.addEventListener("input", updateSubmitBtn);
});
	
	function submitForm(){
		 const submitNewPw = document.getElementById('newPw');
		 const encryptedPw = secretPw(submitNewPw.value);
		 submitNewPw.value = encryptedPw;
		
		return true;
	}
	
	// 비밀번호 암호화
	function secretPw(pw){
		
		// 홀수자리 = 난수
	    function getRandomChar() {
	        const chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*";
	        return chars.charAt(Math.floor(Math.random() * chars.length));
	    }
		
		// 짝수자리 = 비밀번호값 + (남는 자리 : 영문/숫자/특수문자 외 기호 삽입)
	    const extraChars = "`~?-_+={}[]|\\:;\"'<>,./";
	    
	    // 배열
	    const length = 30;
	    let result = new Array(length).fill('');
	    
	    for (let i = 0; i < pw.length; i++){
	    	
	    	let indexEven = i * 2;
	    	if (indexEven >= length){
	    		break;
	    	}
	    	result[indexEven] = pw.charAt(i); // 비밀번호값 대입
	    }
	    
	    for (let i = pw.length * 2; i < length; i += 2){
	    	result[i] = extraChars.charAt(Math.floor(Math.random() * extraChars.length));
	    }
	    
	    for (let i = 1; i < length; i += 2) {
	        result[i] = getRandomChar();
	    }
	    
	    return result.join('');
	}
</script>

<jsp:include page="footer.jsp" />
</body>
</html>