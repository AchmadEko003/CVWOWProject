<%-- 
    Document   : lowonganFormView
    Created on : Dec 15, 2018, 11:33:11 PM
    Author     : Nitani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <form method="POST" action="../../tambahLowonganServlet">
                <div class="form-group">
                    <i class="fas fa-user"></i>
                    <label for="exampleInputEmail1">Judul</label>
                    <input name="judul" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="name" placeholder="Name">
                </div>
                <div class="form-group">
                    <i class="fas fa-lock"></i>
                    <label for="exampleInputPassword1">Deskripsi</label>
                    <textarea name="deskripsi" class="form-control" id="exampleInputPassword1" placeholder="Password"></textarea>
                </div>
                <div class="form-group">
                    <i class="fas fa-lock"></i>
                    <label for="exampleInputPassword1">Requirements</label>
                    <input name="req" type="text" class="form-control" id="exampleInputPassword1" placeholder="Confirm Password">
                </div>
                <div class="form-group">
                    <i class="fas fa-lock"></i>
                    <label for="exampleInputPassword1">Tanggal Selesai</label>
                    <input name="tglSelesai" type="date" class="form-control" id="exampleInputPassword1" placeholder="Confirm Password">
                </div>
                <div class="form-group">
                    <input type="submit" class="btn btn-info btn-lg btn-block">Tambah <i class="fab fa-telegram-plane"></i>
                </div>
            </form>
        </div>
    </body>
</html>
