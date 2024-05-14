package com.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Store_info {
	/*
	 * 업소 관련 DTO
	 * 
	 * 
	 * */
	private int idx; // 업소 식별자
	private String store_name; //업소 명
	private String store_addr; // 업소 주소
	private String store_tel; // 업소 전화
	private String store_main_manu; // 업소 주메뉴
	private String store_menu_type; // 업소 메뉴종류
	private String store_type;  //업소 구분(식당, 카페)
	private String hotspot_idx; // 핫스팟 식별자
	
}
