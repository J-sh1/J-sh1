package com.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class User_tour_schedule {
	/*
	 * 여행경로 관련 DTO
	 * 
	 * 
	 * */
	private int ts_idx; // 경로 식별자
	private String user_id; // 회원 아이디
	private String clob; // 여행경로
	private String created_at; // 등록일자
}
