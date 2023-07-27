<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/inc/viewsCss/challengeView.css" type="text/css"/>
<div>
		<c:if test="${logId == dto.memberId}">
			<a
				href="/home/ChallengeEdit?chalNo=${dto.chalNo}&nowPage=${pDTO.nowPage}">수정</a>
			<a href="javascript:delChk()" id="ChallengeDelBtn">삭제</a>
		</c:if>
	</div>
<p>
  <div class="Wrapper">
  
    <div class="Ellipse5"></div>
    <div class="ChallengeTitle">${dto.chalTitle }</div>
  
   <div class="LatestTransaction1">
       <div class="Label">시작</div>
      <div class="Date">${dto.chalstartDate.split(' ')[0]}</div>
     
    </div>
    
    <div class="LatestTransaction2">
      <div class="Label">종료</div>
      <div class="Date">${dto.chalendDate.split(' ')[0]}</div>
    </div>
  
    
    <div class="WalletAmount-top">
      <div class="SmhrdId">smhrd<br/>(ID)</div>
      <div class="Membership">회원등급</div>
    </div>
   
  </div>

	<div class="Group4">
    <div class="Group3 total-participants">
      <div class="participants-count">${dto.participantsCnt }명</div>
      <div class="text-wrapper">총 참가자 수</div>
    </div>
    <div class="Group3 participation-fee">
      <div class="participation-fee-amount">${dto.chalFee }원</div>
      <div class="text-wrapper">참가비</div>
    </div>
    <c:choose>
				<c:when
					test="${dto.chalFilename.endsWith('.jpg') || dto.chalFilename.endsWith('.png')}">
					<img
						class="Image2" src="<%=request.getContextPath()%>/upload/${dto.chalFilename}" alt="Challenge Image"/>
				</c:when>
				<c:otherwise>
					<img class="Image2" src="<%=request.getContextPath()%>/imgs/card.jpg" alt="Challenge Image"/>
				</c:otherwise>
			</c:choose>

    <div class="challenge-description">
     ${dto.chalContent }
    </div>
    <div class="Box">
      <button class="challenge-btn" id="challengePart">도전하기</button>
    </div>
  </div>
  
  <div class="Group5">
  <form action="">
    <div class="challenge-authentication">
      <div class="WalletAmount"></div>
      <div class="instruction-title"><button type="button" onclick="upload()">챌린지 인증</button></div>
      
    </div>
    <div class="file-upload">

      <div class="WalletAmount"></div>
      <div class="instruction-title">파일 업로드</div>
          <input type="file" id="imageInput" value="파일첨부"/>
    </div>
    </form>
    <div class="Group8">
      <div class="instruction-content">
        기상 시간을 확인 할 수 있도록<br/>“챌린지 인증” 버튼을 눌러 주세요
      </div>
      <div class="step-number">2단계</div>
    </div>
    <div class="Group7">
      <div class="instruction-content">
      <span onclick="updateChallengeCodeLabel()">챌린지 인증 코드 : </span><span id="challengeCodeLabel"></span><br>
        코드명을 자필로 쓴 후<br/>사진을 찍어 파일을 업로드 해주세요
      </div>
      
      <div class="step-number">1단계</div>
    </div>
    <div class="instruction-heading">
      챌린지 인증 안내 
    </div>
  </div>
</p>
<script>
//난수 생성 함수
let randomCode = null;
function generateRandomCode() {
    let code = '';
    for (let i = 0; i < 6; i++) {
        code += Math.floor(Math.random() * 10);
    }
    return code;
}

// 챌린지 인증 코드 생성 및 라벨에 반영
function updateChallengeCodeLabel() {
    randomCode = generateRandomCode();
    document.getElementById("challengeCodeLabel").innerText = randomCode;
}

function delChk() {
	if(confirm("글을 삭제하시겠습니까?")) {
		$.ajax({
			url : '${pageContext.request.contextPath}/ChallengeDelete',
			type : 'get',
			data : {
				"chalNo":${dto.chalNo}
			},
			success : function(response) {
				// 작성 성공 시
				if (response == "success") {
					alert("삭제 성공");
					window.location.replace("${pageContext.request.contextPath}/");
				}
				// 작성 실패 시
				else if (response == "failure") {
					alert("삭제 실패");
					window.location.reload();
				}
			},
			error : function(e) {
				console.log(e.responseText);
			}
		});
	}
}

$("#challengePart").on("click", function(){
	
	$.ajax({
		url:"${pageContext.request.contextPath}/challengePart",
		method:"post",
		data:{
			"chalNo":${dto.chalNo},
			"chalFee":${dto.chalFee },
		},
		success:function(result) {
			if (result.result==1) {
				alert("챌린지 참여가 완료되었습니다!");
				let participantsCnt = result.participantsCnt;
				$(".participants-count").text(participantsCnt + "명");
				
			} else if (result.result == 0){
				alert("이미 참여중인 챌린지 입니다.");	
			} else if (result.result == 3) {
				alert("예치금이 부족합니다!");				
			}
			else {
				alert("로그인 후 참여가 가능합니다.");
				window.location.href= "${pageContext.request.contextPath}/register/login";
			}
		}
	})
	
})

function upload() {
		console.log("upload function called")
		const imageInput = $("#imageInput")[0]
		
		if(imageInput.files.length==0) {
			alert("이미지를 업로드해주세요")
			return;
		}
		if (randomCode==null) {
			alert("인증 코드를 먼저 발급해주세요!")
			return;
		}
		console.log(randomCode);
		const formData = new FormData();
		formData.append("image", imageInput.files[0])
		formData.append("chalNo", ${dto.chalNo})
		formData.append("randomCode", randomCode)
		$.ajax({
			type:"POST",
			url:'${pageContext.request.contextPath}/imgCertify',
			processData:false,
			contentType:false,
			data:formData,
			success:function(result) {		
				if (result == "noId") {
					alert("로그인 후 인증해주세요!")
					window.location.href= "${pageContext.request.contextPath}/register/login";
				} else if (result == "needPart") {
					alert("챌린지에 먼처 참가를 하고 인증을 해주세요!")				
				} else if (result == "already") {
					alert("오늘은 이미 인증을 완료하셨습니다!")
				} else if (result=="success") {
					alert("인증되었습니다!")
				} else {
					alert("코드와 일치하지 않는 인증번호입니다!")
				}
				console.log(result)
			},
			error:function(error) {
				console.log(e.responseText)
				alert("인증실패 사진을 다시 입력해주세요")
			}
		})
	}
</script>