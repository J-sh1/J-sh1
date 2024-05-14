<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/controller/resources/css/wfstyle.css">
<link href="/controller/resources/css/font.css" rel="stylesheet" /> 
<title>Insert title here</title>
  
</head>
<body>
<button id="showPopup">3시간 단위 예보</button>

<div class="popup" id="popup">
<button class="close-popup">X</button> <!-- 닫기 버튼 추가 -->
    <!-- Weather forecast table will be generated here -->
    <table id="weatherTable">
    <tr>
        <th>날짜 및 시간</th>
        <th>기온 (°C)</th>
        <th>체감 온도 (°C)</th>
        <th>날씨</th>
        <th>강수량 (mm)</th>
    </tr>
</table>
</div>
<script>   
 
   /* 날씨 3시간 예보*/
   
   function translateWeather(weather) {
	    if (weatherTranslations.hasOwnProperty(weather)) {
	        return weatherTranslations[weather];
	    } else {
	        return weather;
	    }
	}
   //3시간 단위 예보      
   $.getJSON('https://api.openweathermap.org/data/2.5/forecast?lat=35.1547&lon=126.9156&appid=1a4f3bb84a44024e23147d3651dfcfbb', function(weatherData) {
	    var table = document.getElementById("weatherTable");

	    for (let i = 0; i < weatherData.list.length; i++) {
	        const weatherInfo = weatherData.list[i];

	        var row = table.insertRow(-1);
	        var dateCell = row.insertCell(0);
	        var tempCell = row.insertCell(1);
	        var feelsLikeCell = row.insertCell(2);
	        var weatherCell = row.insertCell(3);
	        var rainfallCell = row.insertCell(4);

	        if (weatherInfo.rain && typeof weatherInfo.rain["3h"] !== 'undefined') {
	            rainfallCell.innerHTML = weatherInfo.rain["3h"];
	        } else {
	            rainfallCell.innerHTML = "0";
	        }

	        dateCell.innerHTML = weatherInfo.dt_txt;
	        tempCell.innerHTML = Math.floor(weatherInfo.main.temp - 273);
	        feelsLikeCell.innerHTML = Math.floor(weatherInfo.main.feels_like - 273);
	        weatherCell.innerHTML = translateWeather(weatherInfo.weather[0].description);
	    }
	});

   
   
  


   $(document).ready(function(){
	    $("#popup").hide(); // 페이지 로드 시 팝업 숨김

	    $("#showPopup").click(function(){
	        $("#popup").toggle(); // 버튼 클릭 시 팝업 토글
	    });
	});

   $('.close-popup').click(function() {
       $('#popup').hide();
   });
      

</script>    
</body>
</html>