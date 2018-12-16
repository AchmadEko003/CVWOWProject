<%-- 
    Document   : index
    Created on : Dec 12, 2018, 9:48:49 PM
    Author     : Nitani
--%>

<%@page import="entities.Bahasa"%>
<%@page import="controllers.BahasaController"%>
<%@page import="interfaces.BahasaInterface"%>
<%@page import="entities.Universitas"%>
<%@page import="controllers.UniversitasController"%>
<%@page import="interfaces.UniversitasInterface"%>
<%@page import="tools.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="entities.Jurusan"%>
<%@page import="controllers.JurusanController"%>
<%@page import="interfaces.JurusanInterface"%>
<%@page import="controllers.ReqController"%>
<%@page import="entities.Requirements"%>
<%@page import="interfaces.ReqInterface"%>
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

         <div class="container form-group" >
            <div class="dropdown">
                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                    Isi CV
                </button>
                <div class="dropdown-menu">
                    <a class="dropdown-item" data-toggle="modal" data-target="#pendidikanModal">Pendidikan</a>
                    <a class="dropdown-item" data-toggle="modal" data-target="#keahlianModal">Keahlian</a>
                    <a class="dropdown-item" data-toggle="modal" data-target="#pencapaianModal">Pencapaian</a>
                    <a class="dropdown-item" data-toggle="modal" data-target="#bahasaModal">Bahasa</a>
                    <a class="dropdown-item" data-toggle="modal" data-target="#pengalamanModal">Pengalaman Kerja</a>
                    <a class="dropdown-item" data-toggle="modal" data-target="#sertifikatModal">Sertifikat</a>
                </div>
            </div>
        </div>


        <!-- Modal pendidikan-->
        <div class="modal fade" id="pendidikanModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">


                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Pendidikan</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="../addPendidikan" method="POST">
                            <div class="form-group">
                                <label for="sel1">Universitas:</label>
                                <select class="form-control" name="univId" id="univ">
                                    <option selected value="">Pilih Universitas:</option>
                                    <%
                                        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
                                        UniversitasInterface ui = new UniversitasController(sessionFactory);
                                        for (Object elem : ui.search("")) {
                                            Universitas univ = (Universitas) elem;

                                    %>

                                    <option value="<%= univ.getId()%>"><%= univ.getNama()%> </option>


                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="sel1">Jurusan:</label>
                                <select class="form-control" name="jurusanId" id="jur">
                                    <option selected value="">Pilih Jurusan:</option>
                                    <%
                                        JurusanInterface ji = new JurusanController(sessionFactory);
                                        for (Object elem : ji.search("")) {
                                            Jurusan jur = (Jurusan) elem;

                                    %>

                                    <option value="<%= jur.getId()%>"><%= jur.getNama()%> </option>


                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="pwd">Instansi:</label>
                                <input type="text" class="form-control" name="instansi" id="ipk">
                            </div>
                            <div class="form-group">
                                <label for="pwd">IPK:</label>
                                <input type="text" class="form-control" name="ipk" id="ipk">
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary" id="btnSave" name="">Save changes</button>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>
        </div>

        <!--modal keahlian-->
        <div class="modal fade" id="keahlianModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Keahlian</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="../addKeahlian" method="POST">
                            <div class="form-group">
                                <label for="sel1">Keahlian:</label>
                                <select class="form-control" id="skill" name="nama">
                                    <option selected value="">Pilih Keahlian:</option>
                                    <%
                                        ReqInterface ri = new ReqController(sessionFactory);
                                        for (Object elem : ri.search("")) {
                                            Requirements req = (Requirements) elem;

                                    %>

                                    <option value="<%= req.getId()%>"><%= req.getNama()%> </option>


                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group" name="deskripsi">
                                <label for="comment">Deskripsi:</label>
                                <textarea class="form-control" rows="5" id="desk"></textarea>
                            </div>
                            <div class="form-group">
                                <button type="button" class="btn btn-primary">Save changes</button>
                            </div>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <!--modal pencapaian-->
        <div class="modal fade" id="pencapaianModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Pencapaian</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="pwd">Pencapaian:</label>
                            <input type="text" class="form-control" id="pencapaian">
                        </div>
                        <div class="form-group">
                            <label for="comment">Deskripsi:</label>
                            <textarea class="form-control" rows="5" id="desk"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
        <!--modal bahasa-->
        <div class="modal fade" id="bahasaModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Bahasa</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="sel1">Bahasa:</label>
                            <select class="form-control" id="bhs">
                                <option selected value="">Pilih Bahasa:</option>
                                <%
                                    BahasaInterface bi = new BahasaController(sessionFactory);
                                    for (Object elem : bi.search("")) {
                                        Bahasa bhs = (Bahasa) elem;

                                %>

                                <option value="<%= bhs.getId()%>"><%= bhs.getNama()%> </option>


                                <%
                                    }
                                %>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
        <!--modal pengalaman-->
        <div class="modal fade" id="pengalamanModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Pengalaman Kerja</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="pwd">Posisi:</label>
                            <input type="text" class="form-control" id="pos">
                        </div>
                        <div class="form-group">
                            <label for="pwd">Perusahaan:</label>
                            <input type="text" class="form-control" id="prshn">
                        </div>
                        <div class="form-group">
                            <label for="comment">Deskripsi:</label>
                            <textarea class="form-control" rows="5" id="desk"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="pwd">Tanggal Mulai Bekerja</label>
                            <input type="date" class="form-control" id="tglstrt">
                        </div>
                        <div class="form-group">
                            <label for="pwd">Tanggal selesai Bekerja</label>
                            <input type="date" class="form-control" id="tglsls">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
        <!--modal serti-->
        <div class="modal fade" id="sertifikatModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Sertifikat</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="pwd">Nama:</label>
                            <input type="text" class="form-control" id="pos" name="nama">
                        </div>
                        <div class="form-group">
                            <label for="pwd">Lembaga</label>
                            <input type="text" class="form-control" id="prshn" nama="lembaga">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
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
