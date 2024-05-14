package com.smhrd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smhrd.mapper.HotspotMapper;
import com.smhrd.mapper.Hotspot_info;



// 핫스팟 정보
@Controller
public class Hotspot_infoController {

	@Autowired
    private HotspotMapper mapper; // 매퍼 인터페이스명 수정
	
	
    @RequestMapping("/getHotspotInfo.do")
    @ResponseBody
    public List<Hotspot_info> HotspotList() {
        System.out.print("장소 정보 가져오기");

        // HotspotInfoMapper를 사용하여 핫스팟 정보를 가져옴
         List<Hotspot_info> list = mapper.getHotspotInfo();
         	
        	

        return list; // 배열 형태의 list 반환
    }
    
  // 그래프 페이지
    @RequestMapping("graph.do")
    public String graph(Model model) {
        
    	List<Hotspot_info> hotspotList = mapper.graph();
    	model.addAttribute("hotspotList", hotspotList);
        
        return "graph";
    }
    
    @RequestMapping("/Juno")
    public String Juno(Hotspot_info vo, Model model) {
    	
    	List<Hotspot_info> graphlist = mapper.juno(vo);
    	model.addAttribute("graphlist", graphlist);
    	
    	return "graph";
    }
	



    
    
}
