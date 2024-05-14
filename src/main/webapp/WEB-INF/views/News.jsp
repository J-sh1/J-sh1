<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="/controller/resources/css/font.css" rel="stylesheet" />
    <title>뉴스 리스트</title>
 <style>
    body {
        background-color: #FFD8B8; /* Adjust this color to match the exact background color of your website */
        font-family: Arial, sans-serif;
    }

    .news-table {
        width: 100%; /* Adjust width as necessary */
        height:150%;
        max-width: 400px; /* Adjust max-width as necessary */
        margin: 0 auto;
        border-collapse: collapse;
        table-layout: fixed; /* Fixed table layout helps with wrapping */
        color: black; 
        border-radius: 10px;
        
    }

    .news-table th,
    .news-table td {
       border: 1px solid #FFA07A;
    padding: 8px;
    text-align: left;
    background-color: #FFE5D1;
    color: #333;
    

    /* 줄 간격을 조절합니다. */
    line-height: 1.5;

    /* 'nowrap' 속성을 'normal'로 바꿔서 텍스트가 줄바꿈되게 합니다. */
    white-space: normal;

    /* 'ellipsis' 속성을 'clip'으로 바꿔서 텍스트가 넘칠 때 잘리게 합니다. */
    text-overflow: clip;

    /* 높이를 'auto'로 설정하여 셀의 내용에 따라 높이가 조절되도록 합니다. */
    height: auto;

        
        
    }

    .news-table th {
        background-color: #FFCBA4; /* Header background, can be adjusted */
    }

    .news-table a {
        color: #FF4500; /* Link color, can be adjusted */
        text-decoration: none;
        
    }

    .news-table a:hover {
        text-decoration: underline;
    }

    @media screen and (max-width: 400px) {
        /* When the screen size is less than 760px, adjust the layout */
        .news-table, .news-table thead, .news-table tbody, .news-table th, .news-table td, .news-table tr {
            display: block;
        }

        .news-table th {
            display: none; /* Hide table headers */
        }

        .news-table td {
          border: 1px solid #FFA07A;
    padding: 8px;
    text-align: left;
    background-color: #FFE5D1;
    color: #333;

    /* 줄 간격을 조절합니다. */
    line-height: 1.5;

    /* 'nowrap' 속성을 'normal'로 바꿔서 텍스트가 줄바꿈되게 합니다. */
    white-space: normal;

    /* 'ellipsis' 속성을 'clip'으로 바꿔서 텍스트가 넘칠 때 잘리게 합니다. */
    text-overflow: clip;

    /* 높이를 'auto'로 설정하여 셀의 내용에 따라 높이가 조절되도록 합니다. */
    height: auto;

    /* 브라우저가 지원하는 경우 'min-height'를 사용하여 최소 높이를 지정할 수 있습니다. */
    min-height: 50px; /* 원하는 최소 높이 값으로 조정하세요. */
            
        }

        .news-table td:before {
            /* Label for small screen */
            content: attr(data-title);
            position: absolute;
            left: 10px;
            top: 6px;
            font-weight: bold;
            text-align: left;
        }
        
        
        
        
    }
</style>


</head>
<body>
    <h2>광주 문화 소식</h2>
    <table class="news-table">
        <thead>
            <tr>
                <th>뉴스 이름</th>
                <th>뉴스 내용</th>
                
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${newsList}" var="news">
                <tr>
        <td><a href="${news.news_path}" class="news-link">${news.news_name}</a></td>
        <td class="news-content"><a href="${news.news_path}" class="news-link">${news.news_content}</a></td>
    </tr>
             
            </c:forEach>
            
        </tbody>
    </table>
  
  
    
    
</body>
</html>
