<%--
  Created by IntelliJ IDEA.
  User: macbookpro
  Date: 2019-06-03
  Time: 16:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="<c:url value="/webjars/jquery/3.0.0/jquery.min.js"/>"></script>
    <script src="<c:url value="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"/>"></script>
    <link href="<c:url value="/webjars/bootstrap/4.3.1/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet">

</head>
<body>
<div id="header-wrapper">
    <div id="header" class="container">
        <div id="logo">
            <h1><a href="/"><b><i>MotoTripper</i></b></a></h1>
        </div>
    </div>
</div>

<form:form method="post" modelAttribute="event" id="loginpadding"  style="padding-top: 1.8em">

<div class="card">
    <div class="card-body" >
        <h1 style="text-align: center"> <i>Szczegóły wyjazdu</i></h1>

<div class="row">
        <div class="form-group col-md-6">



<label for="startPlaceId">Start:</label>
            <br>
    <form:input type="text" path="startPlace" id="startPlaceId" class="form-control"/>
    <form:errors path="startPlace" element="div"/>
        </div>
        <div class="form-group col-md-6">

<label for="targetId">Cel podróży:</label>
            <br>
    <form:input type="text" path="target" id="targetId" class="form-control" />
    <form:errors path="target" element="div"/>
        </div>
</div>
        <div class="row">
        <div class="form-group col-md-6">

        <label for="termId">Termin wyjazdu:</label>
            <br>
    <form:input type="date" path="term" id="termId" class="form-control" />
    <form:errors path="term" element="div"/>
        </div>
        <div class="form-group col-md-6">
<label for="speedId">Tempo jazdy:</label>
            <br>
    <form:select path="speed" items="${speeds}" itemLabel="speed" itemValue="speed" id="speedId" class="form-control"/>
        </div>
        </div>
        <div class="row">
        <div class="form-group col-md-12">
        <label for="descriptionId">Opis wycieczki:</label>
            <br>
    <form:textarea rows="3" cols="40" path="description" class="md-textarea form-control" id="descriptionId"/>
    <form:errors path="description" element="div"/>
<br>
    <h1 style="text-align: center"><input class="btn btn-primary" type="submit" value="Wyślij" ></h1>
        </div>
        </div>
</form:form>

    </div>
</div>
</body>
</html>
