<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <script src="https://maps.googleapis.com/maps/api/js?libraries=drawing,places&key=AIzaSyAb-ERRif3M_NQd-srbAwF-i9KmN9kbtlc"></script>

    <script>
        function dispayDirections() {
            var directionsService = new google.maps.DirectionsService();
            var directionsDisplay = new google.maps.DirectionsRenderer();
            var place = new google.maps.LatLng(${event.startLatitude}, ${event.startLongitude});
            var mapOptions = {
                zoom:7,
                center: place
            }
            var map = new google.maps.Map(document.getElementById('map'), mapOptions);
            directionsDisplay.setMap(map);
            calcRoute(directionsService, directionsDisplay)
        }

        function calcRoute(directionsService, directionsDisplay) {
            var request = {
                origin: "${event.startPlace}",
                destination: "${event.target}",
                travelMode: 'DRIVING'
            };
            directionsService.route(request, function(result, status) {
                if (status == 'OK') {
                    directionsDisplay.setDirections(result);
                }
            });
        }

        $(window).on('load',dispayDirections);
    </script>

    <link href="<c:url value="/webjars/bootstrap/4.3.1/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet">
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css'
          integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
<style>
        #map{
            width: 100%;
            height: 400px;
            background-color: grey;
        }
    </style>
</head>

<body>
<div id="header-wrapper">
    <div id="header" class="container">
        <div id="logo">
            <h1><a href="/"><b><i>MotoTripper</i></b></a></h1>
        </div>
    </div>
</div>

<h1 class="card-header">
    <div class="row">
        <div class="col-md-4"></div>

        <div class="col-md-2">
            Start:
            <p>${event.startPlace}</p></div>
        <div class="col-md-1">
            <i class='fas fa-arrow-right' style='font-size:48px'></i>
        </div>
        <div class="col-md-1">
            Cel:
            <p>${event.target}</p></div>
    </div>


    <div class="row">
        <div class="col-md-4">
        </div>
        <div class="col-md-auto">
            <div >
                Kiedy:
                ${event.term}</div>

        </div>
    </div>




    <%--<div class="col-md-2">--%>
        <%--Kiedy:--%>
        <%--<p>${event.term}</p></div>--%>


</h1>

<div class="col-md-auto">
    <h1> Opis Wycieczki</h1>
    <p>${event.description}</p>
</div>
<div id="map">

</div>
<%--<script>--%>
    <%--// Initialize and add the map--%>
    <%--function initMap() {--%>
        <%--// The location of Uluru--%>
        <%--var uluru = {lat: 52.234982, lng: 21.008490};--%>
        <%--// The map, centered at Uluru--%>
        <%--var map = new google.maps.Map(--%>
            <%--document.getElementById('map'), {zoom: 4, center: uluru});--%>
        <%--// The marker, positioned at Uluru--%>
        <%--var marker = new google.maps.Marker({position: uluru, map: map});--%>
    <%--} --%>
<%--</script>--%>
<%--<script async defer  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAb-ERRif3M_NQd-srbAwF-i9KmN9kbtlc&callback=initMap">/ </script>--%>

</body>
</html>
