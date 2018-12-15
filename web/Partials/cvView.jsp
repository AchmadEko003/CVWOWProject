<%-- 
    Document   : cvView
    Created on : Dec 13, 2018, 8:41:00 PM
    Author     : Nitani
--%>

<%@page import="controllers.UserProfileController"%>
<%@page import="interfaces.UserProfileInterface"%>
<%@page import="tools.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="java.util.Base64"%>
<%@page import="entities.UserProfile"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% String namas = "", umurs = "", alamats = "", tglLahirs = "", telps = "";
            if (session.getAttribute("profile") != null) {
                UserProfile r = (UserProfile) session.getAttribute("profile");
                namas = r.getNama();
                umurs = String.valueOf(r.getUmur());
                alamats = r.getAlamat();
                tglLahirs = r.getTanggalLahir().toString();
                telps = String.valueOf(r.getNoTelpon());
            }
        %>
        <%--<%@include file="header.jsp" %>--%>
        <div class="container">
            <div class="row">
                <!--Profile singkat sisi kiri-->
                <div class="col-sm-4">
                    <div class="card shadow p-3 mb-3 bg-white rounded mt-3" style="width: 22rem;">
                        <img src="../Assets/Foto 3x4 Eko.jpg" class="card-img-top" alt="Card image cap">
                        <div class="card-body">
                            <h3 class="card-title"><%= namas%></h3>
                            <ul class="list-group">
                                <li>Umur : <%= umurs %></li>
                                <li>Tanggal Lahir : <%= tglLahirs %></li>
                                <li>Telepon : <%= telps %></li>
                                <li>Alamat : <%= alamats %></li>
                            </ul>
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
                            <a href="#" class="card-link" data-toggle="modal" data-target="#cvModal">Card link</a>
                            <a href="#" class="card-link">Another link</a>
                        </div>
                    </div>
                    <hr class="d-sm-none">
                    <br>
                </div>
                <div class="col-sm-8">
                    <div class="card shadow p-3 mb-3 bg-white rounded" style="margin-top: 10px;">
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
                    <div class="card shadow p-3 mb-3 bg-white rounded" style="margin-top: 10px;">
                        <div class="card-header">
                            <h3><i class="fas fa-briefcase"></i> Pengalaman</h3>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">Light card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                    </div>
                    <div class="card shadow p-3 mb-3 bg-white rounded" style="margin-top: 10px;">
                        <div class="card-header">
                            <h3><i class="fas fa-sliders-h"></i> Keahlian</h3>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">Light card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                    </div>
                    <div class="card shadow p-3 mb-3 bg-white rounded" style="margin-top: 10px;">
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
    </body>
</html>
