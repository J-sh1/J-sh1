package com.smhrd.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.smhrd.entity.Crawling_info;
import com.smhrd.mapper.CrawlingMapper;

import java.util.Collections;
import java.util.List;

@Controller
public class Crawling_infoController {

    @Autowired
    private CrawlingMapper mapper; // 매퍼 인터페이스명 수정

    @RequestMapping("/CrawlingInfo.do")
    public ModelAndView CrawlingList() {
        System.out.print("크롤링 정보 가져오기");

        // HotspotInfoMapper를 사용하여 핫스팟 정보를 가져옴
        List<Crawling_info> newsList = mapper.getCrawlingInfo();

        // newsList를 무작위로 섞음
        Collections.shuffle(newsList);

        // 리스트에서 첫 3개의 항목만 선택
        List<Crawling_info> randomNewsList = newsList.subList(0, Math.min(3, newsList.size()));

        // 모델 및 뷰 객체 생성
        ModelAndView mv = new ModelAndView("News");
        mv.addObject("newsList", randomNewsList); // 모델에 무작위로 선택된 뉴스 리스트 추가

        return mv; // 뷰 반환
    }
}
