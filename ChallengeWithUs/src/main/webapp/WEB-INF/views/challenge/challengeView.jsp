<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/inc/viewsCss/challengeView.css" type="text/css"/>

<p>
  <div class="Wrapper">
  
    <div class="Ellipse5"></div>
    <div class="ChallengeTitle">미라클 모닝 챌린지 (제목)</div>
  
   <div class="LatestTransaction1">
       <div class="Label">시작</div>
      <div class="Date">2023/07/20</div>
     
    </div>
    
    <div class="LatestTransaction2">
      <div class="Label">종료</div>
      <div class="Date">2023/07/20</div>
    </div>
  
    
    <div class="WalletAmount-top">
      <div class="SmhrdId">smhrd<br/>(ID)</div>
      <div class="Membership">회원등급</div>
    </div>
   
  </div>

	<div class="Group4">
    <div class="Group3 total-participants">
      <div class="participants-count">123명</div>
      <div class="text-wrapper">총 참가자 수</div>
    </div>
    <div class="Group3 participation-fee">
      <div class="participation-fee-amount">9900원</div>
      <div class="text-wrapper">참가비</div>
    </div>
    <img class="Image2" src="<%= request.getContextPath() %>/imgs/card.jpg" alt="Challenge Image">
    <div class="challenge-description">
      아침에 일찍 일어나고 싶은데 늘 실패하는 분들을 위해 준비한 챌린지 입니다. 부지런한 생활습관을 만들고 싶은 분들은 이 챌린지에 도전하세요
    </div>
    <div class="Box">
      <button class="challenge-btn">도전하기</botton>
    </div>
  </div>
  
  <div class="Group5">
    <div class="challenge-authentication">
      <div class="WalletAmount"></div>
      <div class="instruction-title">챌린지 인증</div>
    </div>
    <div class="file-upload">
      <div class="WalletAmount"></div>
      <div class="instruction-title">파일 업로드</div>
    </div>
    <div class="Group8">
      <div class="instruction-content">
        기상 시간을 확인 할 수 있도록<br/>“챌린지 인증” 버튼을 눌러 주세요
      </div>
      <div class="step-number">2단계</div>
    </div>
    <div class="Group7">
      <div class="instruction-content">
        코드명을 자필로 쓴 후<br/>사진을 찍어 파일을 업로드 해주세요
      </div>
      <div class="step-number">1단계</div>
    </div>
    <div class="instruction-heading">
      챌린지 인증 안내
    </div>
  </div>
</p>