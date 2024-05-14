<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/controller/resources/css/font.css" rel="stylesheet" />
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<title>Insert title here</title>
   <style>
    .weather-info {
    max-height: 100px; /* 최대 높이 설정 */
    overflow-y: auto; /* 세로 스크롤 활성화 */
    margin-bottom: 10px; /* 하단 여백 추가 */
}

  
.weather-info::-webkit-scrollbar {
    width: 10px;
    background-color: #F5F5F5; /* 스크롤바 배경색 */
}

.weather-info::-webkit-scrollbar-thumb {
    background-color: #FFD1AA; /* 스크롤바 썸(움직이는 부분) 색상 */
    border-radius: 10px;
    border: 2px solid #F5F5F5; /* 썸의 경계선 색 (스크롤바 배경색과 같게) */
}

.weather-info::-webkit-scrollbar-track {
    background-color: #F5F5F5; /* 스크롤바 트랙(배경) 색상 */
    border-radius: 0px;
    box-shadow: inset 0 0 6px rgba(0,0,0,0.3); /* 트랙 내부에 그림자 효과 */
}


    </style>
</head>
<body>
     <div class='weather-info'>
	
	<h3 class="cweather">
      날씨: 
	</h3>
	<h3 class="time" ></h3>
   <h3 class="ctemp" >현재 온도:</h3>
   <h3 class="ftemp">체감 온도:</h3>
   <h3 class="crain" >강수량:</h3>
   <h3 class="cwind" >풍속:</h3>
   <h3 class="ccloud" >구름량:</h3>
  </div>
   

   
<script>   
 
//현재 날씨 예보                             
   $.getJSON('https://api.openweathermap.org/data/2.5/weather?lat=35.1547&lon=126.9156&appid=1a4f3bb84a44024e23147d3651dfcfbb&units=metric',function(result){
	   $('.ctemp').append(result.main.temp+"°C");
	   $('.cwind').append(result.wind.speed + "m/s");
	   $('.ftemp').append(result.main.feels_like+"°C");
	   $('.ccloud').append(result.clouds.all+"%");
	   // 날씨 데이터의 지역 이름을 한국어로 번역합니다.
	    var translatedName = translateLocationName(result.name);
	    // 번역된 지역 이름을 출력합니다.
	    $('.cweather').prepend(translatedName);

	   // Check if "rain" property exists
	    if (result.rain && result.rain["1h"]) {
	        var rainVolume = result.rain["1h"];
	        $('.crain').append(rainVolume + "mm");
	    } else {
	        $('.crain').append("0");
	    }
 
	    var weatherIcon = getWeatherIcon(result.weather[0].main); // 날씨에 따른 아이콘 이미지 URL 가져오기
	    $('.cweather').append('<img src="' + weatherIcon + '">'); // 아이콘 이미지 출력
	    $('.forecast').prepend(translatedName);
	   
	   var ct=result.dt
	   function convertTime(ct){
		   var ot=new Date(ct*1000);
		   var hr=ot.getHours();  
		   var m=ot.getMinutes();  
		   var s=ot.getSeconds(); 
		   return hr+'시'+m+'분'+s+'초 기준';
	   }
       
	   var currentTime=convertTime(ct);
	  $('.time').append(currentTime);
   });
   </script>
  
  
  
   <script>
  

  
   function getWeatherIcon(weatherDescription) {
	    // 날씨에 따라 해당하는 아이콘 이미지 URL을 반환하는 함수
	    switch (weatherDescription) {
	        case 'Clear':
	            return 'http://openweathermap.org/img/wn/01d.png'; // 맑음 아이콘
	        case 'Clouds':
	            return 'http://openweathermap.org/img/wn/03d.png'; // 구름 아이콘
	        case 'Rain':
	            return 'http://openweathermap.org/img/wn/09d.png'; // 비 아이콘
	        // 필요한 경우 다른 날씨에 대한 아이콘 이미지 URL을 추가할 수 있습니다.
	        default:
	            return 'http://openweathermap.org/img/wn/01d.png'; // 기본 아이콘
	    }
	}
     
   
   
   var weatherTranslations = {
		    "thunderstorm": "천둥 번개",
		    "drizzle": "이슬비",
		    "rain": "비",
		    "snow": "눈",
		    "mist": "안개",
		    "smoke": "연기",
		    "haze": "연무",
		    "dust": "먼지",
		    "fog": "안개",
		    "sand": "모래",
		    "ash": "화산재",
		    "squall": "돌풍",
		    "tornado": "토네이도",
		    "clear": "맑음",
		    "clouds": "구름",
		    "drizzle and rain": "이슬비와 비",
		    "shower rain": "소나기",
		    "light rain": "약한 비",
		    "moderate rain": "중간 비",
		    "very heavy rain": "매우 강한 비",
		    "extreme rain": "극심한 비",
		    "freezing rain": "동결 비",
		    "light snow": "약한 눈",
		    "snow": "눈",
		    "heavy snow": "폭설",
		    "sleet": "진눈깨비",
		    "shower snow": "소나기 눈",
		    "light rain and snow": "약한 비와 눈",
		    "rain and snow": "비와 눈",
		    "light shower snow": "가벼운 소나기 눈",
		    "shower sleet": "소나기 진눈깨비",
		    "light snow shower": "가벼운 눈 소나기",
		    "heavy snow shower": "강한 눈 소나기",
		    "haze": "연무",
		    "fog": "안개",
		    "sand/dust whirls": "모래/먼지 회오리",
		    "tornado": "토네이도",
		    "clear sky": "맑은 하늘",
		    "few clouds": "구름이 거의 없는 하늘",
		    "scattered clouds": "흩어진 구름",
		    "broken clouds": "부서진 구름",
		    "overcast clouds": "흐린 하늘"
		};
   
// 영어에서 한국어로 지역 이름을 번역하는 함수
   function translateLocationName(locationName) {
       var translations = {
           "Seoul": "서울",
           "Busan": "부산",
           "Incheon": "인천",
           "Gwangju":"광주광역시",
           "Hampyeong:":"함평",
           "Hampyeongsaengtaegongwon":"함평 생태공원",
           "Suwon-si":"수원시",
           "Namhyang-dong":"수원시",
           // 여기에 다른 지역 이름을 추가할 수 있습니다.
       };

       // 만약 해당하는 번역이 있으면 번역된 지역 이름을 반환합니다.
       // 그렇지 않으면 원래의 지역 이름을 반환합니다.
       return translations[locationName] || locationName;
   }

   
   
      

</script>    
</body>
</html>