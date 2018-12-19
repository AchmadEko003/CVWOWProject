<%-- 
    Document   : lokerViews
    Created on : Dec 13, 2018, 8:49:40 PM
    Author     : Nitani
--%>

<%@page import="entities.UserProfile"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="controllers.LokerController"%>
<%@page import="interfaces.LokerInterface"%>
<%@page import="tools.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="entities.LowonganPekerjaan"%>
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

          <!-- 
      1. data itu adalah nama dari file servlet untuk mengisikan session 
      2. detail adalah nama id dari attribut yang akan diisikan data hasil "data" dan terdapat didalam modal edit
      3. EditData adalah id modal yang akan menampilkan "data" -->
        <script type="text/javascript">
            $(document).ready(function () {
                $('[id="Details"]').click(function () {
                    var id = $(this).attr('value');
                    $.get("../data?id=" + id, function (HASIL, status) {
                        $("#detail").html(HASIL);
                        $('#EditData').modal('show');
                    });
                });
            });
        </script>
        
    </head>
    <body class="bg-light">
        
        <%  
            String idEdit = "";
            String namaEdit = "";
            String umurEdit = "";
            String alamatEdit = "";
            String tglLahirEdit = "";
            String noTelpEdit = "";
            if (session.getAttribute("isiUsers") != null) {
                UserProfile j = (UserProfile) session.getAttribute("isiUsers");
                namaEdit = j.getNama();
                umurEdit = String.valueOf(j.getUmur());
                alamatEdit = j.getAlamat();
                tglLahirEdit = j.getTanggalLahir().toString();
                noTelpEdit = String.valueOf(j.getNoTelpon());
                System.out.println(j);
            }
        %>
        
        <nav class="navbar navbar-expand-lg navbar-dark bg-info sticky-top">
            <button type="button" class="btn btn-light">
                <a href="../index.jsp">
                    <img src="../Assets/MII-logo.png" alt="Logo" style="width:40px;">
                </a>
            </button>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse">
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <li class="nav-item active">
                        <a class="nav-link" href="Partials/lokerViews.jsp">Lowongan Kerja</a>
                    </li>
                    <li class="nav-item active">
                        <div class="dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="dropdownMenuLink" data-toggle="dropdown">Isi CV</a>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#keahlianModal">Keahlian</a>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#sertifikatModal">Sertifikat</a>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#projectModal">Project</a>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#pengalamanModal">Pengalaman</a>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#pendidikanModal">Pendidikan</a>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#bahasaModal">Bahasa</a>
                            </div>
                        </div>
                    </li>
                </ul>
                <ul class="nav justify-content-end">
                    <li class="nav-item">
                        <button type="button" class="btn btn-outline-light" href="logoutServlet" onclick="deletes()">
                            Logout
                        </button>
                    </li>
                </ul>
            </div>
        </nav>

        <!-- Modal Keahlian -->
        <div class="modal fade" id="keahlianModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <%@include file="User/keahlianView.jsp" %>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Sertifikat -->
        <div class="modal fade" id="sertifikatModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="container">
            <form method="POST" action="addProfileServlet">
                <div class="form-group">
                    <!--<i class="fas fa-user"></i>-->
                    <label for="exampleInputEmail1">Id</label>
                    <input name="id" type="text" class="form-control" aria-describedby="name" placeholder="Name" value="">
                </div>
                <div class="form-group">
                    <!--<i class="fas fa-user"></i>-->
                    <label for="exampleInputEmail1">Name</label>
                    <input name="nama" type="text" class="form-control" aria-describedby="name" placeholder="Name" value="">
                </div>
                <div class="form-group">
                    <!--<i class="fas fa-envelope"></i>-->
                    <label for="exampleInputEmail1">Umur</label>
                    <input name="umur" type="text" class="form-control" aria-describedby="emailHelp" placeholder="Enter email" value="">
                </div>
                <div class="form-group">
                    <!--<i class="fas fa-lock"></i>-->
                    <label for="exampleInputPassword1">alamat</label>
                    <textarea name="alamat" class="form-control" placeholder="Password" value=""></textarea>
                </div>
                <div class="form-group">
                    <!--<i class="fas fa-lock"></i>-->
                    <label for="exampleInputPassword1">Tanggal lahir</label>
                    <input name="tglLahir" type="date" class="form-control" placeholder="Confirm Password" value="">
                </div>
                <div class="form-group">
                    <!--<i class="fas fa-lock"></i>-->
                    <label for="exampleInputPassword1">No Telp</label>
                    <input name="telp" type="text" class="form-control" placeholder="Confirm Password" value="">
                </div>
                <div class="form-group">
                    <!--<i class="fas fa-lock"></i>-->
                    <label for="exampleInputPassword1">Foto</label>
                    <input name="foto" type="file" class="form-control-file"  aria-describedby="fileHelp">
                </div>
                <div class="form-group">
                    <!--<i class="fas fa-lock"></i>-->
                    <label for="exampleInputPassword1">CV</label>
                    <input name="cv" type="file" class="form-control-file" aria-describedby="fileHelp">
                </div>
                <div class="form-group">
                    <!--<i class="fas fa-lock"></i>-->
                    <label for="exampleInputPassword1">KTP</label>
                    <input name="ktp" type="file" class="form-control-file" aria-describedby="fileHelp">
                </div>
                <div class="form-group">
                    <input type="submit" class="btn btn-info btn-lg btn-block" value="Submit">
                </div>
            </form>
        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Project -->
        <div class="modal fade" id="projectModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <%@include file="User/projectView.jsp" %>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Pengalaman -->
        <div class="modal fade" id="pengalamanModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <%@include file="User/pengalamanView.jsp" %>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Pendidikan -->
        <div class="modal fade" id="pendidikanModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <%@include file="User/riwayatPendidikanView.jsp" %>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Bahasa -->
        <div class="modal fade" id="bahasaModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <%@include file="User/bahasaView.jsp" %>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">

                <div class="col-sm-9">
                    <% SessionFactory factory = HibernateUtil.getSessionFactory();
                        LokerInterface li = new LokerController(factory);
                        DateFormat formats = new SimpleDateFormat("d MMMM yyyy", Locale.ENGLISH);
                        for (Object loker : li.search("")) {
                            LowonganPekerjaan lowker = (LowonganPekerjaan) loker;
                            Date hire = lowker.getTanggalSelesai();%>
                    <div class="card shadow p-3 mb-3 bg-white rounded" style="margin-top: 10px;">
                        <div class="card-header">
                            <h3><%= lowker.getJudul()%></h3>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">Mitra Integrasi Informatika</h5>
                            <p class="card-text"><%= lowker.getDeskripsi()%></p>
                            <footer class="blockquote-footer">Waktu berahir <cite title="Source Title"><%= formats.format((hire))%></cite></footer>
                            <a href="../applyLokerServlet?id=<%= lowker.getId()%>" class="card-link" onclick="return confirm('Ingin melamar di lowongan ini?');">Apply</a>
                        </div>
                    </div>
                    <% }%>
                </div>

                <footer class="fixed-bottom">
                    <nav class="navbar navbar-expand-lg navbar-dark bg-info fixed-bottom">
                        <div class="container">
                            <p class="text-light">&copy; 2018 Mitra Integrasi Informatika. All rights reserved.</p>
                        </div>
                    </nav>
                </footer>

                <script>
                    function deletes() {
                        swal({
                            title: "Ingin logout?",
                            icon: "warning",
                            buttons: true,
                            dangerMode: true,
                        })
                                .then((willDelete) => {
                                    if (willDelete) {
                                        swal("Berhasil logout", {
                                            icon: "success",
                                        });
                                        window.location.href = "logoutServlet";
                                    }
                                });
                    }

                    function logins() {
                        swal({
                            title: "Berhasil login",
                            icon: "success",
                            buttons: true,
                        })
                        window.location.href = "loginServlet";
                    }
                </script>
            </div>
        </div>
    </body>
</html>
