<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
    <script src="<c:url value="/webjars/jquery/3.0.0/jquery.min.js"/>"></script>
    <script src="<c:url value="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"/>"></script>
    <link href="<c:url value="/webjars/bootstrap/4.3.1/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://cloud.typography.com/746852/739588/css/fonts.css">
    <style type="text/css">
        html,
        body {
            margin: 0;
            padding: 0;
            height: 100%;
        }

        body {
            font-family: "Whitney SSm A", "Whitney SSm B", "Helvetica Neue", Helvetica, Arial, Sans-Serif;
            background-color: #2D72D9;
            color: #fff;
            -moz-font-smoothing: antialiased;
            -webkit-font-smoothing: antialiased;
        }

        .error-container {
            text-align: center;
            height: 100%;
        }

        @media (max-width: 480px) {
            .error-container {
                position: relative;
                top: 50%;
                height: initial;
                -webkit-transform: translateY(-50%);
                -ms-transform: translateY(-50%);
                transform: translateY(-50%);
            }
        }

        .error-container h1 {
            margin: 0;
            font-size: 100px!important;
            font-weight: 300;
        }

        @media (min-width: 480px) {
            .error-container h1 {
                position: relative;
                top: 50%;
                -webkit-transform: translateY(-50%);
                -ms-transform: translateY(-50%);
                transform: translateY(-50%);
            }
        }

        @media (min-width: 768px) {
            .error-container h1 {
                font-size: 220px;
            }
        }

        .return {
            color: rgba(255, 255, 255, 0.6);
            font-weight: 400;
            letter-spacing: -0.04em;
            margin: 0;
        }

        @media (min-width: 480px) {
            .return {
                position: absolute;
                width: 100%;
                bottom: 30px;
            }
        }
        .return p{
            display: block;
            width: 100%;
            margin-top: 2%;
            margin-bottom: 2%;
        }
        .return a {
            padding-bottom: 1px;
            color: #fff;
            text-decoration: none;
            border-bottom: 1px solid rgba(255, 255, 255, 0.6);
            -webkit-transition: border-color 0.1s ease-in;
            transition: border-color 0.1s ease-in;
        }

        .return a:hover {
            border-bottom-color: #fff;
        }
    </style>
</head>
<body>

<div class="error-container">
    <h1>Login lub email już istnieje!!!</h1>
    <div class="return"><p >Wróć do <a href="/">mototripper.io</a></p>
        <p class="return">Wróć do <a href="/add">rejestracji</a></p></div>
</div>

</body>
</html>
