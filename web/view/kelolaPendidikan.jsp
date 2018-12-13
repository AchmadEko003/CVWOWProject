<%-- 
    Document   : kelolaPendidikan
    Created on : Dec 13, 2018, 3:04:26 PM
    Author     : Igaz
--%>

<%@page import="tools.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin - Kelola Pendidikan</title>
    </head>
    <body>
        <div class="container" align="center">
            <h1 class="display-2">
                Kelola Pendidikan
            </h1>

        </div>
        <div class="container">
            <a class="btn btn-info" id="detail" data-toggle="modal" data-target="#pendidikanModal" 
               value="" >Insert</a>
        </div>

        <!-- Modal pendidikan-->
        <div class="modal fade" id="pendidikanModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Pendidikan</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="pwd">Input Universitas:</label>
                            <input type="text" class="form-control" id="ipk">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>

        <table class="table table-bordered table100">
            <thead>
                <tr>
                    <th>Nama Universitas</th>
                    <th colspan="2">Aksi</th>
                </tr>
            </thead>
            <tbody>
                <!--                    ini query session dan fore-->
                <tr>
                    <!--                        <td></td> ini query .getUnivId-->


                    <td><a class="btn btn-info" id="detail" data-toggle="modal" data-target="#myModal" 
                           value="" >Edit</a></td>
                    <td><a class="btn btn-warning" id="details" data-toggle="modal"
                           value="" >Delete</a></td>

                </tr>
            </tbody>
        </table>
    </body>
</html>
