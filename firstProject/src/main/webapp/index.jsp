<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
<title>나비병원</title>
</head>
<body>
    <div class="container">
        <div class="nav">
            <p><a href="#">나비병원</a></p>
            <ul>
                <li><a href="#">견종</a></li>
                <li><a href="#">분양</a></li>
                <li><a href="#">오시는길</a></li>
                <li><a href="#">고객지원</a></li>
            </ul>
            <p><img src="images/login.jpg" alt="로그인이미지"></p>
        </div>
        <div class="header">
            <div class="slideContainer">
                <div class="slideWrap">
                    <div class="slide">
                        <a href="#">
                            <img src="images/animalhospital.jpg" alt="animalhospital01">
                        </a>
                    </div>
                    <div class="slide">
                        <a href="#">
                            <img src="images/animalhospital02.jpg" alt="animalhospital02">
                        </a>
                    </div>
                    <div class="slide">
                        <a href="#">
                            <img src="images/animalhospital03.jpg" alt="animalhospital03">
                        </a>
                    </div>
                    <div class="slide">
                        <a href="#">
                            <img src="images/animalhospital04.jpg" alt="animalhospital04">
                        </a>
                    </div>
                    <div class="slide">
                        <a href="#">
                            <img src="images/animalhospital05.jpg" alt="animalhospital05">
                        </a>
                    </div>
                </div>
           </div>
        </div>
        <div class="main">
            <div class="notice">
            </div>
            <div class="popular">
            </div>
            <div class="hospitalInfo">
            </div>
        </div>
        <div class="footer">
        </div>
    </div>
<script src="vendor/js/jQuery.js"></script>
<script src="js/scripts.js"></script>
</body>
</html>