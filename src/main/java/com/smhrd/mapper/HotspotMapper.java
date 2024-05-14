package com.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HotspotMapper {

	
	
   	
   public List<Hotspot_info> getHotspotInfo(); //

   public List<Hotspot_info> graph();

   public List<Hotspot_info> juno(Hotspot_info vo);

   public List<com.smhrd.entity.Hotspot_info> hot(int idx);



     

}