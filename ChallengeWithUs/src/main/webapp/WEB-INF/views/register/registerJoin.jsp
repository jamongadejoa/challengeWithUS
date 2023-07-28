<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/inc/viewsCss/registerStyle.css?v=230728"
	type="text/css" />
</head>
<script type="text/javascript"
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(document).ready(function() {
		// ModelAndView로 전달된 alertMessage를 확인하고 있으면 alert 메시지를 띄웁니다.
		var alertMessage = "${alertMessage}";
		if (alertMessage) {
			alert(alertMessage);
		}

	});

	function submitForm() {

		let idJ = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
		let pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
		let nameCheck = /^[가-힣a-zA-Z]+$/;

		if (document.getElementById("userid").value == "") {
			alert("아이디를 입력하세요");
			return false;
		}

		if (document.getElementById("username").value == "") {
			alert("이름을 입력하세요");
			return false;
		}

		if (document.getElementById("userpwd").value == "") {
			alert("비밀번호를 입력하세요");
			return false;
		}

		if (document.getElementById("userpwdChk").value == "") {
			alert("비밀번호 확인란를 입력하세요");
			return false;
		}

		if (document.getElementById("useremail").value == "") {
			alert("이메일을 입력하세요");
			return false;
		}

		if (document.getElementById("userpwd").value != document
				.getElementById("userpwdChk").value) {
			alert("비밀번호와 비밀번호 확인란이 일치하지 않습니다.");
			return false;
		}

		if (!idJ.test(document.getElementById("userid").value)) {
			alert("아이디는 5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
			return false;
		}

		if (!pwdCheck.test(document.getElementById("userpwd").value)) {
			alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
			return false;
		}

		if (!nameCheck.test(document.getElementById("username").value)) {
			alert("이름에는 한글 및 영어만 사용가능합니다.");
			return false;
		}

		if (document.getElementById("dochk").getAttribute("data-value") != "Y") {
			alert("아이디 중복검사를 해주세요.")
			return false;
		}

		var formData = $("#regForm").serialize(); // 폼 데이터를 모두 수집하여 직렬화

		$
				.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/register/registerJoinOk",
					data : formData,
					success : function(result) {
						console.log(result);
						// 서버에서 보낸 결과를 처리하는 부분
						if (result == "success") {
							alert("회원가입이 성공적으로 완료되었습니다!");
							window.location.href = "${pageContext.request.contextPath}/";
						} else {
							alert("회원가입 실패");
						}
					},
					error : function(xhr, status, error) {
						console.error(xhr.responseText);
						alert("서버 오류로 인해 회원가입에 실패했습니다.");
					}
				});
	}

	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

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
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}

	function doubleChk() {
		var id = document.getElementById("userid").value;
		$.ajax({
			data : {
				'id' : id
			},
			url : '${pageContext.request.contextPath}/register/doubleChk',
			success : function(result) {
				if (result == 1) {
					alert("이미 사용중인 아이디입니다.");
				} else {
					alert("사용가능한 아이디입니다.");
					$("#dochk").attr("data-value", "Y");
				}
			},
			error : function(e) {
				console.log(e.responseText);
			}
		});
	}
</script>
<main>
	<form action="<%=request.getContextPath()%>/register/registerJoinOk"
		method="post" id="regForm">
		<div class="register-form">
			<div class="sign_font">회원가입</div>
			<input type="text" class="name" placeholder="이름" name="memberName"
				id="username">
			<div class="name_text">이름</div>
			<input type="text" class="phone" placeholder="연락처" name="memberTel">
			<div class="phone_text">연락처</div>
			<input type="email" class="email" placeholder="이메일"
				name="memberEmail" id="useremail">
			<div class="email_text">이메일</div>
			<input type="password" class="password" placeholder="비밀번호"
				id="userpwd" name="memberPwd">
			<div class="pw_text">비밀번호</div>
			<div class="sex_text">성별</div>
			<input type="radio" class="radio1" value="여" name="memberGender">
			<input type="radio" class="radio2" value="남" name="memberGender">
			<div class="male_font">남</div>
			<div class="female_font">여</div>
			<input type="password" class="confirm-password" placeholder="비밀번호 확인"
				id="userpwdChk">
			<div class="pwcon_text">비밀번호 확인</div>
			<input type="text" class="birthday" placeholder="생년월일"
				name="memberBirth">
			<div class="birth_text">생년월일</div>
			<input type="text" class="id" placeholder="아이디" id="userid"
				name="memberId">
			<div class="id_text">아이디</div>
			<div class="double-check" id="doubleChk">
				<div class="dochk" id="dochk" onclick="doubleChk()" data-value="N">중복확인</div>
			</div>
			<input type="text" id="sample6_postcode" class="postnum"
				placeholder="우편번호" name="zipcode"> <input type="text"
				id="sample6_extraAddress" class="conf" placeholder="참고항목"
				name="zipcodeSub"> <input type="text" class="address"
				placeholder="도로명 주소" id="sample6_address" name="streetAdr">
			<input type="text" id="sample6_detailAddress" class="detail_add"
				placeholder="상세주소" name="detailAdr">
			<div class="add_text">주소</div>
			<div class="find-address" onclick="sample6_execDaumPostcode()">
				<div class="fadd_text">주소검색</div>
			</div>
			<div class="login-button" onclick="submitForm()">
				<button>확인</button>
			</div>
		</div>
	</form>
</main>