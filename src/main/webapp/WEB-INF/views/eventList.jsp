<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<div class="container" style="padding-top: 1.5em">
    <div class="card">
        <div class="card-body">
            <table class="table">
                <thead class="thead-dark">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Miejsce spotkania</th>
                    <th scope="col">cel podróży</th>
                    <th scope="col">Organizator</th>
                    <th scope="col">data wyjazdu</th>
                    <th scope="col">tempo jazdy</th>
                    <th scope="col">Opis</th>
                    <th scope="col">Uczestnicy</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="event" items="${events}">
                <tr>
                    <td scope="row">${event.id}</td>
                    <td>${event.startPlace}</td>
                    <td>${event.target}</td>
                    <td>${event.organist.username}</td>
                    <td>${event.term}</td>
                    <td>${event.speed}</td>
                    <td><a class="btn btn-warning" href="/description/${event.id}">opis</a></td>

                    <td>
                        <c:forEach items="${event.users}" var="user">
                            <span> - ${user.username}</span><br/>
                        </c:forEach>
                    </td>

                </tr>
                </tbody>
                </c:forEach>
            </table>
        </div>
    </div>
</div>

<br>






<div class="container">
    <div class="card">
        <div class="card-body">
            <p>Aby dodać własny event lub dołączyć do istniejącego musisz być zalogowany</p>
            <a href="/add" class="btn btn-primary" title="">Rejestracja</a>
            <a href="/login" class="btn btn-primary" title="">Logowanie</a>

        </div>
    </div>
</div>
</body>
</html>