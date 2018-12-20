<%-- 
    Document   : userView
    Created on : 19 Des 18, 20:34:11
    Author     : NEZIA
--%>

<%@page import="entities.UserProfile"%>
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
                    Daftar Yang Sudah Di Apply
                </h3>

            </div>

            <div class="container">
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                    <table class="table table-bordered table100">
                        <thead>        
                            <tr>
                                <th>Judul Lowongan</th>                       
                                <th>Tanggal Berakhir</th>
                                <th>Deskripsi Pekerjaan</th>
                                <th>Status</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <% SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
                                ApplyInterface ai = new ApplyController(sessionFactory);
                                for (Object object : ai.getByIdd(new Apply(), "6")) {
                                    Apply a1 = (Apply) object;
                                    System.out.println(a1.getStatus());                               
                            %>
                            <tr>
                                <td><%= a1.getLowonganId().getJudul()%></td>
                                <td><%= a1.getLowonganId().getTanggalSelesai()%></td>
                                <td><%= a1.getLowonganId().getDeskripsi()%></td>                      
                                <td><%= a1.getStatus()%></td>
                                <td><a class="btn btn-default" href="detailsuser.jsp?id=<%=a1.getId()%>">Details</a></td>

                                <%
                                    }
                                %>
                            </tr>
                        </tbody>
                    </table>
            </div>
        </section>
    </body>
</html>
