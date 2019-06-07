<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: macbookpro
  Date: 2019-06-03
  Time: 16:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<div class="container" style="padding-top: 1.8em">
    <div class="card">
        <div class="card-body">

            <div class="btn-group">
            <a class="btn btn-primary" href="/admin/addEvent">Dodaj Event</a>

            <a class="btn btn-primary" href="/admin/list" >Lista Userów</a>


            <a class="btn btn-primary" href="/logout" methods="post" >wyloguj</a>
            </div>
        </div>
    </div>
</div>
<div class="container" style="padding-top: 1.8em">
    <div class="card">
        <div class="card-body">
            <table class="table">
                <thead class="thead-dark">
                <tr>
                    <th scope="col" >ID</th>
                    <th scope="col">Miejsce spotkania</th>
                    <th scope="col">cel podróży</th>
                    <th scope="col">Organizator</th>
                    <th scope="col">data wyjazdu</th>
                    <th scope="col">tempo jazdy</th>
                    <th scope="col">Szczegóły</th>
                    <th scope="col">Uczestnicy</th>
                    <th scope="col">akcja</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="event" items="${events}">
                <tr>
        <td>${event.id}</td>
        <td>${event.startPlace}</td>
        <td>${event.target}</td>
        <td>${event.organist.username}</td>
        <td>${event.term}</td>
        <td>${event.speed}</td>
        <td><a class="btn btn-warning" href="/admin/description/${event.id}">opis</a></td>
                    <td>
                        <c:forEach items="${event.users}" var="user">
                            <span> - ${user.username}</span><br/>
                        </c:forEach>
                    </td>
        <td>
            <a class="btn btn-success" href="/admin/updateEvent/${event.id}">Edytuj</a>
               <a style="padding: 1em "></a>
            <a class="btn btn-danger" href="/admin/deleteEvent/${event.id}"> Usuń </a>

        </td>
                </tr>
                </tbody>
                </c:forEach>
            </table>
        </div>
    </div>
</div>

</body>
</html>
