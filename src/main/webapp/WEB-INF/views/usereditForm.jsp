<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<link href="https://fonts.googleapis.com/css?family=NanumSquare+Neo+OTF&display=swap" rel="stylesheet" />
<link href="/controller/resources/css/useredit.css" rel="stylesheet" />
<link href="/controller/resources/css/font.css" rel="stylesheet" />
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="v81_2">
    <span class="v81_8">회원 정보 수정</span>
    <div class="v81_3">
        <form action="useredit.do" method="post">
            <table class="v81_6">
                <tr>
                    <td class="form-name">아이디</td>
                    <td><input type="text" id="id_edt" class="form-control" name="user_id" value="${info.user_id}" readonly></td>
                </tr>
                <tr>
                    <td class="form-name">최초가입일시</td>
                    <td><input type="text" class="form-control" name="joined_at" value="${fn:split(info.joined_at," ")[0]}" readonly></td>
                </tr>
                <tr>
                    <td class="form-name">닉네임</td>
                    <td><input type="text" class="form-control" name="user_nick" value="${info.user_nick}" autofocus></td>
                </tr>
                <tr>
                    <td class="form-name">비밀번호 변경</td>
                    <td><input type="password" class="form-control" name="user_pw"></td>
                </tr>
                <tr>
                    <td class="form-name">비밀번호 확인</td>
                    <td><input type="password" class="form-control" name="user_pwck"></td>
                </tr>
            </table>
            <span class="v81_7">비밀번호 변경시 로그아웃됩니다</span>
            <div class="v81_21">
                <button class="btn_cancel" type="button" onclick="window.location.href='/controller/mypage.do'">취소</button>
                <button class="btn_save" type="submit" onclick="return fn_submit()">저장</button>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript">
    function fn_submit() {
        var userPw = document.getElementsByName("user_pw")[0].value.trim();
        var userPwck = document.getElementsByName("user_pwck")[0].value.trim();
        var userNick = document.getElementsByName("user_nick")[0].value.trim();
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
        } else {
            alert("수정완료")
            return true;
        }
    }
</script>
</body>
</html>
