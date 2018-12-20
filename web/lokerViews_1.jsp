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
        
        <div class="container" style="margin-bottom: 70px">
            <div class="row">

                <div>
                    <% SessionFactory factory = HibernateUtil.getSessionFactory();
                        LokerInterface li = new LokerController(factory);
                        DateFormat formats = new SimpleDateFormat("d MMMM yyyy", Locale.ENGLISH);
                        for (Object loker : li.search()) {
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
                        </div>
                    </div>
                    <% }%>
                </div>
            </div>
        </div>
    </body>
</html>
