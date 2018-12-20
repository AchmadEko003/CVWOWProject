<%-- 
    Document   : userProfileViews
    Created on : Dec 13, 2018, 10:38:27 PM
    Author     : Nitani
--%>

<%@page import="entities.UserProfile"%>
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
        <%
            String namaa = "";
            String umur = "";
            String alamat = "";
            String ttl = "";
            String telp = "";
            String countryId = "";
            if (session.getAttribute("profileUser") != null) {
                UserProfile l = (UserProfile) session.getAttribute("profileUser");
                namaa = l.getNama();
                umur = String.valueOf(l.getUmur());
                alamat = l.getAlamat();
                ttl = l.getTanggalLahir().toString();
                telp = String.valueOf(l.getNoTelpon());
            }
        %>
        <div class="container">
            <form method="POST" action="addProfileServlet">
                <div class="form-group">
                    <!--<i class="fas fa-user"></i>-->
                    <label for="exampleInputEmail1">Name</label>
                    <input name="nama" type="text" class="form-control" aria-describedby="name" placeholder="Nama">
                </div>
                <div class="form-group">
                    <!--<i class="fas fa-envelope"></i>-->
                    <label for="exampleInputEmail1">Umur</label>
                    <input name="umur" type="text" class="form-control" aria-describedby="emailHelp" placeholder="Umur">
                </div>
                <div class="form-group">
                    <!--<i class="fas fa-lock"></i>-->
                    <label for="exampleInputPassword1">alamat</label>
                    <textarea name="alamat" class="form-control" placeholder="Alamat"></textarea>
                </div>
                <div class="form-group">
                    <!--<i class="fas fa-lock"></i>-->
                    <label for="exampleInputPassword1">Tanggal lahir</label>
                    <input name="tglLahir" type="date" class="form-control">
                </div>
                <div class="form-group">
                    <!--<i class="fas fa-lock"></i>-->
                    <label for="exampleInputPassword1">No Telp</label>
                    <input name="telp" type="text" class="form-control" placeholder="Nomor Telepon">
                </div>
                <div class="form-group">
                    <!--<i class="fas fa-lock"></i>-->
                    <label for="exampleInputPassword1">Foto</label>
                    <input name="foto" type="file" maxlength="100" class="form-control-file"  aria-describedby="fileHelp">
                </div>
                <div class="form-group">
                    <!--<i class="fas fa-lock"></i>-->
                    <label for="exampleInputPassword1">CV</label>
                    <input name="cv" type="file" class="form-control-file" aria-describedby="fileHelp">
                </div>
                <div class="form-group">
                    <!--<i class="fas fa-lock"></i>-->
                    <label for="exampleInputPassword1">KTP</label>
                    <input name="ktp" type="file" class="form-control-file" aria-describedby="fileHelp">
                </div>
                <div class="form-group">
                    <input type="submit" class="btn btn-info btn-lg btn-block" value="Submit">
                </div>
            </form>
        </div>
    </body>
</html>
