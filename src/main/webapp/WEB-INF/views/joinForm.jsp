<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="/controller/resources/css/join.css" rel="stylesheet" />
<link href="/controller/resources/css/font.css" rel="stylesheet" />
<style>
    body {
        margin: 0;
        padding: 0;
    }
</style>
</head>
<body>
<div id="wrapper">
    <div id="main">
        <div class="inner">
            <!-- Content -->
            <header class="main"></header>
            <a href="/controller/main.do"><div id="logo_gcap"></div></a>
            <!-- Form -->
            <form name="frm" method="post" action="join.do" id="form_join" onsubmit="return fn_submit();">
                <div class="panel-body">
                    <div class="outer-frame">
                        <div class="inner-frame">
                            <input type="text" name="user_id" class="form-control" placeholder="아이디 입력" autofocus>
                            <input type="password" name="user_pw" class="form-control" placeholder="비밀번호 입력">
                            <input type="password" name="user_pwck" class="form-control" placeholder="비밀번호 확인">
                            <input type="text" name="user_nick" class="form-control" placeholder="닉네임 입력">
                            <div id="radiobox">
                                <label for="radio1"> 남 </label>
                                <input type="radio" class="radio" id="radio1" name="user_gender" value="M">
                                <label for="radio2"> 여 </label>
                                <input type="radio" class="radio" id="radio2" name="user_gender" value="W">
                            </div>
                            <input type="text" name="user_phone" class="form-control" placeholder="전화번호 입력(-)">
                            <select name="user_genre1" class="user_genre">
                                <option value="" disabled selected hidden>제 1 선호장르 선택</option>
                                <option value="전통행사">전통행사</option>
                                <option value="공연장">공연장</option>
                                <option value="미술관">미술관</option>
                                <option value="박물관">박물관</option>
                            </select>
                            <select name="user_genre2" class="user_genre">
                                <option value="" disabled selected hidden>제 2 선호장르 선택</option>
                                <option value="전통행사">전통행사</option>
                                <option value="공연장">공연장</option>
                                <option value="미술관">미술관</option>
                                <option value="박물관">박물관</option>
                            </select>
                            <div id="btn">
                                <a href="/controller/main.do">
                                    <button id="cancel" type="button" class="btn">취소</button>
                                </a>
                                <button id="end" type="submit" class="btn">회원가입</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
    function fn_submit() {
        var userId = document.getElementsByName("user_id")[0].value.trim();
        var userPw = document.getElementsByName("user_pw")[0].value.trim();
        var userPwck = document.getElementsByName("user_pwck")[0].value.trim();
        var userNick = document.getElementsByName("user_nick")[0].value.trim();
        var userPhone = document.getElementsByName("user_phone")[0].value.trim();
        var userGenre1 = document.getElementsByName("user_genre1")[0].value.trim();
        var userGenre2 = document.getElementsByName("user_genre2")[0].value.trim();
        var userGender = document.querySelector('input[name="user_gender"]:checked');
      
        if (userId === "") {
            alert("아이디를 입력해주세요.");
            document.getElementsByName("user_id")[0].focus();
            return false;
        }
        if (userPw === "") {
            alert("비밀번호를 입력해주세요.");
            document.getElementsByName("user_pw")[0].focus();
            return false;
        }
        if (userPwck === "") {
            alert("비밀번호 확인을 입력해주세요.");
            document.getElementsByName("user_pwck")[0].focus();
            return false;
        }
        if (userPw !== userPwck) {
            alert("비밀번호가 일치하지 않습니다.");
            document.getElementsByName("user_pw")[0].focus();
            return false;
        }
        if (userNick === "") {
            alert("닉네임을 입력해주세요.");
            document.getElementsByName("user_nick")[0].focus();
            return false;
        }
        if (!userGender) {
            alert("성별을 선택해주세요.");
            document.getElementById("radio1").focus();
            return false;
        }
        if (userPhone === "") {
            alert("전화번호를 입력해주세요.");
            document.getElementsByName("user_phone")[0].focus();
            return false;
        }
        if (userGenre1 === "") {
            alert("선호장르1를 선택해주세요.");
            document.getElementsByName("user_genre1")[0].focus();
            return false;
        }
        if (userGenre2 === "") {
            alert("선호장르2를 선택해주세요.");
            document.getElementsByName("user_genre2")[0].focus();
            return false;
        }
        if (userGenre1 === userGenre2) {
            alert("선호장르를 서로 다르게 선택해주세요.");
            document.getElementsByName("user_genre1")[0].focus();
            return false;
        }else{
		    alert("회원가입 완료! "+ userNick + "님 환영합니다.")    	
        	return true;
        }
    }
</script>
</body>
</html>
