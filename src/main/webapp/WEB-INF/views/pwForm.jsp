<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>비밀번호 찾기</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


    <link rel="stylesheet" href="/controller/resources/css/pw.css">
    <link href="/controller/resources/css/font.css" rel="stylesheet" />
</head>
<body>
    <!-- 비밀번호 찾기 페이지 -->
    <div class="container">
        <div class="panel panel-default">
            <div class="panel-body">
                <!-- JavaScript를 사용하여 랜덤 문자열 생성 -->
                <script>
                    // 랜덤 문자열 생성 함수
                    function generateRandomString(length) {
                        var result = '';
                        var characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'; // 사용할 문자들

                        for (var i = 0; i < length; i++) {
                            var randomIndex = Math.floor(Math.random()
                                    * characters.length);
                            result += characters.charAt(randomIndex);
                        }

                        return result;
                    }

                    // 폼 제출을 감지하고 랜덤 비밀번호를 생성하여 처리
                    $(document).ready(function() {
                        $('form').submit(function(event) {
                            // 폼의 기본 동작 방지
                            event.preventDefault();
                            
                            // 랜덤 비밀번호 생성
                            var randomString = generateRandomString(8);
                            
                            // AJAX를 사용하여 비밀번호를 처리
                            $.ajax({
                                type: 'POST',
                                url: 'pw.do',
                                data: {
                                    user_pw: randomString,
                                    user_id: $('input[name="user_id"]').val(),
                                    user_nick: $('input[name="user_nick"]').val(),
                                    user_phone: $('input[name="user_phone"]').val()
                                },
                                success: function() {
                                    // 성공적으로 처리된 후에 경고창 표시
                                    alert('비밀번호가 성공적으로 변경되었습니다: ' + randomString);
                                    
                                    // 페이지 이동
                                    window.location.href = '/controller/main.do';
                                },
                                
                            });
                        });
                    });
                </script>
            </div>
          
            <form>
                <div class="main">
                <div class="main_box">  
                  
                     <h1 class="fndPw_h2"> 비밀번호 찾기  </h1>
                   
                <table>
                   
             
                      <div class="inputContent">
                    <tr>
                        
                        <td colspan="2">
                            <input type="text" name="user_id" class="form-control text-center"
                                placeholder="아이디를 입력하세요" autofocus>
                                <hr class="hr"/>
                        </td>
                    </tr>
                    <tr>
                        
                        <td colspan="2">
                            <input type="text" name="user_nick" class="form-control text-center"
                                placeholder="닉네임 입력하세요" autofocus>
                                <hr class="hr"/>
                            </td>
                    </tr>
                    <tr>
                        
                        <td colspan="2">
                            <input type="text" name="user_phone" class="form-control text-center"
                                placeholder="전화번호를 입력하세요(-)">
                                <hr class="hr"/>
                        </td>
                    </tr>


                    </div>
                    <tr>
                        <div class="btn">
                        <td   align="center">
                            <a href="/controller/loginForm.do"><button type="button" class="btnFnd"> 취소</button></a>
                        </td>
                        <td   align="center" >
                            <button type="submit" class="btnCncl">찾기</button>
                        </td>

                        </div>
                     </tr>
                    </table>
                 </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>