 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
   href="https://fonts.googleapis.com/css?family=NanumSquare+Neo+OTF&display=swap"
   rel="stylesheet" />
   <link rel="stylesheet" href="/controller/resources/css/review.css" />
<link href="/controller/resources/css/font.css" rel="stylesheet" />
   <!-- /controller/resources/css/review.css -->
<title>리뷰 상세보기</title>

</head>
<body>
<!-- <%
   pageContext.setAttribute("ln", "\n" );
%> -->


    <div clas="main_box">
   <table>
   <form action="reviewInsert.do" method="post">
   <input type="hidden" name="user_id" value="${info.user_id}">
      
   <tbody id="view">  

      <tr>
         <td colspan="6" >


<c:forEach items="${hot}" var="hotspot">
    
         
         <div class="place_pic" id="result">
            <img src="${hotspot.hotspot_image}" >
         </div>
        </td>
       
         <input type="hidden" name="trad_idx" value="${hotspot.hotspot_idx}">
        
        <Td colspan="6" >
         <h1 class="place_name"> ${hotspot.hotspot_name} </h1>
         <br>
         <span class="place_deepInfo">${hotspot.program_content}</span>
        </Td>

    
            <td rowspan="2" colspan="4">
             <button class="outButton_button" type="button" onclick="window.close();">나가기</button>
           
            </td>
            <!-- <hr class="line1"> -->
      <!-- tr1  이미지, 장소인포, 나가기 버튼  -->
    
    
    
            
           

      </tr>
  
      
</c:forEach>
      <tr>


      
         <div class = "rating_system">
               <td colspan="5">
                  <div class="star-rating">
                     <input type="radio" class = "fiveStars" id="5-stars" name="review_likes" value="5" /></input>
                        <label for="5-stars" class="star5">&#9733;</label> 
                     <input type="radio" class = "fourStars" id="4-stars" name="review_likes" value="4" /></input>
                        <label for="4-stars" class="star4">&#9733;</label> 
                     <input type="radio" class ="threeStars" id="3-stars" name="review_likes" value="3" /></input>
                        <label for="3-stars" class="star3">&#9733;</label>
                     <input type="radio" class="twoStars" id="2-stars" name="review_likes" value="2" /></input>
                        <label for="2-stars" class="star2">&#9733;</label> 
                     <input type="radio" class="oneStars" id="1-star" name="review_likes" value="1" /></input>
                        <label for="1-star" class="star1">&#9733;</label>
                  </div>
               </td>
       </div>
      
      
         


         <td colspan="6">
            <input  type="text" class="form-control" id="reviewID" name="review_content" maxlength="500" placeholder="리뷰를 입력해주세요.">
            </td>
         
       <!-- <hr class="line2"> -->
 
       <td>

        <button class="submit_button" type="submit" onclick="return checkUserId()">등록</button>
       </td>
        
        
     
       </tr> 
    
       <!-- tr2 별점 textarea  -->

      <div class="review_data"> 








        <c:forEach items="${reviewList}" var="review" varStatus="i">

      <tr>



        <td colspan="5">
        
      
   
    
      
      
     
   
         <span class="idx">번호 : ${i.count}</span>
        
         
        
            <br>
        <span class="reviewWriter">작성자 : ${review.user_id}</span>
        <br>
        <span class="writeDay">작성일 : ${fn:split(review.created_at," ")[0]} </span>
           
        <br>
    <span class="review_ratio">별점 : ${review.review_likes} </span>
    <br>
    </td>
     
      <td colspan="6">

        <span >${fn:replace(review.review_content, ln, '<br>')}</span>

      </td>
     




      </tr>
    </c:forEach>





      <!-- tr3 나머지 DB값  -->
    </div>    
   </tbody>
   </form>
      
      
   </table>
    </div>

 <script>
        function checkUserId() {
            var userId = "${info.user_id}";
            var reviewContent = document.getElementsByName("review_content")[0].value.trim();
            if (userId === '') {
                alert('로그인 후 이용 가능합니다.');
                window.location.href = "/controller/loginForm.do"; // 로그인 페이지로 이동
               return false;
            } if (reviewContent === '') {
               alert('댓글을 작성해주세요.');
               document.getElementsByName("review_content")[0].focus();
               return false;
            } else{
               return true;
            }
        }
    </script>

</body>

</html>