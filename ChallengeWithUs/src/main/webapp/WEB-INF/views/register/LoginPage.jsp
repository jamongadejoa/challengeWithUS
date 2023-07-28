<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/inc/viewsCss/loginStyle.css?v=230728"
	type="text/css" />


</head>
<script>
	/* 로그인 정보 체크  */
	function login() {
		if (document.getElementById("userid").value == "") {
			alert("아이디를 입력하세요");
			return false;
		}
		if (document.getElementById("userpwd").value == "") {
			alert("비밀번호를 입력하세요");
			return false;
		}

		var formData = $("#loginForm").serialize(); // 폼 데이터를 모두 수집하여 직렬화

		$
				.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/register/loginOk",
					data : formData,
					success : function(result) {
						console.log(result);
						// 서버에서 보낸 결과를 처리하는 부분
						if (result == "success") {
							window.location.href = "${pageContext.request.contextPath}/";
						} else {
							alert("아이디 혹은 비밀번호가 일치하지 않습니다.");
						}
					},
					error : function(xhr, status, error) {
						console.error(xhr.responseText);
						alert("서버 오류로 인해 로그인에 실패했습니다.");
					}
				});
	}
</script>
<body>
	<form action="<%=request.getContextPath()%>/register/loginOk"
		method="post" id="loginForm">
		<div class="login-light">
			<div class="div">
				<div class="overlap-group">
					<div class="login-button" id="loginBtn">
						<button onclick="login()">로그인</button>
					</div>
					<div class="input-wrapper">
						<input type="text" class="username-fill" id="userid"
							name="memberId" placeholder="아이디를 입력해주세요" required="required" />
						<div class="error-wrapper">
							<div class="error-message" id="idMsg">*아이디는 필수 입력입니다</div>
						</div>
					</div>
					<div class="input-wrapper">
						<input type="password" class="password-fill" id="userpwd"
							name="memberPwd" placeholder="비밀번호를 입력해주세요" required="required" />
						<div class="error-wrapper">
							<div class="error-message" id="pwdMsg">*비밀번호는 필수입력입니다</div>
						</div>
					</div>
					<div class="text-wrapper">비밀번호</div>
					<div class="element-2">아이디</div>
					<div class="element-3"
						onclick="location.pathname='home/register/findIdForm'">아이디
						찾기</div>
					<div class="element-4"
						onclick="location.pathname='home/register/pwSearch'">비밀번호 찾기</div>
					<img class="line" alt="Line"
						src="<%=request.getContextPath()%>/imgs/Line_15.png" />
				</div>
				<div class="element-5">로그인</div>
			</div>
		</div>
	</form>
	<script>
	const inputs = document.querySelectorAll('.login-light input[required]');

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

