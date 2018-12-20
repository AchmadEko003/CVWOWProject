<%-- 
    Document   : adminView
    Created on : Dec 15, 2018, 1:57:59 PM
    Author     : Nitani
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="entities.LowonganPekerjaan"%>
<%@page import="controllers.LokerController"%>
<%@page import="interfaces.LokerInterface"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="tools.HibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

    </head>
    <body>



        <div class="container mt-5">
            <div class="card shadow p-3 bg-white rounded">
                <h5>Data Lowongan Pekerjaan</h5>

                <div class="container form-group">
                    <a class="btn btn-info" id="detail" data-toggle="modal" data-target="#lowonganModal" 
                       value="" >Insert</a>
                </div>

                <div class="modal fade" id="lowonganModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-body">
                                <%@include file="lowonganFormView.jsp" %>
                            </div>
                        </div>
                    </div>
                </div>

                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Judul</th>
                            <th scope="col">Deskripsi</th>
                            <th scope="col">Admin</th>
                            <th scope="col">Requirements</th>
                            <th scope="col">Tanggal Mulai</th>
                            <th scope="col">Tanggal Selesai</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <%  SessionFactory factorys = HibernateUtil.getSessionFactory();
                                LokerInterface sis = new LokerController(factorys);
                                DateFormat formats = new SimpleDateFormat("d MMMM yyyy", Locale.ENGLISH);
                                for (Object serti : sis.search("")) {
                                    LowonganPekerjaan sert = (LowonganPekerjaan) serti;
                                    Date hire = sert.getTanggalMulai();
                                    Date selesai = sert.getTanggalSelesai();%>
                            <th scope="row"><%= sert.getId()%></th>
                            <td><%= sert.getJudul()%></td>
                            <td><%= sert.getDeskripsi()%></td>
                            <td><%= sert.getUserId().getUsername()%></td>
                            <td><%= sert.getRequirementsId().getNama()%></td>
                            <td><%= formats.format(hire)%></td>
                            <td><%= formats.format(selesai)%></td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
