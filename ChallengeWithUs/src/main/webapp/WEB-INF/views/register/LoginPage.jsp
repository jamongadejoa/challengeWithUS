<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/inc/viewsCss/loginStyle.css"
	type="text/css" />
<style>
.login-light {
	height: 592px;
	width: 669px;
	align-content: center;
	justify-content: center;
	margin:0 auto;
}

.login-light .div {
	height: 592px;
	position: relative;
}

.login-light .overlap-group {
	border: 3px solid;
	border-color: #1c43be;
	border-radius: 20px;
	box-shadow: 0px 4px 4px #00000040;
	height: 324px;
	left: 0;
	position: absolute;
	top: 162px;
	width: 669px;
}

.login-light .login-button button{
	align-items: center;
	background-color: #3366ff;
	border-radius: 20px;
	display: flex;
	flex-direction: column;
	gap: 10px;
	height: 55px;
	justify-content: center;
	left: 155px;
	padding: 2px;
	position: absolute;
	top: 212px;
	width: 352px;
	cursor: pointer;
	color: #ffffff;
	font-family: "Noto Sans KR-Bold", Helvetica;
	font-size: 25px;
	font-weight: 700;
	letter-spacing: 0;
	line-height: normal;
	border:none;
}

.login-light .login-button button:hover {
	background-color: #2650C0;
}

.login-light .login-button button:active {
	background-color: #20409D; 
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.4), inset 0 3px 10px
		rgba(0, 0, 0, 0.6);
}


.login-light .password-fill {
	border: 2px solid;
	border-color: #3366ff;
	border-radius: 20px;
	height: 55px;
	left: 155px;
	position: absolute;
	top: 131px;
	width: 352px;
}

.login-light .username-fill {
	border: 2px solid;
	border-color: #3366ff;
	border-radius: 20px;
	height: 55px;
	left: 155px;
	position: absolute;
	top: 41px;
	width: 352px;
}

.login-light .text-wrapper {
	color: #3366ff;
	font-family: "Noto Sans KR-Bold", Helvetica;
	font-size: 20px;
	font-weight: 700;
	left: 42px;
	letter-spacing: 0;
	line-height: normal;
	position: absolute;
	text-align: right;
	top: 145px;
	width: 102px;
}

.login-light .element-2 {
	color: #3366ff;
	font-family: "Noto Sans KR-Bold", Helvetica;
	font-size: 20px;
	font-weight: 700;
	left: 42px;
	letter-spacing: 0;
	line-height: normal;
	position: absolute;
	text-align: right;
	top: 54px;
	width: 102px;
}

.login-light .element-3 {
	color: #3366ff;
	font-family: "Noto Sans KR-Regular", Helvetica;
	font-size: 20px;
	font-weight: 400;
	left: 217px;
	letter-spacing: 0;
	line-height: normal;
	position: absolute;
	text-align: center;
	top: 290px;
	white-space: nowrap;
	width: 102px;
	cursor:pointer;
}

.login-light .element-4 {
	color: #3366ff;
	font-family: "Noto Sans KR-Regular", Helvetica;
	font-size: 20px;
	font-weight: 400;
	left: 336px;
	letter-spacing: 0;
	line-height: normal;
	position: absolute;
	text-align: center;
	top: 290px;
	white-space: nowrap;
	width: 132px;
	cursor:pointer;
}

.login-light .line {
	height: 22px;
	left: 331px;
	object-fit: cover;
	position: absolute;
	top: 293px;
	width: 1px;
}

.login-light .element-5 {
	color: #3366ff;
	font-family: "Noto Sans KR-Bold", Helvetica;
	font-size: 60px;
	font-weight: 700;
	left: 228px;
	letter-spacing: 0;
	line-height: normal;
	position: absolute;
	text-align: center;
	top: 74px;
	width: 212px;
}

@media (max-width: 400px) {
  .login-light {
    width: 100%;
    max-width: none;
    padding: 0;
  }
}
</style>
</head>
<script>
	/* 로그인 정보 체크  */
	function login() {
		/* if (document.getElementById("userid").value == "") {
			alert("아이디를 입력하세요");
			return false;
		}
		if (document.getElementById("userpwd").value == "") {
			alert("비밀번호를 입력하세요");
			return false;
		} */

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
							return "redirect:home";
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
					<input type="text" class="username-fill" id="userid" 
					name="memberId" placeholder="아이디를 입력해주세요" />
					<input type="password" class="password-fill" id="userpwd"
						name="memberPwd" placeholder="비밀번호를 입력해주세요" /> 
					<div class="text-wrapper">비밀번호</div>
					<div class="element-2">아이디</div>
					<div class="element-3" onclick="location.pathname='home/findIdForm'">아이디
						찾기</div>
					<div class="element-4" onclick="location.pathname='home/register/pwSearch'">비밀번호
						찾기</div>
					<img class="line" alt="Line"
						src="<%=request.getContextPath()%>/imgs/Line_15.png" />
				</div>
				<div class="element-5">로그인</div>
			</div>
		</div>

	</form>
</body>

