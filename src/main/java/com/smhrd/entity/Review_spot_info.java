package com.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Review_spot_info {
	/*
	 * 리뷰관련 DTO
	 * 
	 * 
	 */
	
	private int review_idx; // 리뷰 식별자
	private int trad_idx; // 핫스팟 식별자
	private String review_content; // 리뷰 내용
	private String created_at; // 리뷰 작성일자
	private String user_id; // 리뷰 작성자
	private int review_likes; // 리뷰 별점
	private int review_ratings; // 리뷰 평점
	private int store_idx; // 업소 식별자
	
}
