<%-- 
    Document   : cvView
    Created on : Dec 13, 2018, 8:41:00 PM
    Author     : Nitani
--%>

<%@page import="entities.BahasaLang"%>
<%@page import="controllers.BahasaLangController"%>
<%@page import="interfaces.BahasaLangInterface"%>
<%@page import="entities.Project"%>
<%@page import="controllers.ProjectController"%>
<%@page import="interfaces.ProjectInterface"%>
<%@page import="entities.RiwayatPendidikan"%>
<%@page import="controllers.PendidikanController"%>
<%@page import="interfaces.PendidikanInterface"%>
<%@page import="entities.Keahlian"%>
<%@page import="controllers.KeahlianController"%>
<%@page import="interfaces.KeahlianInterface"%>
<%@page import="entities.Pengalaman"%>
<%@page import="controllers.PengalamanController"%>
<%@page import="interfaces.PengalamanInterface"%>
<%@page import="entities.Sertifikat"%>
<%@page import="controllers.SertifikatController"%>
<%@page import="interfaces.SertifikatInterface"%>
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
        <!--Import to PDF-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script type="text/javascript" src="https://code.jquery.com/ui/1.12.0-beta.1/jquery-ui.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.1.135/jspdf.min.js"></script>
        <script type="text/javascript" src="http://cdn.uriit.ru/jsPDF/libs/adler32cs.js/adler32cs.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2014-11-29/FileSaver.min.js"></script>
        <script type="text/javascript" src="libs/Blob.js/BlobBuilder.js"></script>
        <script type="text/javascript" src="http://cdn.immex1.com/js/jspdf/plugins/jspdf.plugin.addimage.js"></script>
        <script type="text/javascript" src="http://cdn.immex1.com/js/jspdf/plugins/jspdf.plugin.standard_fonts_metrics.js"></script>
        <script type="text/javascript" src="http://cdn.immex1.com/js/jspdf/plugins/jspdf.plugin.split_text_to_size.js"></script>
        <script type="text/javascript" src="http://cdn.immex1.com/js/jspdf/plugins/jspdf.plugin.from_html.js"></script>
        <script type="text/javascript" src="js/basic.js"></script>
        <script>
            $(function () {

                var specialElementHandlers = {
                    '#editor': function (element, renderer) {
                        return true;
                    }
                };
                $('#cmd').click(function () {
                    var doc = new jsPDF();
                    doc.fromHTML(
                            $('#target').html(), 15, 15,
                            {'width': 170, 'elementHandlers': specialElementHandlers},
                            function () {
                                doc.save('sample-file.pdf');
                            }
                    );

                });
            });
        </script>
        
        //Give rating
        <script>
            $(function () {
                var current_progress = document.getElementById("myText").value;
                var interval = setInterval(function () {
//                    current_progress += 10;
                    $("#rating")
                            .css("width", current_progress + "%")
                            .attr("aria-valuenow", current_progress)
                            .text(current_progress);
                    if (current_progress >= 100)
                        clearInterval(interval);
                }, 1000);
            });
        </script>
    </head>
    <body  id="target">
        <% String namas = "", umurs = "", alamats = "", tglLahirs = "", telps = "";
            UserProfile r = (UserProfile) session.getAttribute("profile");
            SessionFactory factorys = HibernateUtil.getSessionFactory();
            if (session.getAttribute("profile") != null) {
                namas = r.getNama();
                umurs = String.valueOf(r.getUmur());
                alamats = r.getAlamat();
                tglLahirs = r.getTanggalLahir().toString();
                telps = String.valueOf(r.getNoTelpon());
            }
        %>
        <div class="container">
            <div class="row">
                <!--Profile singkat sisi kiri-->
                <div class="col-sm-4">
                    <div class="card shadow p-3 mb-3 bg-white rounded mt-3" style="width: 22rem;">
                        <img src="Assets/MII-logo.png" class="card-img-top">
                        <div class="card-body">
                            <h4 class="card-title">Hi , saya <%= namas%></h4>
                            <footer class="blockquote-footer"><a href="#" data-toggle="modal" data-target="#userModal">Edit profile</a></footer>
                            <p class="mb-1"><i class="fas fa-baby"></i> <%= umurs%> Tahun</p>
                            <p class="mb-1"><i class="fas fa-calendar-day"></i> <%= tglLahirs%></p>
                            <p class="mb-1"><i class="fas fa-phone-square"></i> <%= telps%></p>
                            <p><i class="fas fa-address-card"></i> <%= alamats%></p>
                        </div>
                        <div class="modal fade" id="userModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-body">
                                        <%@include file="../User/userProfileViews.jsp" %>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">
                                <h5><i class="fas fa-language"></i> Bahasa</h5>
                                <% BahasaLangInterface bhsl = new BahasaLangController(factorys);
                                    for (Object bahas : bhsl.search(r.getId().toString())) {
                                        BahasaLang bhs = (BahasaLang) bahas;%>
                                <p><%= bhs.getIdBahasa().getNama()%></p>
                                <input type="hidden" id="myText" value="<%= bhs.getRate()%>">
                                <div class="progress">
                                    <div id="rating" class="progress-bar bg-success" role="progressbar" style="width: 0%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <% } %>
                            </li>
                            <li class="list-group-item">
                                <h5><i class="fas fa-award"></i> Sertifikat</h5>
                                <% SertifikatInterface sis = new SertifikatController(factorys);
                                    for (Object serti : sis.search(r.getId().toString())) {
                                        Sertifikat sert = (Sertifikat) serti;%>
                                <p class="mb-1"> <%= sert.getNama()%> </p>
                                <footer class="blockquote-footer"><%= sert.getLembaga()%></footer>
                                    <% } %>
                            </li>
                        </ul>
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
                            <% PendidikanInterface pni = new PendidikanController(factorys);
                                for (Object pendi : pni.search(r.getId().toString())) {
                                    RiwayatPendidikan pe = (RiwayatPendidikan) pendi;%>
                            <h5> <%= pe.getUniversitasId().getNama()%></h5>
                            <p class="blockquote-footer"> <%= pe.getJurusanId().getNama()%> | <%= pe.getIpk()%></p>
                            <% } %>
                        </div>
                    </div>
                    <div class="card shadow p-3 mb-3 bg-white rounded" style="margin-top: 10px;">
                        <div class="card-header">
                            <h3><i class="fas fa-briefcase"></i> Pengalaman</h3>
                        </div>
                        <div class="card-body">
                            <% PengalamanInterface pi = new PengalamanController(factorys);
                                for (Object pengalaman : pi.search(r.getId().toString())) {
                                    Pengalaman peng = (Pengalaman) pengalaman;%>
                            <h5> <%= peng.getPerusahaan()%> (<%= peng.getPosisi()%>)</h5>
                            <p> <%= peng.getDeskripsi()%> </p>
                            <footer class="blockquote-footer"> <%= peng.getMulaiBekerja()%> sampai <%= peng.getSelesaiBekerja()%></footer>
                                <% } %>
                        </div>
                    </div>
                    <div class="card shadow p-3 mb-3 bg-white rounded" style="margin-top: 10px;">
                        <div class="card-header">
                            <h3><i class="fas fa-sliders-h"></i> Keahlian</h3>
                        </div>
                        <div class="card-body">
                            <% KeahlianInterface ki = new KeahlianController(factorys);
                                for (Object keahlian : ki.search(r.getId().toString())) {
                                    Keahlian keh = (Keahlian) keahlian;%>
                            <h5><%= keh.getNama()%></h5>
                            <p> <%= keh.getDeskripsi()%> </p>
                            <% }%>
                        </div>
                    </div>
                    <div class="card shadow p-3 bg-white rounded" style="margin-top: 10px; margin-bottom: 80px">
                        <div class="card-header">
                            <h3><i class="fas fa-tasks"></i> Project</h3>
                        </div>
                        <div class="card-body">
                            <% ProjectInterface proi = new ProjectController(factorys);
                                for (Object o : proi.search(r.getId().toString())) {
                                    Project pro = (Project) o;%>
                            <h5 class="card-title"><%= pro.getNama()%> (<%= pro.getStatus()%>)</h5>
                            <p class="card-text"><%= pro.getDeskripsi()%></p>
                            <% }%>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
