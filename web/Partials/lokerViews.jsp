<%-- 
    Document   : lokerViews
    Created on : Dec 13, 2018, 8:49:40 PM
    Author     : Nitani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body class="bg-light">
        <div class="container">
            <div class="row">
                <!--Profile singkat sisi kiri-->
                <div class="col-sm-3">
                    <div class="card shadow p-3 mb-5 bg-white rounded mt-2">
                        <div class="text-center mt-4">
                            <img src="./Assets/Foto 3x4 Eko.jpg" class="rounded-circle" alt="Card image cap" width="180" height="180">
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">Nama</h5>
                            <p class="card-text">Profil singkat</p>
                        </div>
                        <hr>
                        <div class="card-body">
                            <a href="#" class="card-link" data-toggle="modal" data-target="#cvModal">Card link</a>
                            <a href="#" class="card-link">Another link</a>
                        </div>

                    </div>
                    <hr class="d-sm-none">
                    <br>
                </div>
                <div class="col-sm-9">
                    <div class="card shadow p-3 mb-3 bg-white rounded" style="margin-top: 10px;">
                        <div class="card-header">
                            <h3>Judul Lowongan</h3>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">Perusahaan</h5>
                            <p class="card-text">Deskripsi</p>
                            <footer class="blockquote-footer">Waktu berahir <cite title="Source Title">tanggal</cite></footer>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
