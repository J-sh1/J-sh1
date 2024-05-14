<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Navigation Bar</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="/controller/resources/css/header.css" rel="stylesheet" />
<link href="/controller/resources/css/font.css" rel="stylesheet" />
<style>
body {
	margin: 0;
	padding: 0;
}

.nav-item {
	list-style: none;
}

a {
	text-decoration: none;
}
a:hover {
    text-decoration: none;
}
</style>
</head>
<body>
	<nav class="navbar">
		<div class="top_bar1">
			<a href="/controller/">
				<div class="logo"></div>
			</a>
			<div class="top_bar2"></div>
			<li class="nav-item"><a class="tour_course" href="main.do">문화여행
					코스</a></li>
			<li class="nav-item"><a class="tour_info" href="graph.do">문화여행 정보</a></li>

			<c:choose>
				
				<c:when test="${empty info}">
					<li class="nav-item"><a class="myPage" href="loginForm.do"
						onclick="redirectToLogin()">마이페이지</a></li>
					<li class="nav-item"><a class="login" href="loginForm.do">로그인</a></li>
				</c:when>
				
				<c:when test="${info.user_id eq 'admin'}">
					<li class="nav-item"><a class="myPage" href="userlist.do">회원관리</a></li>
					<li class="nav-item"><a class="login" href="logout.do">로그아웃</a></li>
				</c:when>
				
				<c:otherwise>
					<li class="nav-item"><a class="myPage" href="mypage.do">마이페이지</a></li>
					<li class="nav-item"><a class="login" href="logout.do">로그아웃</a></li>
				</c:otherwise>
			</c:choose>

		</div>
	</nav>
	<script>
		function redirectToLogin() {
			alert("로그인이 필요합니다.");
		}
	</script>
</body>
</html>
