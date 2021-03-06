// 회원가입 유효성
const signUpBox_form = document.querySelector(".signUpBox_form");
const signUpId = document.querySelector(".signUpId");
const signUpPw = document.querySelector(".signUpPw");
const signUpPwConfirm = document.querySelector(".signUpPwConfirm");
const signUpName = document.querySelector(".signUpName");
const signUpPhone = document.querySelector(".signUpPhone");

// 회원가입 submit 핸들러
function handleSignUpSubmit(event){
	const memberId = signUpId.value;
	const memberPw = signUpPw.value;
	const memberPwConfirm = signUpPwConfirm.value;
	const memberName = signUpName.value;
	const memberPhone = signUpPhone.value;
	
	if(validateId(memberId) == false){
		alert("아이디는 영문/숫자 조합만 가능합니다.");
		event.preventDefault();
	} else if(confirmValueLengthId(memberId) == false){
		alert("아이디를 4~16자 사이로 입력해주세요");
		event.preventDefault();
	} else if (confirmValueLengthPw(memberPw) == false) {
		alert("비밀번호를 8자 이상 입력해주세요");
		event.preventDefault();
	} else if (confirmPw(memberPw, memberPwConfirm) == false){
		alert("비밀번호가 달라요.");
		event.preventDefault();
	} else if(confirmName(memberName) == false) {
		alert("이름을 한글자 이상 입력해주세요");
		event.preventDefault();
	} else if (confirmPhoneNum(memberPhone) == false){
		alert("전화번호 숫자만 입력해주세요.");
		event.preventDefault();
	} else {			

	//회원가입 기능 작동
		$(signUpBox_form).attr("action", "/member/signUp");
		$(signUpBox_form).submit();
	}
}

// 아이디 특수문자 검사
function validateId (memberId){
	const regx = /^[a-zA-Z0-9]*$/;	
		if( !regx.test(memberId) ){
			return false;
		} else {
			return true;
		}		
}

// 아이디 길이 검사
function confirmValueLengthId(memberId){
	if(memberId.length < 4 || memberId.length > 16){
		return false;
	} else {
		return true;
	}
}

// 비밀번호 길이 검사
function confirmValueLengthPw(memberPw){
	if(memberPw.length < 8){
		return false;
	} else {
		return true;
	}
}

// 비밀번호 동일 검사
function confirmPw (memberPw, memberPwConfirm){
	if(memberPw !== memberPwConfirm){
		return false;
	} else {
		return true;
	}
}

// 이름 길이 검사
function confirmName (memberName){
	if(memberName.length < 1){
		return false;
	} else {
		return true;
	}

}

// 전화번호 숫자 입력 검사
function confirmPhoneNum(memberPhone){
	const regx = /^[0-9]+/g;
	if( !regx.test(memberPhone) ){
		return false;
	} else {
		return true;
	}		
}


// id 중복검사
$(".signUpId").on("propertychange change keyup paste input", function(){
	const userId = signUpId.value;
	let data = {memberId : userId}
	
	$.ajax({
		type: "post",
		url : "/member/memberIdChk",
		data : data,
		success : function(result){
			//console.log("성공여부 " + result);
			if(result != "fail"){
				$(".idOverlapCheckOk").css("display","inline-block");
				$(".idOverlapCheckNo").css("display","none");
			} else {
				$(".idOverlapCheckNo").css("display","inline-block");
				$(".idOverlapCheckOk").css("display","none");
			}
		}
	});
});



// 다음맵 api
   //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
const signUpAddressBtn = document.querySelector(".signUpAddressBtn");
   
	 function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;
                document.getElementById("jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }



signUpBox_form.addEventListener("submit", handleSignUpSubmit);
signUpAddressBtn.addEventListener("click", execDaumPostcode);