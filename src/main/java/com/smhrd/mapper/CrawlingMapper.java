package com.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.smhrd.entity.Crawling_info;

@Mapper
public interface CrawlingMapper {

	
	
   	
   public List<Crawling_info> getCrawlingInfo(); //

  


     

}