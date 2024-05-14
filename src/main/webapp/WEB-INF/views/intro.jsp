<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Aerial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>G-CAP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/controller/resources/css/intro.css" />
		
	</head>
	<body class="is-preload">
		<div id="wrapper">
			<div id="bg"></div>
			<div id="overlay"></div>
			<div id="main">

				<!-- Header -->
					<header id="header">
						<img class='logo' src="/controller/resources/board/g_capLogo.png">
						<h1>cultural excrusion</h1>
						<p>문화 &nbsp;&bull;&nbsp; 예술 &nbsp;&bull;&nbsp; 체험</p>
						
					</header>
					<script>

						document.getElementById('main').addEventListener('click',()=>{

							window.location.href="/controller/main.do"


						})


					</script>
			

			</div>
		</div>
		<script>
			window.onload = function() { document.body.classList.remove('is-preload'); }
			window.ontouchmove = function() { return false; }
			window.onorientationchange = function() { document.body.scrollTop = 0; }
		</script>
	</body>
</html>