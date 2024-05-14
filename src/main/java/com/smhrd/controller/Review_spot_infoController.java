package com.smhrd.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smhrd.entity.Hotspot_info;
import com.smhrd.mapper.HotspotMapper;
import com.smhrd.mapper.Review_spot_info;

// 리뷰 정보
@Controller
public class Review_spot_infoController {

	@Autowired
	private Review_spot_info mapper;
	@Autowired
	private HotspotMapper mapper1;
	
	// 리뷰페이지
	@RequestMapping("/reviewForm.do")
	public String getData(@RequestParam("idx") int idx, Model model) {
	    // Review_spot_info 테이블에서 데이터 조회
	    List<com.smhrd.entity.Review_spot_info> reviewList = mapper.reviewForm(idx);
	    model.addAttribute("reviewList", reviewList);
	    
	    // Hotspot_info 테이블에서 데이터 조회
	    List<com.smhrd.entity.Hotspot_info> hot = mapper1.hot(idx);
	    model.addAttribute("hot", hot);
	    
	    return "reviewForm"; // 뷰 이름 리턴
	}

	// 리뷰작성
	@RequestMapping("reviewInsert.do")
	public String reviewInsert(HttpServletRequest request, com.smhrd.entity.Review_spot_info vo) {
	    try {
	        // 입력된 데이터 출력
	        System.out.println("TRAD_IDX: " + vo.getTrad_idx());
	        System.out.println("REVIEW_CONTENT: " + vo.getReview_content());
	        System.out.println("USER_ID: " + vo.getUser_id());
	        System.out.println("REVIEW_LIKES: " + vo.getReview_likes());
	        
	        // 데이터베이스에 데이터 삽입
	        mapper.reviewInsert(vo);
	        
	        // 리다이렉트
	        return "redirect:/reviewForm.do?idx=" + vo.getTrad_idx();
	    } catch (Exception e) {
	    	System.out.println("TRAD_IDX: " + vo.getTrad_idx());
	        System.out.println("REVIEW_CONTENT: " + vo.getReview_content());
	        System.out.println("USER_ID: " + vo.getUser_id());
	        System.out.println("REVIEW_LIKES: " + vo.getReview_likes());
	        // 예외 처리
	        e.printStackTrace(); // 예외 내용 로그에 기록
	        return "errorPage"; // 오류 페이지로 리디렉션
	    }
	}

	
	
	
    
	
	
	
	
	
}