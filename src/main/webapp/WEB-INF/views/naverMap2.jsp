<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>간단한 지도 표시하기</title>
    <script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ryu9swhgch"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
     <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/controller/resources/css/naverMapStyle.css">
    <link href="/controller/resources/css/font.css" rel="stylesheet" />
</head>
<body>
<div id="map"></div>
<div id="list"></div>


<script>
var mapOptions = {
	    center: new naver.maps.LatLng(35.16000, 126.8515), // 광주광역시의 위도, 경도
	    zoom: 13, // 초기 확대 레벨
	    minZoom: 12, // 최소 확대 레벨
	    maxZoom: 16 // 최대 확대 레벨
	};

	var map = new naver.maps.Map('map', mapOptions);

	// 광주광역시 주변의 허용 범위 설정 (예시값, 실제 필요에 맞게 조정 필요)
	var allowedBounds = new naver.maps.LatLngBounds(
	    new naver.maps.LatLng(35.0, 126.6), // 남서쪽 경계
	    new naver.maps.LatLng(35.35, 127.0)  // 북동쪽 경계
	);

	// 지도의 bounds_changed 이벤트 리스너 추가
	naver.maps.Event.addListener(map, 'bounds_changed', function(bounds) {
	    if (!allowedBounds.hasLatLng(map.getCenter())) {
	        // 지도 중심이 허용 범위를 벗어난 경우, 지도 중심을 다시 광주광역시로 설정
	        map.setCenter(new naver.maps.LatLng(35.16000, 126.8515));
	    }
	});



var markers = [];

$.getJSON('/controller/getHotspotInfo.do', function(data) {
    // 프로그램 일정으로 데이터 정렬
    data.sort(function(a, b) {
        return new Date(a.program_schedule) - new Date(b.program_schedule);
    });

    data.forEach(function(hotspot, index) {
        var marker = new naver.maps.Marker({
            position: new naver.maps.LatLng(hotspot.lat, hotspot.lng),
            map: map
        });
        markers.push(marker);

        // 리스트 아이템 추가
        $('#list').append('<div class="list-item" data-index="' + index + '">' +
                '<h4 class="text-ellipsis">' + hotspot.hotspot_name + '</h4>' + // 프로그램 이름에 text-ellipsis 클래스 적용
                '<p class="text-ellipsis">프로그램명: ' + hotspot.program_name + '</p>' + // 일정에 text-ellipsis 클래스 적용
                '<p class="text-ellipsis">일정: ' + hotspot.program_schedule + '</p>' + // 일정에 text-ellipsis 클래스 적용
                '<p class="text-ellipsis">내용: ' + hotspot.program_content + '</p>' + // 프로그램 컨텐츠에 text-ellipsis 클래스 적용
                '<p class="text-ellipsis">비용: ' + hotspot.admission_fee + '</p>' + // 프로그램 컨텐츠에 text-ellipsis 클래스 적용
                '</div>');
    });

    // 리스트 아이템 클릭 이벤트
    $('.list-item').on('click', function() {
        var index = $(this).data('index');
        var marker = markers[index];
        map.setCenter(marker.getPosition());
        new naver.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:10px;"><b>' + data[index].hotspot_name + '</b></div>'
        }).open(map, marker);
    });
});



$.getJSON('/controller/getHotspotInfo.do', function(data) {
    var markersAndInfos = {};
    
    

    data.forEach(function(hotspot) {
        var posKey = hotspot.lat + ',' + hotspot.lng;

        if (!markersAndInfos[posKey]) {
            markersAndInfos[posKey] = {
                marker: new naver.maps.Marker({
                    position: new naver.maps.LatLng(hotspot.lat, hotspot.lng),
                    map: map
                }),
                infos: [],
                currentIndex: 0
            };

            naver.maps.Event.addListener(markersAndInfos[posKey].marker, 'click', function() {
                updateContent(posKey);
            });
        }

        markersAndInfos[posKey].infos.push(hotspot);
    });

    window.changeInfo = function(posKey, direction) {
        var group = markersAndInfos[posKey];
        var infosLength = group.infos.length;
        group.currentIndex = (group.currentIndex + direction + infosLength) % infosLength;
        updateContent(posKey);
    };

    function updateContent(posKey) {
        var group = markersAndInfos[posKey];
        var hotspot = group.infos[group.currentIndex];

        var contentString = '<div class="infowindow">' +
                            '<div class="close-btn">X</div>' +
                            '<h3>' + hotspot.hotspot_name + '</h3>' +
                            '<div><strong>구분:</strong> ' + translateType(hotspot.hotspot_type) + '</div>' +
                            '<div class="scroll-info"><strong>주소:</strong> ' + hotspot.hotspot_addr + '</div>' +
                            '<div class="scroll-info"><strong>프로그램 제목:</strong> ' + hotspot.program_name + '</div>'+
                            '<div class="scroll-info"><strong>프로그램 정보:</strong> ' + hotspot.program_content + '</div>'+
                            '<div class="scroll-info"><strong>프로그램 일정:</strong> ' + hotspot.program_schedule + '</div>'+
                            '<div class="scroll-info"><strong>입장료:</strong> ' + hotspot.admission_fee + '</div>'+
                            // 현재 페이지와 총 페이지 수 표시
                            '<div>' + (group.currentIndex + 1) + '/' + group.infos.length + '</div>' +
                            '<button onclick="changeInfo(\'' + posKey + '\', -1)">이전</button>' +
                            '<button onclick="changeInfo(\'' + posKey + '\', 1)">다음</button>' +
                            '<button onclick="window.open(\'http://localhost:8080/controller/reviewForm.do?idx='+hotspot.hotspot_idx+'\', \'_blank\')">리뷰보기</button>' +
                            '</div>';
                         // '정보 없음'이 아니고, 비어 있지 않은 값만 추가
                            if (hotspot.discount_info && hotspot.discount_info.trim() !== '정보없음') {
                            	 '<div class="discount-info" style="max-width: 100px; white-space: nowrap; ">' +
                                 '<strong>할인정보:</strong> ' + hotspot.discount_info +
                                 '</div>';
                            }
                            // '상세보기' 탭과 관련 정보를 감출 div 추가
                            contentString += '<div class="details-toggle">상세보기>></div>';
                            contentString += '<div class="details-content" style="display:none;">'; // 기본적으로 숨겨진 상태
                            contentString += '<div><strong>점자가이드:</strong> ' + hotspot.braille_guide + '</div>';
                            contentString += '<div><strong>소리안내:</strong> ' + hotspot.audio_guide + '</div>';
                            contentString += '<div><strong>장애인화장실:</strong> ' + hotspot.disabled_toilet + '</div>';
                            contentString += '<div><strong>휠체어대여정보:</strong> ' + hotspot.wheelchair_rental + '</div>';
                            contentString += '<div><strong>장애인출입문정보:</strong> ' + hotspot.disabled_access_door + '</div>';
                            contentString += '</div>'; // 상세 정보 div 종료
                            // 이미지 정보가 있는 경우에만 추가
                            if (hotspot.hotspot_image && hotspot.hotspot_image.trim() !== '') {
    contentString += '<div class="infowindow-image">' +
                     '<a href="' + hotspot.hotspot_image + '" target="_blank">' + // 이미지 링크 추가
                     '<img src="' + hotspot.hotspot_image + '" alt="Hotspot Image" style="cursor:pointer;" />' + // 커서 스타일 추가
                     '</a>' +
                     '</div>';
}


        var infoWindow = new naver.maps.InfoWindow({
            content: contentString
            
        });
     // InfoWindow를 열기 전에 짧은 지연 시간을 둡니다.
        setTimeout(function() {
            infoWindow.open(map, group.marker);

            // 상세보기 및 닫기 버튼에 대한 이벤트 핸들러를 설정합니다.
            $('.details-toggle').off('click').on('click', function() {
                $(this).next('.details-content').toggle();
            });

            $('.close-btn').off('click').on('click', function() {
                infoWindow.close();
            });
        }, 100); // 100ms 지연 시간
    }
});

function translateType(type) {
    var typeTranslations = {
        'A': '예술,미술관',
        'P': '공연장',
        'T': '전통,예술',
        'M': '박물관'
    };
    return typeTranslations[type] || type; // 해당하는 번역이 없다면 기본값으로 type 반환
}

</script>



</script>
</body>
</html>