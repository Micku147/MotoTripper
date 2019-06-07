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


<div class="container">

    <br>
    <form:form method="post" modelAttribute="email" id="loginpadding">


    <div class="card">
        <div class="card-body">


            <div class="form-group col-md-auto">

                <h1 style="text-align: center"><i>Kontakt</i></h1>

                <label for="subjectId">Temat:</label>
                <br>
                <form:input type="text" path="subject" id="subjectId" class="form-control"/>
            </div>

            <div class="form-group col-md-auto">
                <label for="messageId">Wiadomść:</label>
                <form:textarea rows="3" cols="40" class="md-textarea form-control" path="message" id="messageId"/>

                <br>

                <h1 style="text-align: center"><input type="submit" value="Wyślij" class="btn btn-primary"></h1>
            </div>
            </form:form>
        </div>
    </div>
</div>


</body>
</html>

