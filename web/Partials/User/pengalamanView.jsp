<%-- 
    Document   : pengalamanView
    Created on : Dec 16, 2018, 9:40:08 PM
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
            <form method="POST" action="addPengalamanView">
                <div class="form-group">
                    <label for="exampleInputPassword1">Deskripsi</label>
                    <textarea name="deskripsi" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Perusahaan</label>
                    <input name="perusahaan" type="text" class="form-control" id="exampleInputEmail1">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Posisi</label>
                    <input name="posisi" type="text" class="form-control" id="exampleInputEmail1">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Mulai Bekerja</label>
                    <input name="mulaiBekerja" type="date" class="form-control" id="exampleInputEmail1">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Selesai Bekerja</label>
                    <input name="selesaiBekerja" type="date" class="form-control" id="exampleInputEmail1">
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </body>
</html>
