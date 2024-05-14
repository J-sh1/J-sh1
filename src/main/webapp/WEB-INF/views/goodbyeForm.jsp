<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <link href="https://fonts.googleapis.com/css?family=NanumSquare+Neo+OTF&display=swap" rel="stylesheet" />
    <link href="/controller/resources/css/goodbye.css" rel="stylesheet" />
    <title>회원탈퇴</title>
    
    <link href="/controller/resources/css/font.css" rel="stylesheet" />
</head>
<body>
    <div class="v81_2">
        <span class="v81_8">회원 탈퇴</span>
        <div class="v81_3">
            <form action="goodbye.do" method="post" onsubmit="return confirmWithdrawal();">
                <table class="v81_6">
                    <tr>
                        <td><input type="text" id="id_edt" class="form-control" name="user_id" value="${sessionScope.info.user_id}" readonly></td>
                    </tr>
                    <tr>
                        <td><input type="password" class="form-control" name="user_pw" placeholder="비밀번호를 입력하세요"></td>
                    </tr>
                    <tr>
                        <td><input type="text" class="form-control" name="user_phone" placeholder="전화번호를 입력하세요"></td>
                    </tr>
                </table>
                <span class="v81_7">탈퇴하면 개인정보와 맞춤 서비스 데이터가 삭제됩니다.</span>
                <span class="v81_9">삭제하시겠습니까?</span>
                <div class="v81_20">
                    <div class="v81_21">
                        <button type="button" class="btn_cancel" onclick="window.location.href='/controller/mypage.do'">취소</button>
                        <button type="submit" class="btn_unregist">탈퇴</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

<script>
    function confirmWithdrawal() {
        var userId = document.getElementById("id_edt").value.trim();
        var userPw = document.getElementsByName("user_pw")[0].value.trim();
        var userPhone = document.getElementsByName("user_phone")[0].value.trim();
        var storedUserPw = "${sessionScope.info.user_pw}";
        var storedUserPhone = "${sessionScope.info.user_phone}";

        if (userId === "" || userPw === "" || userPhone === "") {
            alert("비밀번호 또는 전화번호를 입력해주세요.");
            return false;
        }

        if (userPw !== storedUserPw || userPhone !== storedUserPhone) {
            alert("입력한 비밀번호 또는 전화번호가 일치하지 않습니다.");
            return false;
        } else {
            var confirmWithdrawal = confirm("회원 탈퇴를 진행하시겠습니까?");
            if (confirmWithdrawal) {
                alert("회원탈퇴 완료");
                window.location.href = '/logout.do';
                return true;
            } else {
                return false;
            }
        }
    }
	
   
</script>
</body>
</html>
