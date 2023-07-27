<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/inc/viewsCss/myChallenge.css" type="text/css"/>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700;900&display=swap" rel="stylesheet">


<div class="myChallengebox">
  
    <div class="myChallengeEllipse5"></div>
    <div class="myChallengeTitle">나의 챌린지</div>
  
   <div class="myChallenge1">
       <div class="ex">경험치</div>
      <div class="lv">1회 성공</div>
     
    </div>
    
    <div class="myChallenge2">
      <div class="ex">회원등급</div>
      <div class="lv">BASIC</div>
    </div>
  
    
    <div class="myChallenge-right">
      <div class="myChallengeName">김윤정</div>
      <div class="designtext">CHALLENGE WITH US</div>
    </div>
   
  </div>
  
  
  <div class="myChallenge2box">
    <div class="myChallenge2box-Ellipse5"></div>
    <div class="center">
      <div class="title">나의 챌린지</div>
    </div>
  </div>
  
  
 
 <div class="cardtable">
  <div class="ChallengeCard">
	  <div class="Fullcard">
	    <img class="Image2" src="<%= request.getContextPath() %>/imgs/card.jpg" />
	    <div class="Content">
	      <div class="Title">미라클 모닝 챌린지</div>
	      <div class="Description">아침에 일찍 일어나고 싶은데 늘 실패하는 분들을 위해 준비한 챌린지 입니다. 부지런한 생활습관을 만들고 싶은 분들은 이 챌린지에 도전하세요</div>
	      <div class="Button">
	        <button><a href="/home/challenge">GO</a></button>
	      </div>
	    </div>
	  </div>
</div>


<div class="ChallengeCard">
	  <div class="Fullcard">
	    <img class="Image2" src="<%= request.getContextPath() %>/imgs/card.jpg" />
	    <div class="Content">
	      <div class="Title">미라클 모닝 챌린지</div>
	      <div class="Description">아침에 일찍 일어나고 싶은데 늘 실패하는 분들을 위해 준비한 챌린지 입니다. 부지런한 생활습관을 만들고 싶은 분들은 이 챌린지에 도전하세요</div>
	      <div class="Button">
	        <button>GO</button>
	      </div>
	    </div>
	  </div>
</div>

<div class="ChallengeCard">
	  <div class="Fullcard">
	    <img class="Image2" src="<%= request.getContextPath() %>/imgs/card.jpg" />
	    <div class="Content">
	      <div class="Title">미라클 모닝 챌린지</div>
	      <div class="Description">아침에 일찍 일어나고 싶은데 늘 실패하는 분들을 위해 준비한 챌린지 입니다. 부지런한 생활습관을 만들고 싶은 분들은 이 챌린지에 도전하세요</div>
	      <div class="Button">
	        <button>GO</button>
	      </div>
	    </div>
	  </div>
</div>

</div>