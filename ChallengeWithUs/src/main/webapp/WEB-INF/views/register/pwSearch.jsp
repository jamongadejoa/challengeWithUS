<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/inc/viewsCss/pwdStyle.css?v=230728"
	type="text/css" />
</head>
<body>
	<form id="findIdForm">
		<div class="pwSearchWrap">
			<div class="pwSearchOverWrap">
				<div class="check">
					<button class="checkText" type="submit" id="findIdBtn">확인</button>
				</div>
				<div class="input-wrapper">
					<input type="text" class="username-fill" placeholder="아이디를 입력해주세요"
						id="memberId" required />
					<div class="error-wrapper">
						<div class="error-message" id="idMsg">*아이디는 필수 입력입니다</div>
					</div>
				</div>
				<div class="input-wrapper">
					<input type="email" class="email-fill" placeholder="이메일을 입력해주세요"
						id="memberEmail" required />
					<div class="error-wrapper">
						<div class="error-message" id="emailMsg">*이메일은 필수 입력입니다</div>
					</div>
				</div>
				<div class="element-2">이메일</div>
				<div class="element-3">아이디</div>
				<div class="element-4"
					onclick="location.pathname='home/register/findIdForm'">아이디 찾기</div>
				<div class="element-5">회원가입시 등록한 정보를 입력해주세요</div>
				<div class="element-6">아이디가 기억나지 않는다면?</div>
			</div>
			<div class="element">비밀번호 찾기</div>
		</div>
	</form>
	<script>
	$("#findIdBtn").on("click", function(event){
		event.preventDefault();
		var formData = $("#findIdForm").serialize();
		let MemberId = document.getElementById("memberId").value;
		let MemberEmail = document.getElementById("memberEmail").value;
		if (MemberId == "" || MemberId == null) {
			alert("아이디를 입력해주세요")
			return false;
		}
		if (MemberEmail == "" || MemberEmail == null) {
			alert("이메일을 입력해주세요")
			return false;
		}
		console.log(MemberId, MemberEmail);
		
		$.ajax({
			data:formData,
			method:'post',
			url:'${pageContext.request.contextPath}/register/findPwd',
			success:function(result){
				if (result == 0) {
					alert("입력하신 정보와 일치하는 회원이 없습니다")
				} else {
					alert("이메일로 비밀번호가 전송되었습니다.")
					window.location.href = "${pageContext.request.contextPath}/";
				}
			},
			error:function(e){
				alert("이메일 전송 실패")
				console.log(e.responseText);
			}
		})
		
	})
</script>
	<script>
const checkRequiredFields = () => {
	const inputs = document.querySelectorAll('.pwSearchWrap input[required]');

	inputs.forEach(input => {
	  input.addEventListener('blur', () => {
	    const errorWrapper = input.parentElement.querySelector('.error-wrapper');
	    const errorMessage = errorWrapper.querySelector('.error-message');
	    if (input.value.trim() === '') {
	      input.classList.add('error');
	      errorWrapper.classList.add('error-wrapper');
	      errorMessage.style.display = 'block';
	      input.style.borderColor = 'red';
	    } else {
	      input.classList.remove('error');
	      errorWrapper.classList.remove('error-wrapper');
	      errorMessage.style.display = 'none';
	      input.style.borderColor = '#3366ff';
	    }
	  });
	});	
}
checkRequiredFields();

</script>
</body>
