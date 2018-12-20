<%-- 
    Document   : userView
    Created on : 19 Des 18, 20:34:11
    Author     : NEZIA
--%>

<%@page import="entities.UserProfile"%>
<%@page import="controllers.UserProfileController"%>
<%@page import="interfaces.UserProfileInterface"%>
<%@page import="controllers.ApplyController"%>
<%@page import="interfaces.ApplyInterface"%>
<%@page import="entities.Apply"%>
<%@page import="controllers.JurusanController"%>
<%@page import="interfaces.JurusanInterface"%>
<%@page import="tools.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <title>JSP Page</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
    </head>


    <body>
        <section class="content">
            <div class="container" align="center">
                <h3 class="display-4">
                    Details
                </h3>

            </div>

            <div class="container">
                <!--<table class="table table-bordered table100">-->
                <thead>
                    <tr>
                    </tr>
                </thead>
                <tbody>
                    <% SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
                        ApplyInterface ai = new ApplyController(sessionFactory);
                        String id = request.getParameter("id");
                        Object ob = ai.getById(id);
                        {
                            Apply a = (Apply) ob;
                    %>
                <tr>  
                <ul class="list-group list-group-flush">
                    <li class="list-group-item"><td>Judul Lowongan : <%= a.getLowonganId().getJudul()%></td></li>                      
                    <li class="list-group-item"><td>Deskripsi Pekerjaan : <%= a.getLowonganId().getDeskripsi()%></td></li>
                    <li class="list-group-item"><td>Tanggal Mulai : <%= a.getLowonganId().getTanggalMulai()%></td></li>
                    <li class="list-group-item"><td>Tanggal Berakhir : <%= a.getLowonganId().getTanggalSelesai()%></td></li>
                    <li class="list-group-item"><td>Requirements : <%= a.getLowonganId().getRequirementsId().getNama()%></td></li>
                    <li class="list-group-item"><td>Status : <%= a.getStatus()%></td></li>
                    <%
                        }
                    %>
                    </tr>
                    </tbody>
                    <!--</table>-->
                    </div>
                    </section>
                    </body>
                    </html>
