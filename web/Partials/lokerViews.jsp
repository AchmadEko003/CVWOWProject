<%-- 
    Document   : lokerViews
    Created on : Dec 13, 2018, 8:49:40 PM
    Author     : Nitani
--%>

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

    </head>
    <body class="bg-light">
        <nav class="navbar navbar-expand-lg navbar-dark bg-info sticky-top">
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
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#keahlianModal">Keahlian</a>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#sertifikatModal">Sertifikat</a>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#projectModal">Project</a>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#pengalamanModal">Pengalaman</a>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#riwayatPendidikanModal">Pendidikan</a>
                            </div>
                        </div>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="Partials/lokerViews.jsp">Lowongan Kerja</a>
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
                            <a href="../applyLokerServlet?id=<%= lowker.getId()%>" class="card-link" data-toggle="modal" data-target="#cvModal">Apply</a>
                        </div>
                    </div>
                    <% }%>
                </div>

                <!-- Modal Keahlian -->
<!--                <div class="modal fade" id="cvModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-body">
                                <%@include file="User/applyView.jsp" %>
                            </div>
                        </div>
                    </div>
                </div>-->
            </div>
        </div>
    </body>
</html>
