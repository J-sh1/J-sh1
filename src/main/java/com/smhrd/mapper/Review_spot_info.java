package com.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.smhrd.entity.Hotspot_info;


@Mapper
public interface Review_spot_info {


	public List<com.smhrd.entity.Review_spot_info> reviewForm(int idx);

	public void reviewInsert(com.smhrd.entity.Review_spot_info vo);

	public List<Hotspot_info> hot(int idx);


	

	

}
