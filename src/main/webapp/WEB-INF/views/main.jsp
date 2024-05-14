<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="/controller/resources/css/main.css" rel="stylesheet" />
<link href="/controller/resources/css/font.css" rel="stylesheet" />
<title>메인페이지</title>
</head>
<body>

   <div class="background_color">
   <jsp:include page="header.jsp"></jsp:include>
     
      <div class="map_api">
      	<jsp:include page="naverMap2.jsp"></jsp:include>
      </div>
      <div class="side_bar1">
         <div class="side_bar2"></div>
         
         <div class="name2"></div>
                 
         <tr>
         <span class="weather_place">
         <span> <jsp:include page="weatherForecast3.jsp"></jsp:include></span>
         <jsp:include page="weathernow.jsp"></jsp:include></span> <span
            class="weather_timeline"> </span>
             <span
            class="news_bar"><jsp:include page="/CrawlingInfo.do"></jsp:include></span>
         </tr>
            
         <tr>
         <div class="course_suggestion">
            <div class="course_suggestion_box"></div>
            <button class="course_suggestion_text">여행 경로 추천</button>
         </div>
         </tr>
         
         <tr>
         <div>
         
           </div>
         </tr>
              
         
		               
		</div>
         
      </div>
   </div>
</body>
</html>