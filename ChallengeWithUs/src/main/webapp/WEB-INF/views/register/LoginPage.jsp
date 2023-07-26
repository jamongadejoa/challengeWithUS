<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/inc/viewsCss/loginStyle.css"
	type="text/css" />
	<style>
	.login-light .element-3{
		cursor:pointer;
	}
	.login-light .element-4{
		cursor:pointer;
	}
</style>
</head>
<script>
	/* 로그인 정보 체크  */
	function loginChk(){
		/* 각각의 조건문 작성필요 */
		alert("등록된 아이디가 없습니다")
		//alert("비밀번호가 일치하지 않습니다")		
	}
</script>
<body>
	<div class="login-light">
		<div class="div">
			<div class="overlap-group">
				<div class="login-button" id="loginBtn" onclick="loginChk()">
					<div class="element">로그인</div>
				</div>
				<input type="password" class="password-fill" id="userpwd" placeholder="비밀번호를 입력해주세요"/>
				<input type="text" class="username-fill" id="userid" placeholder="아이디를 입력해주세요"/>
				<div class="text-wrapper">비밀번호</div>
				<div class="element-2">아이디</div>
				<div class="element-3" ><a href="/home/FindId">아이디 찾기</a></div>
				<div class="element-4"><a href="/home/pwSearch">비밀번호 찾기</a></div>
				<img class="line" alt="Line" src="<%= request.getContextPath() %>/imgs/Line_15.png" />
			</div>
			<div class="element-5">로그인</div>
		</div>
	</div>


</body>

