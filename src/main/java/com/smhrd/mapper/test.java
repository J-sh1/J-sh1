package com.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.smhrd.entity.Test;


@Mapper
public interface test{

	public void select(Test ts);

	public Test login(Test vo);

	
	
}
