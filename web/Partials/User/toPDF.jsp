<%-- 
    Document   : toPDF
    Created on : Dec 18, 2018, 3:50:12 AM
    Author     : Nitani
--%>

<%@page import="controllers.ProjectController"%>
<%@page import="entities.Project"%>
<%@page import="interfaces.ProjectInterface"%>
<%@page import="entities.Keahlian"%>
<%@page import="controllers.KeahlianController"%>
<%@page import="interfaces.KeahlianInterface"%>
<%@page import="controllers.PengalamanController"%>
<%@page import="interfaces.PengalamanInterface"%>
<%@page import="entities.Pengalaman"%>
<%@page import="entities.RiwayatPendidikan"%>
<%@page import="controllers.PendidikanController"%>
<%@page import="interfaces.PendidikanInterface"%>
<%@page import="controllers.SertifikatController"%>
<%@page import="entities.Sertifikat"%>
<%@page import="interfaces.SertifikatInterface"%>
<%@page import="tools.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="entities.UserProfile"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

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

        
    </head>
    <body id="target">
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
        <div id="content">
            <h3>Hello, this is <%= namas%> (<%= umurs%>)</h3>

            <h5><i class="fas fa-award"></i> Sertifikat</h5><br>
            <% SertifikatInterface sis = new SertifikatController(factorys);
                for (Object serti : sis.search(r.getId().toString())) {
                    Sertifikat sert = (Sertifikat) serti;%>
            <p class="mb-1"> <%= sert.getNama()%> </p>
            <footer class="blockquote-footer"><%= sert.getLembaga()%></footer>
            <% } %><hr>
            <h5><i class="fas fa-graduation-cap"></i> Pendidikan</h5>
            <div class="card-body">
                <% PendidikanInterface pni = new PendidikanController(factorys);
                    for (Object pendi : pni.search(r.getId().toString())) {
                        RiwayatPendidikan pe = (RiwayatPendidikan) pendi;%>
                <h5> <%= pe.getUniversitasId().getNama()%></h5>
                <p class="blockquote-footer"> <%= pe.getJurusanId().getNama()%> | <%= pe.getIpk()%></p>
                <% } %>
            </div><hr

                <h5><i class="fas fa-briefcase"></i> Pengalaman</h5>
            <% PengalamanInterface pi = new PengalamanController(factorys);
                for (Object pengalaman : pi.search(r.getId().toString())) {
                    Pengalaman peng = (Pengalaman) pengalaman;%>
            <h5> <%= peng.getPerusahaan()%> (<%= peng.getPosisi()%>)</h5>
            <p> <%= peng.getDeskripsi()%> </p>
            <footer class="blockquote-footer"> <%= peng.getMulaiBekerja()%> sampai <%= peng.getSelesaiBekerja()%></footer>
            <% } %><hr>

            <h5><i class="fas fa-sliders-h"></i> Keahlian</h5>
            <% KeahlianInterface ki = new KeahlianController(factorys);
                for (Object keahlian : ki.search(r.getId().toString())) {
                    Keahlian keh = (Keahlian) keahlian;%>
            <h5><%= keh.getNama()%></h5>
            <p class="blockquote-footer"> <%= keh.getDeskripsi()%> </p>
            <% }%><hr>

            <h5><i class="fas fa-tasks"></i> Project</h5>
            <% ProjectInterface proi = new ProjectController(factorys);
                for (Object o : proi.search(r.getId().toString())) {
                    Project pro = (Project) o;%>
            <h5 class="card-title"><%= pro.getNama()%> (<%= pro.getStatus()%>)</h5>
            <p class="card-text"><%= pro.getDeskripsi()%></p>
            <% }%>

        </div>
        <button id="cmd">generate PDF</button>
        <button onclick="sweet()">wahaha</button>
<script>
            function sweet() {
                swal("Good job!", "You clicked the button!", "success");
            }
        </script>
    </body>
</html>
