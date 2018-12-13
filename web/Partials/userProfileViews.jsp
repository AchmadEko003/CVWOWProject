<%-- 
    Document   : userProfileViews
    Created on : Dec 13, 2018, 10:38:27 PM
    Author     : Nitani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
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
                    <form method="POST"  action="loginServlet">
                        <div class="form-group">
                            <i class="fas fa-envelope"></i>
                            <label for="exampleInputEmail1">Email address</label>
                            <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                        </div>
                        <div class="form-group">
                            <i class="fas fa-lock"></i>
                            <label for="exampleInputPassword1">Password</label>
                            <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-info btn-lg btn-block">Login</button>
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
    </body>
</html>
