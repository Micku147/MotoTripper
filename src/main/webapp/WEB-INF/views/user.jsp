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
</head>
<body>
<div id="header-wrapper">
    <div id="header" class="container">
        <div id="logo">
            <h1><a href="/"><b><i>MotoTripper</i></b></a></h1>
        </div>
    </div>
</div>


<div class="container">

    <br>
    <form:form method="post" modelAttribute="user" id="loginpadding" style="padding-top: 1.8em">
        <div class="card">
            <div class="card-body">


                <div class="form-group col-md-auto">

                    <h1 style="text-align: center"><i>Rejestracja</i></h1>

                    <label for="userId">username:</label>
                    <br>
                    <form:input type="text" path="username" id="userId" class="form-control"/>
                    <form:errors path="username" element="div"/>
                </div>

                <div class="form-group col-md-auto">
                    <label for="passwordId">Hasło:</label>
                    <br>
                    <form:input type="password" path="password" id="passwordId" class="form-control"/>
                    <form:errors path="password" element="div"/>
                </div>

                <div class="form-group col-md-auto">
                    <label for="emailId">email:</label>
                    <br>
                    <form:input type="text" path="email" id="emailId" class="form-control"/>
                    <form:errors path="email" element="div"/>
                </div>

                <div class="form-group col-md-auto">
                    <label for="vehicleId">Czym jeździsz :</label>
                    <br>
                    <form:input type="text" path="vehicle" id="vehicleId" class="form-control"/>
                    <form:errors path="vehicle" element="div"/>

                    <br>
                   <h1 style="text-align: center"> <input type="submit" class="btn btn-primary" value="Send" > </h1>
                </div>
            </div>
        </div>

    </form:form>







</div>


</body>
</html>
