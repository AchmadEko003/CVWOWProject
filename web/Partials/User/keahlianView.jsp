<%-- 
    Document   : keahlianView
    Created on : Dec 16, 2018, 9:40:24 PM
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
            <form method="POST" action="../addKealhianServlet">
                <div class="form-group">
                    <label for="exampleInputEmail1">Keahlian</label>
                    <input name="keahlian" type="text" class="form-control" id="exampleInputEmail1" placeholder="Keahlian">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Deskripsi</label>
                    <textarea name="deskripsi" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </body>
</html>
