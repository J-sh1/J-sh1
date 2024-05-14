<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="en">
<head>

<title>운영자 페이지</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

   <link href="https://fonts.googleapis.com/css?family=NanumSquare+Neo+OTF&display=swap" rel="stylesheet" />
   <link href="/controller/resources/css/userlist.css" rel="stylesheet" />
<link href="/controller/resources/css/font.css" rel="stylesheet" />
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script>
$(document).ready(function() {
    // 삭제 버튼 클릭 이벤트 핸들러
    $(document).on('click', '.delete-button', function() {
        var user_id = $(this).closest('tr').find('.user-id').text();
        
        // AJAX를 사용하여 삭제 요청 전송
        $.ajax({
            url: '/userdelete.do', // 삭제할 경우
            type: 'POST',
            data: { user_id: user_id }, // 사용자 ID 전송
            success: function(response) {
                if (response === 'success') {
                    alert('사용자가 성공적으로 삭제되었습니다.');
                    // 성공 처리 로직
                } else {
                    alert('사용자 삭제에 실패했습니다.');
                    // 실패 처리 로직
                }
            },
            error: function(xhr, status, error) {
                console.error('Error: ' + error);
                alert('사용자 삭제에 실패했습니다.');
                // 에러 처리 로직
            }
        });
    });
});
</script>

</head>
<body>

   <jsp:include page="header.jsp"></jsp:include>
   <div class="container">
      <!-- 헤더 include -->
      <br><br>
      <h1 class="h2_admin text-center">관리자 페이지</h1>
      <br><br>
      <div class="panel panel-default">
         <form action="admin.do">
            <table id="userTable" class="table table-transparent">
               <thead>
                  <tr>
                     <th class="text-center">번호</th>
                     <th class="text-center">아이디</th>
                     <th class="text-center">닉네임</th>
                     <th class="text-center">생성일자</th>
                     <th class="text-center">수정</th>
                     <th class="text-center">삭제</th>
                  </tr>
               </thead>
               <tbody id="userListBody">
                  <c:forEach items="${list}" var="vo" varStatus="i">
                     <c:if test="${vo.user_id ne 'admin'}">
                        <tr>
                           <td class="text-center">${i.count}</td>
                           <td class="text-center user-id">${vo.user_id}</td>
                           <td class="text-center">${vo.user_nick}</td>
                           <td class="text-center">${fn:split(vo.joined_at, " ")[0]}</td>
                           <td class="text-center rounded-pill"><button type="button" class="edit-button">수정</button></td>
                           <td class="text-center rounded-pill"><button type="button" class="delete-button" data-user-id="${vo.user_id}">삭제</button></td>
                        </tr>
                     </c:if>
                  </c:forEach>
               </tbody>
            </table>
         </form>
      </div>
   </div>

</body>
</html>
