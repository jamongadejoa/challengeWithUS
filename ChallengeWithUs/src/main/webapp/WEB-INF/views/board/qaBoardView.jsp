<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<main>
	<h1>글 내용 보기</h1>
	<div>
		<a href='/home/board/boardList?nowPage=${pDTO.nowPage}<c:if test="${pDTO.searchWord!=null}">&searchKey=${pDTO.searchKey }&searchWord=${pDTO.searchWord }</c:if>'>목록</a>
		<hr/>
	</div>
	<ul>
		<li>QA글번호 : ${dto.QANo}</li>
		<li>QA글제목 : ${dto.QATitle }</li>
		<li>회원아이디 : ${dto.memberId}</li>
		<li>QA작성일 : ${dto.QADate}</li>
		<li>QA내용</br>
		${dto.QAContent }</li>
	</ul>
	<div>
		<!-- session의 로그인아이디(logId)와 현재 글의 글쓴이(userId)가 같으면 수정, 삭제 표시한다. -->
			<a href='/home/board/qaBoardEdit?no=${dto.QANo}'>수정</a>
			<a href="javascript:delChk()">삭제</a>
	</div>
	<!-- 댓글달기 -->
	<style>
		#coment{width:500px; height:80px;}
		#replyList>li{boarder-bottom : 1px solid #ddd; padding : 5px 0px}
	</style>
	<div id = "reply">
		<!-- 로그인 시 댓글 폼 -->
		<c:if test = "${logStatus=='Y'}">
			<form method = "post" id = "replyFrm">
				<input type = "hidden" name = "no" value = "${dto.qano}"><!-- 원글번호 -->
				<!-- 오라클에서 comment가 예약어기 때문에 coment -->
				<textarea name = "coment" id = "coment"></textarea>
				<input type="submit" value="댓글 등록하기"/>
			</form>
		</c:if>
		<hr/>
		<ul id = "replyList">
		</ul>
	</div>
</main>