<%-- 
    Document   : adminView
    Created on : Dec 13, 2018, 2:04:54 PM
    Author     : Igaz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-3 bg-dark">
                    <div class="card" style="width: 18rem;">
                        <img class="card-img-top" src="../assets/paris.jpg" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">Admin Panel</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                        <div class="list-group" class="card-body">
                            <a href="ya" class="list-group-item list-group-item-action">Pendidikan</a>
                            <a href="#" class="list-group-item list-group-item-action">Keahlian</a>
                            <a href="#" class="list-group-item list-group-item-action">Pencapaian</a>
                            <a href="#" class="list-group-item list-group-item-action">Bahasa</a>
                            <a href="#" class="list-group-item list-group-item-action">Pengalaman Kerja</a>
                        </div>
                        <div class="card-body">
                            <a href="#" class="card-link">Card link</a>
                            <a href="#" class="card-link">Another link</a>
                        </div>
                    </div>

                </div>
                <div class="col-sm-9 bg-light">
                    <div class="card" id="ya">
                        <div height="20px" class="card-header" >Kelola data Universitas dan Jurusan</div>
                        <div class="card-body">Content
                            <br
                                <br>
                            <br>
                            <br>
                        test</div> 
                        <div class="card-footer">Footer</div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
