<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/inc/viewsCss/FindIdStyle.css"
	type="text/css" />
<style>
.div-wrapper .element-3 {
	cursor: pointer;
}

.div-wrapper {
	height: 592px;
	width: 100%;
	max-width: 669px;
	align-content: center;
	justify-content: center;
	margin: 0 auto;
	position: relative;
	display: flex;
}

.div-wrapper .div {
	height: 592px;
	position: relative;
}

.div-wrapper .overlap-group {
	border: 3px solid;
	border-color: #1c43be;
	border-radius: 20px;
	box-shadow: 0px 4px 4px #00000040;
	height: 378px;
	left: 0;
	position: absolute;
	top: 134px;
	width: 669px;
	max-width: 669px;
	overflow: hidden;
}

.div-wrapper .login-button button {
	align-items: center;
	background-color: #3366ff;
	border-radius: 20px;
	display: flex;
	flex-direction: column;
	gap: 10px;
	height: 55px;
	justify-content: center;
	left: 155px;
	margin: 1% 0 0 0;
	position: absolute;
	top: 240px;
	width: 364px;
	cursor: pointer;
	border: none;
	font-family: "Noto Sans KR-Bold", Helvetica;
	font-size: 25px;
	font-weight: 700;
	color: #ffffff;
}

.div-wrapper .login-button button:hover {
	background-color: #2650C0; 
}

.div-wrapper .login-button button:active {
	background-color: #20409D; 
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.4), inset 0 3px 10px
		rgba(0, 0, 0, 0.6);
}

.div-wrapper .email-fill {
	border: 2px solid;
	border-color: #3366ff;
	border-radius: 20px;
	height: 55px;
	left: 159px;
	position: absolute;
	top: 162px;
	width: 352px;
}

.div-wrapper .username-fill {
	border: 2px solid;
	border-color: #3366ff;
	border-radius: 20px;
	height: 55px;
	left: 158px;
	position: absolute;
	top: 72px;
	width: 352px;
}

.div-wrapper .text-wrapper {
	color: #3366ff;
	font-family: "Noto Sans KR-Bold", Helvetica;
	font-size: 20px;
	font-weight: 700;
	left: 42px;
	letter-spacing: 0;
	line-height: normal;
	position: absolute;
	text-align: right;
	top: 177px;
	width: 102px;
}

.div-wrapper .element-2 {
	color: #3366ff;
	font-family: "Noto Sans KR-Bold", Helvetica;
	font-size: 20px;
	font-weight: 700;
	left: 42px;
	letter-spacing: 0;
	line-height: normal;
	position: absolute;
	text-align: right;
	top: 85px;
	width: 102px;
}

.div-wrapper .element-3 {
	color: #3366ff;
	font-family: "Noto Sans KR-Regular", Helvetica;
	font-size: 20px;
	font-weight: 400;
	left: 267px;
	letter-spacing: 0;
	line-height: normal;
	position: absolute;
	text-align: center;
	top: 336px;
	white-space: pre-wrap;
	width: 132px;
	padding: 1%;
}

.div-wrapper .element-4 {
	color: #a1a0bd;
	font-family: "Noto Sans KR-Regular", Helvetica;
	font-size: 25px;
	font-weight: 400;
	left: 115px;
	letter-spacing: 0;
	line-height: normal;
	position: absolute;
	text-align: center;
	top: 16px;
	white-space: nowrap;
	width: 448px;
}

.div-wrapper .element-5 {
	color: #a1a0bd;
	font-family: "Noto Sans KR-Regular", Helvetica;
	font-size: 20px;
	font-weight: 400;
	left: 202px;
	letter-spacing: 0;
	line-height: normal;
	position: absolute;
	text-align: center;
	top: 304px;
	width: 285px;
	padding: 1% 2em 0 0;
}

.div-wrapper .element-6 {
	color: #3366ff;
	font-family: "Noto Sans KR-Bold", Helvetica;
	font-size: 60px;
	font-weight: 700;
	left: 159px;
	letter-spacing: 0;
	line-height: normal;
	position: absolute;
	text-align: center;
	top: 27px;
	width: 377px;
}

.div-wrapper #nameMsg {
	display: none;
	color: red;
	font-size: 12px;
	position: absolute;
	width: 164px;
	top: 5px;
}

.div-wrapper #emailMsg {
	display: none;
	color: red;
	font-size: 12px;
	position: absolute;
	width: 164px;
	top: 8em;
}

.div-wrapper input:focus:invalid {
	border: 1px solid red;
}

.div-wrapper input.error:focus {
	border: 1px solid red;
}

.div-wrapper input.error+.error-message {
	display: none;
}

.div-wrapper input.error:invalid+.error-message {
	display: block;
	position: absolute; 
	left: 0;
}

.div-wrapper .input-wrapper {
	position: relative; 
}

.div-wrapper .error-wrapper {
	position: relative;
	display: flex;
	left: 24%;
	top: 8em;
}
</style>
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
	const checkRequiredFields = () =>{
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
	};
	checkRequiredFields();
			/* // 확인 버튼을 클릭했을 때 이벤트 핸들러
			const confirmButton = document.querySelector('.div-wrapper .element');
			confirmButton.addEventListener('click', () => {
				checkRequiredFields();
			  // 이름과 이메일을 가져옵니다.
			  const name = document.querySelector('.div-wrapper .username-fill').value;
			  const email = document.querySelector('.div-wrapper .password-fill').value;

			  // db서버에 해당 이름과 이메일이 있는지 확인합니다.
			  let memberId = 0;
			  if (name.trim() === '' || email.trim() === '') {
			    alert('Please enter all the required fields.');
			  } else {
			    $.ajax({
			      url: '${pageContext.request.contextPath}/register/findId',
			      type: 'POST',
			      dataType: 'json',
			      data: {
			        'memberName': name,
			        'memberEmail': email
			      },
			      success: function(data) {
			        if (data.memberId) {
			          // memberId가 있는 경우 팝업창을 띄웁니다.
			          showPopup(data.memberId);
			        } else {
			          // memberId가 없는 경우 오류 메시지를 표시합니다.
			          alert('Your ID is not found.');
			        }
			      },
			      error: function(error) {
			        console.log(error);
			      }
			    });
			  }
			}); */
	</script>
</body>
