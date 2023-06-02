<%-- 
    Document   : admin
    Created on : 9 мая 2023 г., 14:16:20
    Author     : Administrator
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta name="viewport"
              content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />

        <title>Admin</title>

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
        <link href="css/index-styles.css" rel="stylesheet" />
        <link href="css/adminTable.css" rel="stylesheet" />
    </head>

    <body id="page-top">

        <!-- Навигация-->
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
                                class="nav-link py-3 px-0 px-lg-3 rounded" href="#adder">Добавить данные</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a
                                class="nav-link py-3 px-0 px-lg-3 rounded" href="#finder">Поиск данных</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a
                                class="nav-link py-3 px-0 px-lg-3 rounded" href="#change">Изменить данные</a></li>                                    
                        <li class="nav-item mx-0 mx-lg-1"><a
                                class="nav-link py-3 px-0 px-lg-3 rounded" href="logout">Выйти</a></li>           
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Добро пожаловать-->
        <header class="masthead bg-primary text-center">
            <div class="container d-flex align-items-center flex-column">
                <!-- Masthead Avatar Image-->
                <img class="masthead-avatar mb-5" src="assets/img/avatar.svg"
                     alt="..." />
                <!-- Masthead Heading-->
                <h1 class="masthead-heading text-secondary mb-0">Добро пожаловать <%= session.getAttribute("name")%></h1>
                <!-- Icon Divider-->
                <div class="divider-custom divider-light">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon">
                        <i class="fas fa-star"></i>
                    </div>
                    <div class="divider-custom-line"></div>
                </div>
                <p class="masthead-subheading text-secondary mb-0">Коммунальные услуги</p>
            </div>
        </header>

        <!-- Добавление данных -->
        <section class="page-section" id="adder">
            <div class="container">

                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">Добавить данные</h2>
                <!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon">
                        <i class="fas fa-star"></i>
                    </div>
                    <div class="divider-custom-line"></div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <!-- Добавление дома -->

                        <input type="hidden" id="status" value="<%= request.getAttribute("status")%>">

                        <div class="main">

                            <section class="signup">
                                <div class="container">
                                    <div class="signup-content">
                                        <div class="signup-form">

                                            <form method="post" action="houses" class="register-form"
                                                  id="register-form">

                                                <h2 class="form-title text-secondary">Добавить дом</h2>

                                                <div class="form-group">
                                                    <label for="userEmail"><i
                                                            class="zmdi zmdi-account material-icons-name"></i></label> <input
                                                        type="text" name="userEmail" id="userEmail" placeholder="Введите email пользователя" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="apartmentNumber"><i
                                                            class="zmdi zmdi-account material-icons-name"></i></label> <input
                                                        type="number" min="0" name="apartmentNumber" id="apartmentNumber" placeholder="Введите номер квартиры/дома" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="apartmentArea"><i
                                                            class="zmdi zmdi-account material-icons-name"></i></label> <input
                                                        type="number" step="0.01" min="0" name="apartmentArea" id="apartmentArea" placeholder="Введите площадь квартиры/дома" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="floor"><i
                                                            class="zmdi zmdi-account material-icons-name"></i></label> <input
                                                        type="number" min="0" name="floor" id="floor" placeholder="Введите этаж" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="roomsCount"><i
                                                            class="zmdi zmdi-account material-icons-name"></i></label> <input
                                                        type="number" min="0" name="roomsCount" id="roomsCount" placeholder="Введите количество комнат" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="street"><i
                                                            class="zmdi zmdi-account material-icons-name"></i></label> <input
                                                        type="text" name="street" id="street" placeholder="Введите улицу" />
                                                </div>

                                                <div class="form-group">
                                                    <label for="buildingType"><i class="zmdi zmdi-account-box"></i></label>
                                                    <select name="buildingType" id="buildingType">
                                                        <option value="" disabled selected hidden>Выберите тип здания</option>
                                                        <option value="Жилое здание">Жилое здание</option>
                                                        <option value="Общественное здание">Общественное здание</option>
                                                        <option value="Промышленное здание">Промышленное здание</option>
                                                        <option value="Сельскохозяйственное здание">Сельскохозяйственное здание</option>
                                                        <option value="Складское здание">Складское здание</option>
                                                    </select>
                                                </div>

                                                <div class="form-group">
                                                    <label for="lifeTime"><i
                                                            class="zmdi zmdi-account material-icons-name"></i></label> <input
                                                        type="number" min="0" name="lifeTime" id="lifeTime" placeholder="Введите срок эксплуатации" />
                                                </div>
                                                <br>
                                                <div class="form-group form-button">
                                                    <input type="submit" name="signup" id="signup"
                                                           class="form-submit" value="Зарегистрировать" />
                                                </div>
                                            </form>
                                        </div>

                                    </div>
                                </div>
                            </section>
                            
                        </div>                              
                    </div>

                    <div class="col-md-6">

                        <!-- Добавление пользователя -->
                        <input type="hidden" id="status" value="<%= request.getAttribute("status")%>">

                        <div class="main">

                            <!-- Sign up form -->
                            <section class="signup">
                                <div class="container">
                                    <div class="signup-content">
                                        <div class="signup-form">

                                            <form method="post" action="register" class="register-form"
                                                  id="register-form">

                                                <h2 class="form-title text-secondary">Добавить пользователя</h2>


                                                <div class="form-group">
                                                    <label for="firstNname"><i
                                                            class="zmdi zmdi-account material-icons-name"></i></label> <input
                                                        type="text" name="firstNname" id="firstNname"  placeholder="Введите имя" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="lastNname"><i
                                                            class="zmdi zmdi-account material-icons-name"></i></label> <input
                                                        type="text" name="lastNname" id="lastNname" placeholder="Введите фамилию" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="email"><i class="zmdi zmdi-email"></i></label> <input
                                                        type="email" name="email" id="email" placeholder="Введите email" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
                                                        type="password" name="pass" id="pass" placeholder="Введите пароль" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                                    <input type="password" name="re_pass" id="re_pass"
                                                           placeholder="Подтвердите пароль" />
                                                </div>

                                                <div class="form-group">
                                                    <label for="status"><i class="zmdi zmdi-account-box"></i></label>
                                                    <select name="status" id="status">
                                                        <option value="" disabled selected hidden>Выберите статус</option>
                                                        <option value="user">Пользователь</option>
                                                        <option value="admin">Администратор</option>
                                                    </select>
                                                </div>
                                                <br>
                                                <div class="form-group form-button">
                                                    <input type="submit" name="signup" id="signup"
                                                           class="form-submit" value="Зарегистрироваться" />
                                                </div>
                                            </form>
                                        </div>

                                    </div>
                                </div>
                            </section>

                        </div>
                    </div>

                </div>	
            </div>
        </section>

        <!-- Вывод данных -->
        <section class="page-section bg-primary text-white mb-0" id="finder">
            <div class="container">

                <h2
                    class="page-section-heading text-center text-uppercase text-secondary mb-0">Вывод данных</h2>
                <!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon">
                        <i class="fas fa-star"></i>
                    </div>
                    <div class="divider-custom-line"></div>
                </div>

                <div class="button-container">
                    <button class="toggle-button" onclick="toggleTable('usersTable')">Вывести данные о пользователей</button>
                    <button class="toggle-button" onclick="toggleTable('housesTable')">Вывести данные о домов</button>

                </div>
                <br>
                <br>  
                <table id="usersTable" class="table" style="display: none;">
                    <caption>Данные пользователей</caption>
                    <thead>
                        <tr>
                            <th>Email</th>
                            <th>Пароль</th>
                            <th>Имя</th>
                            <th>Фамилия</th>
                            <th>Статус</th>   
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/publicutilities?useSSL=false", "root", "evelina2002");
                                PreparedStatement pst = con.prepareStatement("SELECT * FROM users");
                                ResultSet rs = pst.executeQuery();
                                while (rs.next()) {
                        %>
                        <tr>                           
                            <td><%= rs.getString(2)%></td>
                            <td><%= rs.getString(3)%></td>
                            <td><%= rs.getString(4)%></td>
                            <td><%= rs.getString(5)%></td>
                            <td><%= rs.getString(6)%></td>
                        </tr>
                        <%
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>  
                    </tbody>

                </table>
                <br>
                <br>  
                <table id="housesTable" class="table" style="display: none;">
                    <caption>Данные домов</caption>
                    <thead>
                        <tr>                    
                            <th>Email пользователя</th>
                            <th>Номер квартиры/дома</th>
                            <th>Площадь квартиры/дома</th>
                            <th>Этаж</th>
                            <th>Число комнат</th>
                            <th>Улица</th>
                            <th>Тип здания</th>
                            <th>Срок эксплуатации</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/publicutilities?useSSL=false", "root", "evelina2002");
                                PreparedStatement pst = con.prepareStatement("SELECT * FROM houses");
                                ResultSet rs = pst.executeQuery();
                                while (rs.next()) {
                        %>
                        <tr>                        
                            <td><%= rs.getString(2)%></td>
                            <td><%= rs.getString(3)%></td>
                            <td><%= rs.getString(4)%></td>
                            <td><%= rs.getString(5)%></td>
                            <td><%= rs.getString(6)%></td>
                            <td><%= rs.getString(7)%></td>
                            <td><%= rs.getString(8)%></td>
                            <td><%= rs.getString(9)%></td>
                        </tr>
                        <%
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                    </tbody>
                </table>

        </section>

        <!--скрипт для переключения кнопок таблицы-->
        <script>
            var tableStates = {
                usersTable: false,
                housesTable: false
            };

            function toggleTable(tableId) {
                var table = document.getElementById(tableId);

                if (tableStates[tableId]) {
                    table.style.display = "none";
                    tableStates[tableId] = false;
                } else {
                    table.style.display = "table";
                    tableStates[tableId] = true;
                }
            }
        </script>

        <!-- Изменение данных-->
        <section class="page-section" id="change">
            <div class="container">
                <h2
                    class="page-section-heading text-center text-uppercase text-secondary mb-0">Изменить данные</h2>
                <!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon">
                        <i class="fas fa-star"></i>
                    </div>
                    <div class="divider-custom-line"></div>
                </div>

                <table id="housesTable" class="table">
                    <thead>
                        <tr>                    
                            <th>Email пользователя</th>
                            <th>Номер квартиры/дома</th>
                            <th>Площадь квартиры/дома</th>
                            <th>Этаж</th>
                            <th>Число комнат</th>
                            <th>Улица</th>
                            <th>Тип здания</th>
                            <th>Срок эксплуатации</th>
                            <th>Изменить</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/publicutilities?useSSL=false", "root", "evelina2002");
                                PreparedStatement pst = con.prepareStatement("SELECT * FROM houses");
                                ResultSet rs = pst.executeQuery();
                                while (rs.next()) {
                        %>
                        <tr>                        
                            <td><%= rs.getString(2)%></td>
                            <td><%= rs.getString(3)%></td>
                            <td><%= rs.getString(4)%></td>
                            <td><%= rs.getString(5)%></td>
                            <td><%= rs.getString(6)%></td>
                            <td><%= rs.getString(7)%></td>
                            <td><%= rs.getString(8)%></td>
                            <td><%= rs.getString(9)%></td>
                            <td><a href="update.jsp?id=<%= rs.getInt(1)%>">Изменить</a></td>
                        </tr>
                        <%
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </section>

        <!--скрипт-->
        <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>


        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="js/main.js"></script>      


        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link rel="stylesheet" href="alert/dist/sweetalert.css">

        <script type="text/javascript">
            var status = document.getElementById("status").value;
            if (status == "success") {
                swal("Поздравляю", "Регистрация прошла успешно", "success");
            } else if (status == "failed") {
                swal("Sorry", "Wrong Email or Password", "error");
            }
        </script>


    </body>
</html>

