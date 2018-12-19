<%-- 
    Document   : managerView
    Created on : Dec 19, 2018, 8:52:09 AM
    Author     : Igaz
--%>

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
                <h1 class="display-4">
                    Lihat daftar apply
                </h1>

            </div>

            <div class="container">
                <table class="table table-bordered table100">
                    <thead>
                        <tr>
                            <th>Nama</th>
                            <th>Lowongan</th>
                            <th>Admin</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>


                        <% SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
                            ApplyInterface ai = new ApplyController(sessionFactory);
                            for (Object object : ai.search("")) {
                                Apply j = (Apply) object;
                                
                        %>
                        <tr>
                            <td><%= j.getUserId().getUsername()%></td>
                            <td><%= j.getLowonganId().getJudul()%></td>
                            <td><%= j.getLowonganId().getUserId().getUsername()%></td>
                            <td><%= j.getStatus()%></td>
                            


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
