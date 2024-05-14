package com.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class User_info {
	/*
	 * 회원 관련 DTO
	 * 
	 * 
	 * */
	private String user_id; // 회원아이디
	private String user_pw; // 회원 비밀번호
	private String user_nick; // 회원 닉네임
	private String user_gender; // 회원 성별
	private String user_phone; // 회원 전화번호
	private String user_genre1; // 회원 선호장르1 
	private String user_genre2; // 회원 선호장르2
	private String joined_at; // 회원가입 일자
	private String user_role; // 회원 구분(등급)
}
