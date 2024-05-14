<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ page import="java.util.*, java.math.*" %>   
<html lang="english">
<head>
<title>문화여행 정보</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta charset="utf-8" />
<meta property="twitter:card" content="summary_large_image" />
<script src="https://d3js.org/d3.v5.min.js"></script> <!-- d3.js 라이브러리 로드 -->
<style data-tag="reset-style-sheet">
html {
	line-height: 1.15;
}

body {
	margin: 0;
	
}

* {
	
	border-width: 0;
	border-style: solid;
}

p, li, ul, pre, div, h1, h2, h3, h4, h5, h6, figure, blockquote,
	figcaption {
	margin: 0;
	padding: 0;
}

button {
	background-color: transparent;
}

button, input, optgroup, select, textarea {
	font-family: inherit;
	font-size: 100%;
	line-height: 1.15;
	margin: 0;
}

button, select {
	text-transform: none;
}

button, [type="button"], [type="reset"], [type="submit"] {
	-webkit-appearance: button;
}

button::-moz-focus-inner, [type="button"]::-moz-focus-inner, [type="reset"]::-moz-focus-inner,
	[type="submit"]::-moz-focus-inner {
	border-style: none;
	padding: 0;
}

button:-moz-focus, [type="button"]:-moz-focus, [type="reset"]:-moz-focus,
	[type="submit"]:-moz-focus {
	outline: 1px dotted ButtonText;
}

a {
	color: inherit;
	text-decoration: inherit;
}

input {
	padding: 2px 4px;
}

img {
	display: block;
}

html {
	scroll-behavior: smooth
}
</style>
<style data-tag="default-style-sheet">
html {
	font-family: Inter;
	font-size: 16px;
}

body {
	font-weight: 400;
	font-style: normal;
	text-decoration: none;
	text-transform: none;
	letter-spacing: normal;
	line-height: 1.15;
}
</style>
<link rel="stylesheet"
	href="https://unpkg.com/animate.css@4.1.1/animate.css" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&amp;display=swap"
	data-tag="font" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&amp;display=swap"
	data-tag="font" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&amp;display=swap"
	data-tag="font" />
<link rel="stylesheet"
	href="https://unpkg.com/@teleporthq/teleport-custom-scripts/dist/style.css" />
<link rel="stylesheet" href="/controller/resources/css/style.css" />
<link href="/controller/resources/css/graph.css" rel="stylesheet" />
<link href="/controller/resources/css/font.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div>

		<div class="frame2-container">
			<div>
			
				<div class="frame2-elementBox">

					<div class="frame-position-circle">						
						<div class=frame2-gu-CircleGraph></div>
						<div class=frame2-category-CircleGraph></div>
						<div class =frame2-text126>구별 행사 비율</div>
						<div class =frame2-text128>장르별 행사 비율</div>
						</div>

					

					<tr>
						<div class="frame2-radarGraph">
						<%
						    ArrayList<HashMap<String, Double>> placeData = new ArrayList<>(); // HashMap의 리스트 생성
						    String[] placeNames = {"장소1", "장소2", "장소3", "장소4", "장소5"}; // 장소 이름 배열
						    Random rand = new Random(); // 랜덤 객체 생성
						
						    for (String placeName : placeNames) {
						        HashMap<String, Double> placeValues = new HashMap<>(); // 각 장소의 값들을 저장할 HashMap 생성
						        placeValues.put("점자가이드", rand.nextDouble());
						        placeValues.put("오디오가이드", rand.nextDouble());
						        placeValues.put("시설안내책자", rand.nextDouble());
						        placeValues.put("장애인화장실", rand.nextDouble());
						        placeValues.put("휠체어대여", rand.nextDouble());
						        placeValues.put("장애인출입문", rand.nextDouble());
						
						        placeData.add(placeValues); // 리스트에 HashMap 추가
						    }
						%>
							<div id="radarGraph"></div>
							<span class="frame2-text004"><span>배리어프리 요소 확인</span></span>  
							<span class="frame2-text018"><span>없음 : 흰색</span></span>
							<span class="frame2-text020"><span>있음 : 살구색</span></span>
						</div>
					</tr>
					<%-- <tr>
						<div class="frame2-frame2">
							<span class="frame2-text022"><span>
							<select name="hotspot1">
							    <option value="" disabled selected hidden>장소명 1</option>
							    <c:forEach items="${hotspotList}" var="hotspot" >
							        <option value="${hotspot.hotspot_name}">${hotspot.hotspot_name}</option>
							    </c:forEach>
							</select>
							</span></span> 
							<span class="frame2-text024"><span>
							<select name="hotspot2">
							    <option value="" disabled selected hidden>장소명 2</option>
							    <c:forEach items="${hotspotList}" var="hotspot" >
							        <option value="${hotspot.hotspot_name}">${hotspot.hotspot_name}</option>
							    </c:forEach>
							</select>
							</span></span> 
							<span class="frame2-text026"><span>
							<select name="hotspot3">
							    <option value="" disabled selected hidden>장소명 3</option>
							    <c:forEach items="${hotspotList}" var="hotspot" >
							        <option value="${hotspot.hotspot_name}">${hotspot.hotspot_name}</option>
							    </c:forEach>
							</select>
							</span></span> 
							<span class="frame2-text028"><span>
							<select name="hotspot4">
							    <option value="" disabled selected hidden>장소명 4</option>
							    <c:forEach items="${hotspotList}" var="hotspot" >
							        <option value="${hotspot.hotspot_name}">${hotspot.hotspot_name}</option>
							    </c:forEach>
							</select>
							</span></span> 
							<span class="frame2-text030"><span>
							<select name="hotspot5">
							    <option value="" disabled selected hidden>장소명 5</option>
							    <c:forEach items="${hotspotList}" var="hotspot" >
							        <option value="${hotspot.hotspot_name}">${hotspot.hotspot_name}</option>
							    </c:forEach>
							</select>
							</span></span> 
							<span class="frame2-text032"><span><button type="reset">선택 취소</button></span></span> 
							<span class="frame2-text034"><span><button type="submit">분석 시작</button></span></span> 
						</div>
					</tr> --%>
					
					<!-- ============================================================================================================================================ -->
					
					<div class="frame2-frame3">
						<tr>
						<div class="frame2-priceComparisonGraph">
							<div class="priceComparisonGraph"></div>
								<span class="frame2-text036"><span>무료</span></span>
								<span class="frame2-text038"><span>10,000원</span></span> 
								<span class="frame2-text040"><span>20,000원</span></span> 
								<span class="frame2-text042"><span>30,000원</span></span> 
								<span class="frame2-text044"><span>40,000원</span></span>
							</div>
						</tr>
						
					<tr>
						<div class="frame2-frame4">
							<span class="frame2-text056"><span>할인 정보 안내</span></span> 
							<span class="frame2-text058"><span>소년할인 본인만 30% 할인 적용 국가유공자 본인만 20% 할인 적용 장애인 1~3급 동반 1인까지, 4~6급 본인만 20% 할인 적용</span></span> 
							<span class="frame2-text060"><span>*조기예매할인 : R/S석 40% (2022. 10. 9.(일) 까지 예매시 적용) 지역할인(광주광역시) : R/S석 36%</span></span> 
							<span class="frame2-text062"><span>중고등 1000원, 유아 무료, 단체(10인 이상) 1000원</span></span> 
							<span class="frame2-text064"><span>회원 50%할인</span></span> 
							<span class="frame2-text066"><span>GAC 유료회원 무료 예매 가능 통합할인회원, 어린이 청소년, 단체, 장애인 1~6급, 국가유공자, 경로우대 50%할인</span></span> 
							<img alt="Line177945" src="<%=request.getContextPath()%>/resources/board/line177945-ult.svg" class="frame2-line17" /> 
							<img alt="Line113271" src="<%=request.getContextPath()%>/resources/board/line113271-jkpc.svg" class="frame2-line11" />
							<img alt="Line123273" src="<%=request.getContextPath()%>/resources/board/line123273-0ih.svg" class="frame2-line12" /> 
							<img alt="Line143275" src="<%=request.getContextPath()%>/resources/board/line143275-16d6.svg" class="frame2-line14" />
							<img alt="Line163277" src="<%=request.getContextPath()%>/resources/board/line163277-4eyr.svg" class="frame2-line16" />
						</div>
					</tr>
										
					</div> <!-- div class="frame2-elementBox"의 끝 태그 -->
					
						<div class="frame2-group3">
						
						<tr>
							<div class="frame2-frame51">
								<div class="frame2-frame5">
								<div class="reviewBoxplot"></div>
								</div>
							</div>
							<span class="frame2-text085"> <span>장소 평점 비교</span></span>
							
						</tr>
												
					<tr>
						<div class="frame2-frame6">
							<div class="frame2-searchgraph"></div> 
								<span class="frame2-text087"><span>리뷰 갯수 TOP 5</span></span> 
							
						</div>
					</tr>
					</div> <!-- div class="frame2-group3"의 끝 태그 -->
					
					<tr>
					<div class="frame2-frame52">
						<div class="frame2-restaurantBoxplot"></div>						
							<span class="frame2-text124"> <span>식당 평점 TOP 5</span></span>
						</div>
					</tr>
			
		</div>
	</div>
	</div>
	<script>
var gu_width = 600,
gu_height = 600,
gu_radius = Math.min(gu_width, gu_height) / 2;

var gu_color = d3.scaleOrdinal()
.range(["rgb(255, 190, 152)", "rgb(194, 145, 117)", "rgb(133, 100, 81)", "rgb(71, 55, 46)", "rgb(30,30,30)"]);

var gu_arc = d3.arc()
.outerRadius(gu_radius - 10)
.innerRadius(0);

var gu_labelArc = d3.arc()
.outerRadius(gu_radius - 40)
.innerRadius(gu_radius - 40);

var gu_pie = d3.pie()
.sort(null)
.value(function(d) { return d.population; });

var gu_svg = d3.select(".frame2-gu-CircleGraph").append("svg")
.attr("width", gu_width+100)
.attr("height", gu_height)
.append("g")
.attr("transform", "translate(" + gu_width / 2 + "," + gu_height / 2 + ")");

var gu_data = [
{age: "동구", population: 16},
{age: "서구", population: 15},
{age: "남구", population: 27},
{age: "북구", population: 23},
{age: "광산구", population: 19}
];

// 데이터의 총합을 계산해서 비율을 계산할 수 있게 해줬어.
var totalPopulation = d3.sum(gu_data, function(d) { return d.population; });

var gu_g = gu_svg.selectAll(".arc")
  .data(gu_pie(gu_data))
.enter().append("g")
  .attr("class", "arc");

gu_g.append("path")
  .attr("d", gu_arc)
  .style("fill", function(d) { return gu_color(d.data.age); })
.attr('stroke', 'black')
.style('stroke-width', '2px')
.style('opacity', '0.7');

gu_g.append("text")
  .attr("transform", function(d) { return "translate(" + gu_labelArc.centroid(d) + ")"; })
  .attr("dy", ".35em")
  // 텍스트에 비율을 추가했어. 
  .text(function(d) { 
    var percentage = ((d.data.population / totalPopulation) * 100).toFixed(0);
    return d.data.age + ": " + percentage + "%"; 
})
.style("text-anchor", "middle")
.style("font-size", 15)
.style('font-weight', 'bold') 
.style('fill', 'rgb(84, 19, 15)');
</script>
	
<script>
var genre_width = 600,
genre_height = 600,
genre_radius = Math.min(genre_width, genre_height) / 2;

var genre_color = d3.scaleOrdinal()
.range(["rgb(255, 190, 152)", "rgb(194, 145, 117)", "rgb(133, 100, 81)", "rgb(71, 55, 46)"]);

var genre_arc = d3.arc()
.outerRadius(genre_radius - 10)
.innerRadius(0);

var genre_labelArc = d3.arc()
.outerRadius(genre_radius - 40)
.innerRadius(genre_radius - 40);

var genre_pie = d3.pie()
.sort(null)
.value(function(d) { return d.population; });

var genre_svg = d3.select(".frame2-category-CircleGraph").append("svg")
.attr("width", genre_width+100)
.attr("height", genre_height)
.append("g")
.attr("transform", "translate(" + genre_width / 2 + "," + genre_height / 2 + ")");

var genre_data = [
{age: "미술관", population: 43},
{age: "공연장", population: 27},
{age: "박물관", population: 22},
{age: "전통행사", population: 9}
];

// 데이터의 총합을 계산해서 비율을 계산할 수 있게 해줬어.
var totalPopulation = d3.sum(genre_data, function(d) { return d.population; });

var genre_g = genre_svg.selectAll(".arc")
  .data(genre_pie(genre_data))
.enter().append("g")
  .attr("class", "arc");

genre_g.append("path")
  .attr("d", genre_arc)
  .style("fill", function(d) { return genre_color(d.data.age); })
.attr('stroke', 'black')
.style('stroke-width', '2px')
.style('opacity', '0.7');

genre_g.append("text")
  .attr("transform", function(d) { return "translate(" + genre_labelArc.centroid(d) + ")"; })
  .attr("dy", ".35em")
  // 텍스트에 비율을 추가했어. 
  .text(function(d) { 
    var percentage = ((d.data.population / totalPopulation) * 100).toFixed(0);
    return d.data.age + ": " + percentage + "%"; 
})
.style("text-anchor", "middle")
.style("font-size", 15)
.style('font-weight', 'bold') 
.style('fill', 'rgb(84, 19, 15)');
       </script>	
	<script>
	var hm_data = [
		  { 전시장: '광산문화예술회관', 점자가이드: 1, 오디오가이드: 1, 시설안내책자: 0, 장애인화장실: 1, 휠체어대여: 0, 장애인출입문: 1 },
		  { 전시장: '국윤미술관', 점자가이드: 0, 오디오가이드: 1, 시설안내책자: 1, 장애인화장실: 0, 휠체어대여: 1, 장애인출입문: 1 },
		  { 전시장: '서구문화센터', 점자가이드: 1, 오디오가이드: 0, 시설안내책자: 1, 장애인화장실: 0, 휠체어대여: 0, 장애인출입문: 0 },
		  { 전시장: '신세계갤러리', 점자가이드: 1, 오디오가이드: 1, 시설안내책자: 1, 장애인화장실: 1, 휠체어대여: 0, 장애인출입문: 1 },
		  { 전시장: '국립아시아문화전당', 점자가이드: 0, 오디오가이드: 1, 시설안내책자: 0, 장애인화장실: 1, 휠체어대여: 1, 장애인출입문: 0 }
		];

		var hm_margin = { top: 30, right: 30, bottom: 30, left: 150 },
		hm_width = 750;
		hm_height = 800;

		var svg = d3.select('.frame2-radarGraph').append('svg')
		.attr('width', hm_width + hm_margin.left + hm_margin.right)
		.attr('height', hm_height + hm_margin.top + hm_margin.bottom)
		.append('g')
		.attr('transform', 'translate(' + hm_margin.left + ',' + hm_margin.top + ')');

		var hm_x = d3.scaleBand()
		.range([0,hm_width])
		.domain(hm_data.map(function(d) { return d.전시장; }));

		var hm_y = d3.scaleBand()
		.range([hm_height - hm_margin.bottom,0]) // y축 범위 설정 수정
		.domain(Object.keys(hm_data[0]).slice(1));

	svg.append('g')
	    .attr('transform', 'translate(0, 0)') // x축 위치 설정 수정
	    .call(d3.axisTop(hm_x)) // axisBottom을 axisTop으로 변경
	    .selectAll(".tick text")  
	    .style("font-size", "20px")
	    .style("font-family", "'NanumSquare Neo OTF'")
	    .style("fill", "rgba(84, 19, 15, 1)");

	svg.append('g')
	    .call(d3.axisLeft(hm_y))
	    .selectAll(".tick text")  
	    .style("font-size", "20px")
	    .style("font-family", "'NanumSquare Neo OTF'")
	    .style("fill", "rgba(84, 19, 15, 1)")
	    .style("text-anchor", "left");

	var color = d3.scaleLinear()
	    .domain([0,1])
	    .range(['white','rgb(255,190,152)']);

	hm_data.forEach(function(row) {
	  Object.keys(row).slice(1).forEach(function(col) {
	    row[col] = Math.round(Math.random());
	    svg.append('rect')
	      .attr('x', hm_x(row.전시장))
	      .attr('y', hm_y(col))
	      .attr('width', hm_x.bandwidth())
	      .attr('height', hm_y.bandwidth())
	      .attr('fill', color(row[col]))
	      .attr('stroke', 'black') // 세로선 추가
	      .attr('stroke-width', '1'); // 세로선 굵기 설정
	      
	  });
	});
	</script>
	<script>
	const placeData = <%=placeData%>;  // 장소1부터 장소5까지의 각 가이드 요소에 대한 랜덤 값 설정

	const axes = Object.keys(placeData[0].values); // 가이드 요소 목록 추출
	const color = d3.scaleOrdinal(d3.schemeCategory10); // 색상 스케일 설정 (10가지 색상으로 구성된 스케일)

	// 차트 크기 설정
	const width = 800; // 너비
	const height = 800; // 높이
	const radius = 0.8 * (Math.min(width, height) / 2); // 반지름

	// svg 영역 설정 및 위치 조정
	const radarSvg = d3.select('.frame2-radarGraph').append('svg') // 'frame2-radarGraph' 클래스를 가진 요소에 svg 요소 추가
    	.attr('width', width) // svg 너비 설정
    	.attr('height', height) // svg 높이 설정
    	.append('g') // svg 내부에 g 요소 추가
    	.attr('transform', `translate(${478 + width / 2}, ${470 + height / 2})`); // g 요소 이동 (차트 중심으로)

    // 각도 슬라이스 계산 (전체 원에서의 각 가이드 요소의 비율)
	const angleSlice = Math.PI * 2 / axes.length;

	axes.forEach((d, i) => {
	    const line = radarSvg.append('line') // 선 요소 추가
	        .attr('x1', 0) // 선 시작 x 좌표
	        .attr('y1', 0) // 선 시작 y 좌표
	        .attr('x2', 0) // 선 끝 x 좌표 
	        .attr('y2', -radius) // 선 끝 y 좌표 (원의 반지름만큼 위로)
	        .attr('transform', `rotate(${angleSlice * i * (180 / Math.PI)})`) // 선 요소를 각도만큼 회전시킴 (i번째 축에 해당하는 각도)
	        .style('stroke', 'gray') // 선 색상 설정 
	        .style('stroke-width', '1px'); // 선 너비 설정
	});
	// 레이더 차트의 영역(면적) 정의
	const area = d3.areaRadial()
	    .angle((d, i) => i * angleSlice) // 각도 설정 (인덱스에 따른 angleSlice 계산)
	    .innerRadius(0) // 내부 반지름 (중심에서 시작)
	    .outerRadius(d => radius * d); // 외부 반지름 (데이터 값에 따른 반지름)

	// 각 장소 데이터에 대해 처리
	placeData.forEach((d, i) => {
    let values = Object.values(d.values);
    values.push(values[0]);

    const path = radarSvg.append('path')
        .datum(values)
        .attr('d', area)
        .style('fill', color(i))
        .style('fill-opacity', 0.5)
        .style('stroke', 'black')
        .style('stroke-width', '2px');
});

	</script>
	<!-- 점자가이드, 오디오가이드, 시설안내책자, 장애인화장실, 휠체어대여, 장애인출입문 레이더차트 끝 -->
	
	
	
	<!-- 가격비교 그래프 시작 -->
	<script>
	const data = [  // 데이터 세트 생성. 시설 이름과 가격이 포함된 객체 배열
	    { facility: '광산문화예술회관', price: Math.floor(Math.random() * 40001) },
	    { facility: '국윤미술관', price: Math.floor(Math.random() * 40001) },
	    { facility: '서구문화센터', price: Math.floor(Math.random() * 40001) },
	    { facility: '신세계갤러리', price: Math.floor(Math.random() * 40001) },
	    { facility: '국립아시아문화전당', price: Math.floor(Math.random() * 40001) },
	];

	const svgGraph = d3.select('.frame2-priceComparisonGraph').append('svg').attr('width', 1500).attr('height', 460), // SVG 캔버스 생성, 너비와 높이 설정
	margin = {top: 20, right: 20, bottom: 30, left: 240}, // 그래프의 여백 설정
	priceGraphWidth = +svgGraph.attr('width') - margin.left - margin.right, // 그래프의 실제 너비 계산 (캔버스 너비 - 여백)
	priceGraphHeight = +svgGraph.attr('height') - margin.top - margin.bottom; // 그래프의 실제 높이 계산 (캔버스 높이 - 여백)

	const x = d3.scaleBand() // X축 스케일 설정. 범주형 데이터를 위한 스케일
		.domain(data.map(function(d) { return d.facility; })) // 도메인 설정. 데이터의 'facility' 값을 사용
		.range([0, priceGraphWidth]) // 출력 범위 설정. 그래프의 너비로 설정
		.paddingInner(0.1) // 막대 사이의 패딩 설정 
		.paddingOuter(0.5); // 막대와 축 사이의 패딩 설정

	const y = d3.scaleLinear() // Y축 스케일 설정. 연속적인 데이터를 위한 스케일 
		.domain([0, d3.max(data, function(d) { return d.price; })]) // 도메인 설정. 데이터의 'price' 값 중 최대값을 사용
		.range([priceGraphHeight, 0]); // 출력 범위 설정. 그래프의 높이로 설정

	const g = svgGraph.append('g') // SVG 요소 내에 'g' 요소 추가. 이 요소가 그래프를 포함
		.attr('transform', 'translate(' + margin.left + ',' + margin.top + ')'); // 'g' 요소를 여백만큼 이동
		x.domain(data.map(function(d) { return d.facility; })); // X축 도메인 설정. 데이터의 'facility' 값을 사용
		y.domain([0, d3.max(data, function(d) { return d.price; })]); // Y축 도메인 설정. 데이터의 'price' 값 중 최대값을 사용

	g.append("g") // 'g' 요소 내에 새로운 'g' 요소 추가. 이 요소가 y축을 포함
    	.attr("class", "y axis") // 클래스 이름 설정
    	.call(d3.axisLeft(y).tickSizeOuter(0).ticks(0)); // y축 그리기. 외부 틱 크기는 0, 틱 개수는 0으로 설정

	g.append('g') // 'g' 요소 내에 새로운 'g' 요소 추가. 이 요소가 x축을 포함
    	.attr('class', 'axis axis--x') // 클래스 이름 설정
    	.attr('transform', 'translate(0,' + priceGraphHeight + ')') // x축을 그래프 높이만큼 밑으로 이동
    	.call(d3.axisBottom(x)) // x축 그리기
    	.selectAll("text")	
        .style("text-anchor", "middle")  // 텍스트 앵커를 'middle'로 설정. 텍스트가 해당 위치의 중간에 오도록
        .style("font-size", "25px") // 폰트 크기 설정
        .style("fill", "rgb(84,19,15)") // 텍스트 색상 설정
        .style("font-weight", "bold"); // 폰트 두께 설정

	const colorScale = d3.scaleLinear() // 색상 스케일 설정. 연속적인 데이터를 위한 스케일 
    	.domain([0, data.length -1]) // 도메인 설정. 데이터의 인덱스 값을 사용
    	.range(["rgb(255,188,146)", "black"]); // 출력 범위 설정. 갈색에서 검정까지

	g.selectAll('.bar') // 'g' 요소 내의 '.bar' 클래스를 가진 모든 요소 선택
    	.data(data) // 데이터 바인딩
    	.enter().append('rect') // 데이터 개수만큼 'rect' 요소 생성 (막대)
    	.attr('class', 'bar') // 클래스 이름 설정
    	.attr('x', function(d) { return x(d.facility); }) // 막대의 x 좌표 설정. 시설 이름에 대한 스케일 값 사용
    	.attr('y', function(d) { return y(d.price); }) // 막대의 y 좌표 설정. 가격에 대한 스케일 값 사용 
    	.attr('width', x.bandwidth()) // 막대의 너비 설정. x 스케일의 bandwidth (막대 크기) 사용
    	.attr('height', function(d) { return priceGraphHeight - y(d.price); }) // 막대의 높이 설정. 그래프 높이에서 y 스케일 값 빼기
    	.style("fill", function(d, i){ return colorScale(i); }); // 막대 채우기 색상 설정. 인덱스에 대한 색상 스케일 값 사용
</script>	    
<!-- 가격 비교 그래프 끝 -->



<!-- 시설 평점 비교 박스플롯 시작 -->
<script>
//박스플롯 데이터 설정
var boxplotData = [
		{name: "광산문화예술회관", values: Array.from({length: 50}, () => Math.random() * 5)},
	{name: "국윤미술관", values: Array.from({length: 50}, () => Math.random() * 5)},
	{name: "서구문화센터", values: Array.from({length: 50}, () => Math.random() * 5)},
	{name: "신세계갤러리", values: Array.from({length: 50}, () => Math.random() * 5)},
	{name: "국립아시아문화전당", values: Array.from({length: 50}, () => Math.random() * 5)}
];

// 마진, 너비, 높이 설정
var margin_bp = {top: 10, right: 30, bottom: 70, left: 40}; // 박스플롯 그래프의 마진을 설정
boxplotWidth = 1400 - margin_bp.left - margin_bp.right; // 가로 길이 계산
boxplotHeight = 480 - margin_bp.top - margin_bp.bottom; // 세로 길이 계산

// svg 영역 설정
var boxplotSvg = d3.select(".reviewBoxplot") // 'reviewBoxplot' 클래스를 가진 요소를 선택
    .append("svg") // 선택된 요소에 svg 요소를 추가
    .attr("width", boxplotWidth + margin_bp.left + margin_bp.right) // svg의 너비를 설정. 그래프의 너비와 마진을 더한 값이 전체 너비가 됨.
    .attr("height", boxplotHeight + margin_bp.top + margin_bp.bottom) // svg의 높이를 설정. 그래프의 높이와 마진을 더한 값이 전체 높이가 됨.
    .append("g") // svg 요소 내에 g 요소를 추가
    .attr("transform", "translate(" + (margin_bp.left+200) + "," + margin_bp.top + ")"); // g 요소를 이동시켜 그래프의 위치를 조절

// x축 스케일 설정
var x_bp = d3.scaleBand() // 밴드 스케일을 생성. 밴드 스케일은 범주형 데이터에 사용되며, 도메인의 각 값을 범위의 특정 구간에 매핑 
    .range([0, boxplotWidth]) // 출력 범위를 0에서 그래프의 너비로 설정
    .domain(boxplotData.map(function(d) { return d.name; })) // 입력 도메인을 설정. boxplotData의 각 요소에서 name 속성을 가져와 배열로 만듬.
    .padding(0.05); // 밴드 사이에 공간(패딩)을 설정. 0.05는 밴드 너비의 5%에 해당하는 공간이 패딩으로 들어감.

// y축 스케일 설정
var y_bp = d3.scaleLinear() // 선형 스케일을 생성. 선형 스케일은 연속적인 숫자 데이터에 사용되며, 도메인의 값들을 범위의 값들로 선형적으로 변환
    .domain([0,5]) // 입력 도메인을 0에서 5로 설정
    .range([boxplotHeight, 0]); // 출력 범위를 그래프의 높이에서 0으로 설정. D3.js에서는 y축의 방향이 아래쪽이기 때문에 범위를 반대로 설정


// y축 그리기
boxplotSvg.append("g")
    .attr("transform", "translate(-200,0)") // g 요소를 이동시켜 y축의 위치를 조절
    .call(d3.axisLeft(y_bp)) // y 축을 그림
    .selectAll("text") // y 축에 있는 모든 'text' 요소를 선택
    .style("font-size", "20px") // y 축 레이블의 글꼴 크기를 설정
    .style("fill", "rgb(84,19,15)") // y 축 레이블의 색상을 설정
    .style("font-weight", "bold"); // y 축 레이블의 글꼴 굵기를 설정

// 박스 넓이 설정
var boxWidth = 150 

// 박스플롯 그래프 그리기
boxplotData.forEach(function(datum, i){
    var q1 = d3.quantile(datum.values.sort(d3.ascending),.25) // 데이터의 1사분위수를 계산
    var median = d3.quantile(datum.values.sort(d3.ascending),.5) // 데이터의 중앙값(2사분위수)를 계산
    var q3 = d3.quantile(datum.values.sort(d3.ascending),.75) // 데이터의 3사분위수를 계산
    var interQuantileRange = q3 - q1 // 사분위범위(3사분위수 - 1사분위수)를 계산
    var min = 0 // 최소값 설정
    var max = 5 // 최대값 설정

    // 박스의 처음과 끝 색상 설정
    var t = i / (boxplotData.length-1); // 여기서 t는 현재 박스의 위치를 전체 박스 수로 나눈 값으로, 전체 범위에서 현재 박스의 상대적 위치를 나타내며, 이를 통해 색상 보간에 사용됨.
    var boxColor = d3.interpolateRgb('rgb(255,190,152)', 'rgb(10,10,10)')(t); // 'rgb(255,190,152)'에서 'rgb(10,10,10)'까지의 색상을 박스 색상으로 설정. 


// 박스플롯 그리기
boxplotSvg.append("line")
    .attr("x1", x_bp(datum.name) ) // 세로선의 시작점 x좌표 설정
    .attr("x2", x_bp(datum.name) ) // 세로선의 끝점 x좌표 설정
    .attr("y1", y_bp(min) ) // 세로선의 시작점 y좌표 설정
    .attr("y2", y_bp(max) ) // 세로선의 끝점 y좌표 설정
    .attr("stroke", "black") // 세로선 색상 설정

// 박스(사분위 범위를 나타내는 직사각형) 그리기
boxplotSvg.append('rect')
    .attr('x', x_bp(datum.name) - boxWidth/2) // 박스의 x 좌표 설정
    .attr('y', y_bp(q3)) // 박스의 y좌표 설정
    .attr('height', (y_bp(q1)-y_bp(q3)) ) // 박스의 높이 설정
    .attr('width', boxWidth) // 박스의 너비 설정
    .attr('stroke', 'black') // 박스의 테두리 색 설정
    .style("fill", boxColor) // 박스의 속 색 설정

// 중앙값(메디안)을 나타내는 가로선 그리기
boxplotSvg.append('line')
    .attr('x1', x_bp(datum.name)-boxWidth/2) // 가로선의 시작점 x좌표 설정
    .attr('y1', y_bp(median)) // 가로선의 시작점 y좌표 설정
    .attr('x2', x_bp(datum.name)+boxWidth/2) // 가로선의 끝점 x좌표 설정
    .attr('y2', y_bp(median)) // 가로선의 끝점 y좌표 설정
    .attr('stroke', 'black') // 가로선의 색상 설정

// x축의 라벨
boxplotSvg.append('text')
    .attr('x', x_bp(datum.name))  // x 위치를 박스 중간으로 설정
    .attr('y', boxplotHeight + margin_bp.bottom/2)  // y 위치를 whisker 아래로 설정
    .style('text-anchor', 'middle')  // 텍스트를 중앙 정렬
    .style('font-size', '20px')  // 글씨 크기 20px로 설정
    .style('font-weight', 'bold')  // 글씨 굵기 bold로 설정
    .style('fill', 'rgb(84, 19, 15)')  // 글씨 색상 설정
    .text(datum.name);  // 시설 이름 출력
});
</script>
<!-- 시설 평점 비교 박스플롯 끝 -->
	
	
	
<!-- 리뷰 갯수 비교 그래프 시작 -->
<script>
// '시설1', '시설2', '시설3', '시설4', '시설5'라는 이름의 시설들을 배열로 선언
const facilities = ['광산문화예술회관', '국윤미술관', '서구문화센터', '신세계갤러리', '국립아시아문화전당'];
//각 시설에 대한 임의의 데이터(리뷰 수) 생성, facility와 price를 속성으로 가진 객체로 구성된 배열을 생성
const data_rv = facilities.map(facility => ({ facility, price: Math.random() * 50 }));

// svg 요소를 선택하고, 그래프의 너비와 높이를 설정
const svgReviewGraph = d3.select('.frame2-searchgraph').append('svg').attr('width', 1500).attr('height', 400);
// 그래프의 여백 설정
const margin_rv = {top: 20, right: 43, bottom: 30, left: 200};
// 그래프의 실제 너비와 높이 계산
const reviewGraphWidth = +svgReviewGraph.attr('width') - margin_rv.left - margin_rv.right;
const reviewGraphHeight = +svgReviewGraph.attr('height') - margin_rv.top - margin_rv.bottom;

// y축 스케일 설정. 시설 이름으로 막대가 구분되므로 범주형 스케일인 scaleBand를 사용
const y_rv = d3.scaleBand()
	// 입력 도메인 설정
    .domain(data_rv.map(function(d) { return d.facility; }))
    // 출력 범위 설정
    .range([0, reviewGraphHeight])
    // 막대 사이의 간격 설정
    .paddingInner(0.1)
    // 막대 외부의 간격 설정
    .paddingOuter(0.5);

// x축 스케일 설정. 리뷰 수가 연속적인 값이므로 선형 스케일인 scaleLinear를 사용
const x_rv = d3.scaleLinear()
	// 입력 도메인 설정
    .domain([0, d3.max(data_rv, function(d) { return d.price; })])
    // 출력 범위 설정
    .range([0, reviewGraphWidth]);

// g 요소를 추가하고, 그래프가 그려질 영역을 설정
const g_rv = svgReviewGraph.append('g')
    .attr('transform', 'translate(' + margin_rv.left + ',' + margin_rv.top + ')');
    
// y축을 그리고, 텍스트 스타일 설정
g_rv.append("g")			
    .attr("class", "y axis")
    .call(d3.axisLeft(y_rv).tickSizeOuter(0))
    .selectAll("text")
    .style('font-size', '20px')  // 글씨 크기 20px로 설정
    .style('font-weight', 'bold')  // 글씨 굵기 bold로 설정
    .style('fill', 'rgb(84, 19, 15)');  // 글씨 색상 설정

g_rv.append('g')
    .attr('class', 'axis axis--x')
    .attr('transform', 'translate(0,' + reviewGraphHeight + ')')
    .call(d3.axisBottom(x_rv))
	.selectAll("text")	
        .style("text-anchor", "middle")
		.style("font-size", "20px") // x축의 텍스트 크기를 20px로 설정
		.style("fill", "rgb(84,19,15)") // x축의 글씨 색깔을 rgb(84, 19, 15)로 설정
		.style("font-weight", "bold"); // x축의 글씨를 굵게 설정

const colorScale_rv = d3.scaleLinear()
	.domain([0, data_rv.length -1])
	.range(["black", "rgb(255,188,146)"]); // 데이터에 따라서 막대그래프의 색상을 검정색에서 rgb(255,188,146)으로 변하게 설정

g_rv.selectAll('.bar')
    .data(data_rv)
    .enter().append('rect')
    .attr('class', 'bar')
    .attr('y', function(d) { return y_rv(d.facility); })
    .attr('height', y_rv.bandwidth())
	.attr('width', function(d) { return x_rv(d.price); }) // 각 막대의 너비를 price 데이터에 따라 설정
	.style("fill", function(d, i){ return colorScale_rv(i); }); // 각 막대의 색상을 위에서 정의한 colorScale_rv에 따라 설정
</script>
<!-- 리뷰 갯수 비교 그래프 시작 -->



<!-- 식당 평점 비교 박스플롯 시작 -->
<script>
//박스플롯 데이터 설정
var rbpData = [
		{name: "부억간", values: Array.from({length: 50}, () => Math.random() * 5)},
	{name: "에꼬또", values: Array.from({length: 50}, () => Math.random() * 5)},
	{name: "크램드밀", values: Array.from({length: 50}, () => Math.random() * 5)},
	{name: "꽃마름", values: Array.from({length: 50}, () => Math.random() * 5)},
	{name: "영빈관", values: Array.from({length: 50}, () => Math.random() * 5)}
];

// 마진, 너비, 높이 설정
var margin_rbp = {top: 10, right: 30, bottom: 70, left: 40};
rbpWidth = 1400 - margin_rbp.left - margin_rbp.right;
rbpHeight = 480 - margin_rbp.top - margin_rbp.bottom;

// svg 영역 설정
var rbpSvg = d3.select(".frame2-restaurantBoxplot")
    .append("svg")
    .attr("width", rbpWidth + margin_rbp.left + margin_rbp.right)// svg 너비를 2배로 조정
    .attr("height", rbpHeight + margin_rbp.top + margin_rbp.bottom)
    .append("g")
    .attr("transform", "translate(" + (margin_rbp.left+200) + "," + margin_rbp.top + ")");

// x축 스케일 설정
var x_rbp = d3.scaleBand()
    .range([0, rbpWidth])
    .domain(rbpData.map(function(d) { return d.name; }))
    .padding(0.05);

// y축 스케일 설정
var y_rbp = d3.scaleLinear()
    .domain([0,5])
    .range([rbpHeight, 0]);

// y축 그리기
rbpSvg.append("g")
	.attr("transform", "translate(-200,0)") // x 좌표를 -100으로 변경
	.call(d3.axisLeft(y_rbp))
	.selectAll("text")  
    .style("font-size", "20px")
	.style("fill", "rgb(84,19,15)")
	.style("font-weight", "bold");

// 박스 넓이 설정
var rbpWidth = 150

// 박스플롯 그래프 그리기
rbpData.forEach(function(datum, i){
	var rbp_Q1 = d3.quantile(datum.values.sort(d3.ascending),.25)
	var rbp_Median = d3.quantile(datum.values.sort(d3.ascending),.5)
	var rbp_Q3 = d3.quantile(datum.values.sort(d3.ascending),.75)
	var rbp_InterQuantileRange = rbp_Q3 - rbp_Q1
	var rbp_min = 0
	var rbp_max = 5

// 박스의 처음과 끝 색상 설정
var t = i / (rbpData.length-1);
var rbp_BoxColor = d3.interpolateRgb('rgb(255,190,152)', 'rgb(10,10,10)')(t);

// 박스플롯 그리기
rbpSvg.append("line")
    .attr("x1", x_rbp(datum.name) ) // 세로선의 시작점 x좌표 설정
    .attr("x2", x_rbp(datum.name) ) // 세로선의 끝점 x좌표 설정
    .attr("y1", y_rbp(rbp_min) ) // 세로선의 시작점 y좌표 설정
    .attr("y2", y_rbp(rbp_max) ) // 세로선의 끝점 y좌표 설정
    .attr("stroke", "black") // 세로선 색상 설정

// 박스(사분위 범위를 나타내는 직사각형) 그리기
rbpSvg.append('rect')
    .attr('x', x_rbp(datum.name) - rbpWidth/2) // 박스의 x 좌표 설정
    .attr('y', y_rbp(rbp_Q3)) // 박스의 y좌표 설정
    .attr('height', (y_rbp(rbp_Q1)-y_rbp(rbp_Q3)) ) // 박스의 높이 설정
    .attr('width', rbpWidth) // 박스의 너비 설정
    .attr('stroke', 'black') // 박스의 테두리 색 설정
    .style("fill", rbp_BoxColor) // 박스의 속 색 설정

// 중앙값(메디안)을 나타내는 가로선 그리기
rbpSvg.append('line')
    .attr('x1', x_rbp(datum.name)-rbpWidth/2) // 가로선의 시작점 x좌표 설정
    .attr('y1', y_rbp(rbp_Median)) // 가로선의 시작점 y좌표 설정
    .attr('x2', x_rbp(datum.name)+rbpWidth/2) // 가로선의 끝점 x좌표 설정
    .attr('y2', y_rbp(rbp_Median)) // 가로선의 끝점 y좌표 설정
    .attr('stroke', 'black') // 가로선의 색상 설정

// x축의 라벨
rbpSvg.append('text')
    .attr('x', x_rbp(datum.name))  // x 위치를 박스 중간으로 설정
    .attr('y', rbpHeight + margin_rbp.bottom/2)  // y 위치를 whisker 아래로 설정
    .style('text-anchor', 'middle')  // 텍스트를 중앙 정렬
    .style('font-size', '20px')  // 글씨 크기 20px로 설정
    .style('font-weight', 'bold')  // 글씨 굵기 bold로 설정
    .style('fill', 'rgb(84, 19, 15)')  // 글씨 색상 설정
    .text(datum.name);  // 시설 이름 출력
});
</script>
<!-- 식당 평점 비교 박스플롯 끝 -->




</body>
</html>