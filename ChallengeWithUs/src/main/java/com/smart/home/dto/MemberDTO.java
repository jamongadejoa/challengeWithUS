package com.smart.home.dto;

import lombok.Data;

@Data
public class MemberDTO {
	private String memberId; // 아이디
	private String memberName; // 이름
	private String memberGender; // 성별
	private String memberPwd; // 비밀번호
	private String memberEmail; // 이메일
	private String memberTel; // 연락처
	private String memberAddr; // 주소
	private String memberBirth; // 생년월일


}	
