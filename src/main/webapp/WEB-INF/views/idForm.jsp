<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <title>아이디 찾기</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet"
        href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script
        src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/controller/resources/css/id.css" />
<link href="/controller/resources/css/font.css" rel="stylesheet" />


    <script>
        // 아이디를 찾은 후에 실행될 함수
        function showIdAndRedirect(id) {
            alert("회원님의 아이디는 " + id + "입니다.");
            window.location.replace("main.do"); 
        }

        function submitForm() {
            var form = document.getElementById("idForm");
            var formData = $(form).serialize();

            $.ajax({
                type: "POST",
                url: "id.do", 
                data: formData,
                success: function(data) {
                    showIdAndRedirect(data);
                },
                error: function(xhr, status, error) {
                    alert("아이디를 찾을 수 없습니다.");
                    console.error("Error: " + error);
                }
            });

            return false;
        }
    </script>   
</head>
<body>
    <div class="main">
        <div id="logo_gcap"></div></a>
        <div class="fnd">
            <h2 class="fndId_h2">아이디 찾기</h2> 
            <div class="fndId">
               
                <form id="idForm" action="id.do" method="post" onsubmit="return submitForm()">
                <div class="inputContent">
                    <input type="text" class="form-control" name="user_nick" placeholder="닉네임을 입력하세요" autofocus>
                    <hr class="hr" />
                    <input type="text" class="form-control" name="user_phone" placeholder="전화번호를 입력하세요">
                    <hr class="hr" />
                </div>


                <div class="btn">
                    
                    <button type="button" class="btnCncl"
                    onclick="window.location.href='loginForm.do'">취소</button>
                      
                    <button type="submit" class="btnFnd">찾기</button>
                </div>
                </form>
            </div>
        </div>

    </div>

    </div>
</body>
</html>