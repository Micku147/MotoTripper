<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: macbookpro
  Date: 2019-06-03
  Time: 15:17
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

<div class="container" style="padding-top: 1.8em">
    <div class="card">
        <div class="card-body">

            <div class="btn-group">
                <a class="btn btn-primary" href="/admin/add">Dodaj usera</a>

            <a class="btn btn-primary" href="/admin/listEvent" >Lista Eventów</a>


            <a class="btn btn-primary " href="/logout" methods="post"  >wyloguj</a>
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
                    <th>ID</th>
                    <th>Username</th>
                    <th>hasło</th>
                    <th>email</th>
                    <th>pojazd</th>
                    <th>akcja</th>
                    <c:forEach var="user" items="${users}">
                <tr>
                </thead>
                <tbody>
                <td>${user.id}</td>
                <td>${user.username}</td>
                <td><a style="color: white">ia</a><i class="fa fa-lock" style="font-size:24px"></i></td>
                <td>${user.email}</td>
                <td>${user.vehicle}</td>
                <td>
                    <a class="btn btn-success" href="/admin/update/${user.id}">Edytuj</a>
                        <%--<a href="/books/delete/${book.id}">Usuń</a>--%>
                    <a class="btn btn-danger" href="/admin/delete/${user.id}">Usuń</a>

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
