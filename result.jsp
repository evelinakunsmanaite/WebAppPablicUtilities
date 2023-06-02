<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8" />
        <meta name="viewport"
              content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />

        <title>Result</title>

        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />

        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
        crossorigin="anonymous"></script>

        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
              rel="stylesheet" type="text/css" />

        <link
            href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
            rel="stylesheet" type="text/css" />

        <!-- Core theme CSS (includes Bootstrap)-->

        <c:url var="css" value="/css/index-styles.css"></c:url>
        <link rel="stylesheet" href="${css}" type="text/css"/>
        
        <c:url var="css" value="/css/resultTable.css"></c:url>
        <link rel="stylesheet" href="${css}" type="text/css"/>

    </head>
    <body id="page-top">

        <!-- Navigation-->
        <nav          
            class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
            id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="#page-top"><%= session.getAttribute("status")%></a>
                <button
                    class="navbar-toggler text-uppercase font-weight-bold bg-primary rounded"
                    type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
                    aria-expanded="false" aria-label="Toggle navigation">
                    Menu <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item mx-0 mx-lg-1"><a
                                class="nav-link py-3 px-0 px-lg-3 rounded" href="index.jsp">Выход</a></li>           
                    </ul>
                </div>
            </div>
        </nav>


        <table>
            <thead>
            <th>Email пользователя</th>
            <th>Номер квартиры/дома</th>
            <th>Площадь квартиры/дома</th>
            <th>Этаж</th>
            <th>Число комнат</th>
            <th>Улица</th>
            <th>Тип здания</th>
            <th>Срок эксплуатации</th>
        </thead>
        <c:forEach var="ab" items="${result}">
            <tr>
                <td>${ab.userEmail}</td>
                <td>${ab.apartmentNumber}</td>
                <td>${ab.apartmentArea}</td>
                <td>${ab.floor}</td>
                <td>${ab.roomsCount}</td>
                <td>${ab.street}</td>
                <td>${ab.buildingType}</td>
                <td>${ab.lifetime}</td>

            </tr>
        </c:forEach>
    </table>

</body>
</html>
