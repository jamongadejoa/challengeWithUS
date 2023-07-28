<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/inc/viewsCss/FindIdStyle.css?v=230728"
	type="text/css" />
</head>
<body>
	<script>	
	$(function(){
        let responseMessage = "<c:out value="${message}" />";
        console.log(responseMessage);
        if(responseMessage != ""){
            alert(responseMessage)
        }
    }) 
	</script>
	<form action="<%=request.getContextPath()%>/register/findId"
		method="post" id="findIdForm">
		<div class="div-wrapper">
			<div class="overlap-group">
				<div class="login-button">
					<button class="element">확인</button>
				</div>
				<div class="input-wrapper">
					<input type="text" class="username-fill" placeholder="이름를 입력해주세요"
						name="memberName" required />
					<div class="error-wrapper">
						<div class="error-message" id="nameMsg">*이름은 필수 입력입니다</div>
					</div>
				</div>
				<div class="input-wrapper">
					<input type="email" class="email-fill" name="memberEmail"
						placeholder="이메일을 입력해주세요" required />
					<div class="error-wrapper">
						<div class="error-message" id="emailMsg">*이메일은 필수입력입니다</div>
					</div>
				</div>
				<div class="text-wrapper">이메일</div>
				<div class="element-2">이름</div>
				<div class="element-3" onclick="location='pwSearch'">비밀번호 찾기</div>
				<div class="element-4">회원가입시 등록한 정보를 입력해주세요</div>
				<div class="element-5">비밀번호가 기억나지 않는다면?</div>
			</div>
			<div class="element-6">아이디 찾기</div>
		</div>
	</form>
	<script>
	const inputs = document.querySelectorAll('.div-wrapper input[required]');

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
	</script>

</body>
