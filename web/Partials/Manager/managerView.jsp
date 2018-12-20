<%-- 
    Document   : managerView
    Created on : Dec 19, 2018, 8:21:42 PM
    Author     : Nitani
--%>

<%@page import="entities.Apply"%>
<%@page import="controllers.ApplyController"%>
<%@page import="interfaces.ApplyInterface"%>
<%@page import="entities.User"%>
<%@page import="tools.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
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
    <body>
        <% String idUser = "", emails = "", role = "", decodedUrl = "";
            SessionFactory factory = HibernateUtil.getSessionFactory();
            if (session.getAttribute("userData") != null) {
                User r = (User) session.getAttribute("userData");
                idUser = r.getId().toString();
                out.print(idUser);
            }
        %>
        <div class="container" style="margin-bottom: 60px">
            <div class="row">

                <div>
                    <h5>Data Lowongan Pekerjaan</h5>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Kandidat</th>
                                <th scope="col">Lowongan</th>
                                <th scope="col">Deskripsi</th>
                                <th scope="col">Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%  ApplyInterface aiManager = new ApplyController(factory);
                                for (Object userApplyV : aiManager.search("")) {
                                    Apply idApplyUser = (Apply) userApplyV;%>
                            <tr>
                                <td scope="row"><%= idApplyUser.getUserId().getUsername() %></td>
                                <td><%= idApplyUser.getLowonganId().getJudul()%></td>
                                <td><%= idApplyUser.getLowonganId().getDeskripsi()%></td>
                                <td><%= idApplyUser.getStatus()%></td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                </div>

                <footer class="fixed-bottom">
                    <nav class="navbar navbar-expand-lg navbar-dark bg-info fixed-bottom">
                        <div class="container">
                            <p class="text-light">&copy; 2018 Mitra Integrasi Informatika. All rights reserved.</p>
                        </div>
                    </nav>
                </footer>
            </div>
        </div>
    </body>
</html>
