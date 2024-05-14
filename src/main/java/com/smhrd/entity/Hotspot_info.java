package com.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Hotspot_info {
	/*
	 * 핫스팟 관련 DTO
	 * 
	 * 
	 * */
	private int hotspot_idx; // 핫스팟 식별자
	private String hotspot_type; // 핫스팟 구분(전통행사, 공연장, 미술관, 박물관 구분)
	private String hotspot_name; // 핫스팟 이름
	private String hotspot_addr; // 주소
	private String lat; // 핫스팟 위도
	private String lng; // 핫스팟 경도
	private String hotspot_tel; // 핫스팟 전화
	private String holiday; // 휴무일
	private String discount_info; // 할인정보
	private String gu_type; // 지역구분
	private String hotspot_image;//이미지주소
	private String program_name; //프로그램 이름 
	private String program_content; //프로그램 컨텐츠
	private String program_schedule;//프로그램 스케줄
	private String admission_fee; // 입장료
	private String disabled_toilet; //장애인화장실
	private String disabled_access_door;//장애인 출입문
	private String wheelchair_rental;//장애인 출입문
	private String braille_guide;//점자 안내
	private String audio_guide;;//소리 안내
	private String hotspot1;
	private String hotspot2;
	private String hotspot3;
	private String hotspot4;
	private String hotspot5;
}
