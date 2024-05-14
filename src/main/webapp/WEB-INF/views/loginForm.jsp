<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="/controller/resources/css/login.css" rel="stylesheet" />
<link href="/controller/resources/css/font.css" rel="stylesheet" />
<!-- -->
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
            <header class="main"> </header>

            <a href="/controller/main.do"><div id="logo_gcap"></div></a>
         
            <!-- Form -->
            <form name="frm" method="post" action="login.do" id="form_join"
               onsubmit="return loginck();">
               <div class="panel panel-default">
                  <div class="panel-body">
                     <div class="outer-frame">
                        <div class="inner-frame">
                           <table class="table table-bordered table-hover">
                              <tr>
                                 <td colspan="3" align="center"><input type="text"
                                    name="user_id" class="form-control" autofocus
                                    placeholder="아이디 입력"
                                    style="border-bottom: 1px solid #FFBE98;"></td>
                              </tr>
                              <tr>
                                 <td colspan="3" align="center"><input type="password"
                                    name="user_pw" class="form-control" placeholder="비밀번호 입력"
                                    style="border-bottom: 1px solid #FFBE98;"></td>
                              </tr>
                              <tr>
                                 <td colspan="3" align="center">
                                    <button id="login_btn" type="submit" class="btn btn-hover">로그인</button>
                                 </td>
                              </tr>
                              <tr>
                                 <td colspan="3" align="center">
                                    <button type="button" id="join_btn" class="btn btn-hover"
                                       onclick="window.location.href='joinForm.do'">회원가입</button>
                                   <button type="button" id="id_find_btn" class="btn btn-hover"
                                       onclick="window.location.href='idForm.do'">         </button>
                                    <button type="button" id="pw_find_btn" class="btn btn-hover"
                                       onclick="window.location.href='pwForm.do'">비밀번호 찾기</button>

                                 </td>
                              </tr>
                           </table>
                        </div>
                     </div>
                  </div>
               </div>
            </form>

         </div>
      </div>
   </div>


   <!-- Scripts -->
   <script src="assets/js/jquery.min.js"></script>
   <script src="assets/js/browser.min.js"></script>
   <script src="assets/js/breakpoints.min.js"></script>
   <script src="assets/js/util.js"></script>
   <script src="assets/js/main.js"></script>

   <script>
      function loginck() {
         var userId = document.getElementsByName("user_id")[0].value.trim();
         var userPw = document.getElementsByName("user_pw")[0].value.trim();

         if (userId === "" || userPw === "") {
            alert("아이디 또는 비밀번호를 입력해주세요.");
            return false;
         } else {
            return true;
         }
      }
   </script>
   <script>
      // 로그인 실패 시 에러 메시지가 있다면 알림창 표시
      var isError = '<c:if test="${not empty param.error}">true</c:if>';
      if (isError === 'true') {
         alert("아이디 또는 비밀번호를 잘못 입력했습니다.");
      }
   </script>
   
   <script>
      window.onresize = function() {
         window.onresize = function() {
            var widthRatio = window.innerWidth / 1920;
            var newRadius = 70 * widthRatio;
            var boxHeight = window.innerHeight * 0.781; // 844/1080
            var borderWidth = 2 * widthRatio; // 기존에 설정한 테두리 굵기인 2px에 비율을 곱해줌

            var box = document.querySelector(".panel-body");
            box.style.borderTopLeftRadius = newRadius + "px";
            box.style.borderTopRightRadius = newRadius + "px";
            box.style.borderBottomRightRadius = newRadius + "px";
            box.style.height = boxHeight + 'px';
            box.style.borderWidth = borderWidth + 'px'; // 새로 계산한 테두리 굵기를 적용
         }
      }

      /* 입력 필드의 너비를 가져옴 */
      var inputWidth = document.querySelector('input[name="user_id"]').offsetWidth;

      /* 로그인 버튼의 너비를 입력 필드의 너비와 동일하게 설정 */
      document.getElementById('login_btn').style.width = inputWidth + 'px';
   </script>

</body>
</html>