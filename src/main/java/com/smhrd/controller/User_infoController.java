package com.smhrd.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smhrd.entity.Test;
import com.smhrd.entity.User_info;
import com.smhrd.mapper.test;

// 회원 관리 컨트롤러
@Controller
public class User_infoController {
	
	@Autowired
	private com.smhrd.mapper.User_info mapper;
	
	@RequestMapping("/")
	public String home() {
		return "intro";
	}
	
	
//	@RequestMapping("/boardList.do") 
//	public String boardList(Test ts) {
//		System.out.println("회원정보");
//		mapper.select(ts);
//		System.out.println("ts");
//		return "boardList.do";
//	}
	

	@RequestMapping("main.do")
	public String main() {
		return "main";
	}
	
	
	// 로그인 페이지
	@RequestMapping("loginForm.do")
	public String loginForm() {
		return "loginForm";
	}
	
	
	// 로그인
	@RequestMapping("/login.do")
	public String login(User_info vo, HttpSession session, String su) {
		System.out.println("로그인 페이지");
		User_info info = mapper.login(vo);
		
		if(info != null) {
			session.setAttribute("info", info);
			su = "redirect:/main.do";
		} else {
			
			su = "redirect:/loginForm.do?error=true";
		}

		return su;
	}
	
	// 회원가입 페이지
	@RequestMapping("joinForm.do")
	public String joinForm() {
		return "joinForm";
	}
	
	// 회원가입
	@RequestMapping("/join.do")
	public String join(User_info vo) {
			
		mapper.join(vo);
		System.out.println(toString());	
		return "redirect:/main.do";
	}
	
	// 아이디찾기 페이지
	@RequestMapping("idForm.do")
	public String idForm() {
		System.out.println("아이디 찾기");
		return "idForm";
	}
	
	// 아이디 찾기
	@RequestMapping("/id.do")
	public String id(User_info vo, Model model) {
	    User_info id_info = mapper.id(vo);
	    model.addAttribute("id_info", id_info);
	    return "idResult"; // idResult는 해당 아이디를 표시할 JSP 페이지의 이름입니다.
	}

	
	// 비밀번호 찾기 페이지
	@RequestMapping("pwForm.do")
	public String pwForm() {
		System.out.println("비밀번호 찾기");
		return "pwForm";
	}
	
	// 비밀번호 찾기
	@RequestMapping("/pw.do")
	public String pw(User_info vo) {
		
		mapper.pw(vo);
		return "redirect:/main.do";
	}
	
	// 회원정보 수정 페이지
	@RequestMapping("usereditForm.do")
	public String usereditForm() {
		System.out.println("회원정보 수정");
		return "usereditForm";
	}
	
	// 회원정보 수정
	@RequestMapping("/useredit.do")
	public String useredit(User_info vo) {
		mapper.userUpdate(vo);
		
		return "redirect:/logout.do";
	}
	
	// 회원탈퇴 페이지
	@RequestMapping("goodbyeForm.do")
	public String goodbyeForm() {
		return "goodbyeForm";
	}
	
	// 회원탈퇴
	@RequestMapping("/goodbye.do")
	public String goodbye(User_info vo) {
	    if (vo != null) {
	        // User_info 객체가 올바르게 수신되었음을 확인합니다.
	    	mapper.review(vo.getUser_id());
	        mapper.userGoodbye(vo);
	        System.out.println("회원탈퇴");
	    } else {
	        // vo 객체가 null인 경우, 오류 메시지를 출력하거나 로깅합니다.
	        System.out.println("회원탈퇴 실패: User_info 객체가 null입니다.");
	    }
	    return "redirect:/logout.do";
	}
	
	
	// 회원 리스트 가져오기
	@RequestMapping("/userlist.do")
	public String userlist(Model model) {
	    List<User_info> list = mapper.userlist(); 
	    model.addAttribute("list", list);
	    return "userlist";
	}
	
	
	// 마이페이지
	@RequestMapping("mypage.do")
	public String mypage() {
		return "mypage";
	}
	
	
	@RequestMapping("/userdelete.do")
	public String userdelete(@RequestParam("user_id") String user_id) {
		System.out.println(user_id);
		return "redirect:/usereditForm.do";
	}

   
	
	
	// 로그아웃
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main.do";
	}
	
}





    

