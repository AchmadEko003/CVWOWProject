<%-- 
    Document   : lokerViews
    Created on : Dec 13, 2018, 8:49:40 PM
    Author     : Nitani
--%>

<%@page import="entities.UserProfile"%>
<%@page import="entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

    </head>
    <body>
        <% String namasda = "", umursdwa = "", dwasdaw = "", dwwasdaw = "";
            if (session.getAttribute("profile") != null) {
                UserProfile r = (UserProfile) session.getAttribute("profile");
            }
        %>
        <nav class="navbar navbar-expand-lg navbar-dark bg-info sticky-top">
            <!--            <a class="navbar-brand" href="#">
                            <img src="./Assets/MII-logo.png" alt="Logo" style="width:40px;">
                        </a>-->
            <button type="button" class="btn btn-light">
                <img src="../Assets/MII-logo.png" alt="Logo" style="width:40px;">
            </button>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <li class="nav-item active">
                        <div class="dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="dropdownMenuLink" data-toggle="dropdown">Home</a>

                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <a class="dropdown-item" href="#">Something else here</a>
                            </div>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Profile <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled" href="#">Loker</a>
                    </li>
                </ul>
                <ul class="nav justify-content-end">
                    <li class="nav-item">
                        <button type="button" class="btn btn-outline-light" data-toggle="modal" data-target="#exampleModalCenter">
                            Login
                        </button>
                    </li>
                </ul>
            </div>
        </nav>

        <div class="modal fade bd-example-modal-lg" id="cvModal" tabindex="-1" role="dialog" aria-labelledby="cvModal" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">

                    <div class="modal-body">
                        <%@include file="cvView.jsp" %>
                    </div>

                </div>
            </div>
        </div>

        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">

                    <div class="modal-body">
                        <div class="">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <ul class="nav nav-tabs">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#login">Login</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#signUp">Register</a>
                                </li>
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div id="login" class="container tab-pane active"><br>
                                    <form method="POST"  action="../loginServlet">
                                        <div class="form-group">
                                            <i class="fas fa-envelope"></i>
                                            <label for="exampleInputEmail1">Email address</label>
                                            <input name="emailsa" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                        </div>
                                        <div class="form-group">
                                            <i class="fas fa-lock"></i>
                                            <label for="exampleInputPassword1">Password</label>
                                            <input name="passwords" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                        </div>
                                        <div class="form-group">
                                            <input type="submit" class="btn btn-info btn-lg btn-block">Login
                                        </div>
                                    </form>
                                </div>

                                <div id="signUp" class="container tab-pane fade"><br>
                                    <form method="POST" action="registerServlet">
                                        <div class="form-group">
                                            <i class="fas fa-user"></i>
                                            <label for="exampleInputEmail1">Name</label>
                                            <input name="userName" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="name" placeholder="Name">
                                        </div>
                                        <div class="form-group">
                                            <i class="fas fa-envelope"></i>
                                            <label for="exampleInputEmail1">Email address</label>
                                            <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                        </div>
                                        <div class="form-group">
                                            <i class="fas fa-lock"></i>
                                            <label for="exampleInputPassword1">Password</label>
                                            <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                        </div>
                                        <!--                                    <div class="form-group">
                                                                                <i class="fas fa-lock"></i>
                                                                                <label for="exampleInputPassword1">Confirm Password</label>
                                                                                <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Confirm Password">
                                                                            </div>-->
                                        <div class="form-group">
                                            <input type="submit" class="btn btn-info btn-lg btn-block">Register <i class="fab fa-telegram-plane"></i>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="cvView.jsp" %>
    </body>
</html>
