<%-- 
    Document   : JurusanView
    Created on : Dec 14, 2018, 10:30:44 AM
    Author     : Igaz
--%>

<%@page import="entities.Jurusan"%>
<%@page import="controllers.JurusanController"%>
<%@page import="interfaces.JurusanInterface"%>
<%@page import="tools.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin - Kelola Pendidikan</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

    </head>
    <body>
        <div class="container" align="center">
            <h1 class="display-4">
                Kelola Jurusan
            </h1>

        </div>
        <div class="container form-group">
            <a class="btn btn-info" id="detail" data-toggle="modal" data-target="#jurusanModal" 
               value="" >Insert</a>
        </div>

        <!-- Modal pendidikan-->
        <div class="modal fade" id="jurusanModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Kelola Jurusan</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="../AddJurusan" method="POST">
                            <div class="form-group">
                                <label for="pwd">Input Jurusan:</label>
                                <input type="text" class="form-control" name="nama" id="ipk">
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary" id="btnSave" name="">Save changes</button>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <table class="table table-bordered table100">
                <thead>
                    <tr>
                        <th>Jurusan</th>
                        <th colspan="2">Aksi</th>
                    </tr>
                </thead>
                <tbody>


                    <% SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
                        JurusanInterface ji = new JurusanController(sessionFactory);
                        for (Object object : ji.search("")) {
                            Jurusan j = (Jurusan) object;
                            
                    %>
                    <tr>
                        <td><%= j.getNama()%></td>

                        <td><a class="btn btn-info" id="detail" data-toggle="modal" data-target="#jurusanModal" 
                               value="<%= j.getId()%>" >Edit</a></td>
                        <td><a href="../deleteJurusan?id=<%= j.getId()%>" class="btn btn-warning"
                               onclick="return confirm('Are you sure to delete this data?');">Delete</a></td>

                        <%
                            }
                        %>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>
