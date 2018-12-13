<%-- 
    Document   : index
    Created on : Dec 12, 2018, 9:48:49 PM
    Author     : Nitani
--%>

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
        <nav class="navbar navbar-expand-lg navbar-dark bg-info sticky-top">
            <!--            <a class="navbar-brand" href="#">
                            <img src="./Assets/MII-logo.png" alt="Logo" style="width:40px;">
                        </a>-->
            <button type="button" class="btn btn-light">
                <img src="./Assets/MII-logo.png" alt="Logo" style="width:40px;">
            </button>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Profile</a>
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

        <!-- Modal -->
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
                                    <form method="POST"  action="../registerServlet">
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
                    </div>

                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <!--Profile singkat sisi kiri-->
                <div class="col-sm-4">
                    <div class="card" style="margin-top: 10px;">
                        <img src="./Assets/Foto 3x4 Eko.jpg" class="rounded-circle" alt="Card image cap" width="232" height="236" style="margin-left: 60px; margin-top: 20px">
                        <div class="card-body">
                            <h5 class="card-title">Nama</h5>
                            <p class="card-text">Profil singkat</p>
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">
                                <h5><i class="fas fa-language"></i> Bahasa</h5><br>
                                <p>Ini isinya</p>
                            </li>
                            <li class="list-group-item">
                                <h5><i class="fas fa-certificate"></i> Sertifikat</h5><br>
                                <p>Ini isinya</p>
                            </li>
                        </ul>
                        <div class="card-body">
                            <a href="#" class="card-link">Card link</a>
                            <a href="#" class="card-link">Another link</a>
                        </div>
                    </div>
                    <hr class="d-sm-none">
                    <br>
                </div>
                <div class="col-sm-8">
                    <div class="card bg-light mb-3" style="margin-top: 10px;">
                        <div class="card-header">
                            <h3><i class="fas fa-graduation-cap"></i> Pendidikan</h3>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">Light card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <hr>
                            <h5 class="card-title">Light card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                    </div>
                    <div class="card bg-light mb-3" style="margin-top: 10px;">
                        <div class="card-header">
                            <h3><i class="fas fa-briefcase"></i> Pengalaman</h3>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">Light card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                    </div>
                    <div class="card bg-light mb-3" style="margin-top: 10px;">
                        <div class="card-header">
                            <h3><i class="fas fa-sliders-h"></i> Keahlian</h3>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">Light card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                    </div>
                    <div class="card bg-light mb-3" style="margin-top: 10px;">
                        <div class="card-header">
                            <h3><i class="fas fa-tasks"></i> Project</h3>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">Light card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="jumbotron text-center" style="margin-bottom:0">
            <p>Footer</p>
        </div>
    </body>
</html>
