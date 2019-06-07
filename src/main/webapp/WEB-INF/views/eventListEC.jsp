<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
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

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<div id="header-wrapper">
    <div id="header" class="container">
        <div id="logo">
            <h1><a href="/"><b><i>MotoTripper</i></b></a></h1>
        </div>
    </div>
</div>
</div>
<div id="menu" class="logoutPadding">
    <ul>
        <br><br>

        <li class="active"><a href="/logout" accesskey="4" title="" >Wyloguj</a></li>
    </ul>
</div>



    <div class="container" style="padding-top: 1.8em">
        <div class="card">
            <div class="card-body">
                <table class="table">
                    <thead class="thead-dark">
                    <tr>
                        <th>ID</th>
                        <th>Miejsce spotkania</th>
                        <th>cel podróży</th>
                        <th>Organizator</th>
                        <th>data wyjazdu</th>
                        <th>tempo jazdy</th>
                        <th>Opis</th>
                        <th>uczestnicy</th>
                        <th>Przyłącz się!</th>

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
                        <td><a class="btn btn-warning" href="/event/description/${event.id}">opis</a></td>
                        <td>
                                <% boolean should_hide_add_button = false; %>
                            <c:forEach items="${event.users}" var="user">
                                <span> - ${user.username}</span><br/>

                                <c:if test="${user.equals(sessionScope.userSession)}">
                                    <% should_hide_add_button = true; %>
                                </c:if>
                            </c:forEach>
                        </td>

                        <td>

                            <% if(!should_hide_add_button){ %>
                                <a class="fa fa-plus" style="font-size:36px" href="/event/addToEvent/${event.id}"></a>
                            <% } %>
                        </td>
                    </tr>

                    </tbody>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>

    <div class="container" style="padding-top: 1.8em">
        <div class="card">
            <div class="card-body">
    <a class="btn btn-primary" href="/event/addEvent">Dodaj event</a>
            </div>
        </div>
    </div>
</form>
</body>
</html>