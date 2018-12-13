<%-- 
    Document   : dropdownCv
    Created on : Dec 13, 2018, 11:26:19 AM
    Author     : Igaz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CV Online</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

    </head>
    <body>
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
            <!-- Brand -->
            <a class="navbar-brand" href="#">Logo</a>

            <!-- Links -->
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Profil</a>
                </li>

                <!-- Dropdown -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                        Isi CV
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="#">Pendidikan</a>
                        <a class="dropdown-item" href="#">Link 2</a>
                        <a class="dropdown-item" href="#">Link 3</a>
                    </div>
                </li>
            </ul>
        </nav>
        <br>
        <br>
        <div class="float-sm-left" padding-left="10px">
            <div class="dropdown">
                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                    Isi CV
                </button>
                <div class="dropdown-menu">
                    <a class="dropdown-item" data-toggle="modal" data-target="#pendidikanModal">Pendidikan</a>
                    <a class="dropdown-item" data-toggle="modal" data-target="#keahlianModal">Keahlian</a>
                    <a class="dropdown-item" data-toggle="modal" data-target="#pencapaianModal">Pencapaian</a>
                    <a class="dropdown-item" data-toggle="modal" data-target="#bahasaModal">Bahasa</a>
                    <a class="dropdown-item" data-toggle="modal" data-target="#pengalamanModal">Pengalaman Kerja</a>
                </div>
            </div>
        </div><br>


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
                            <label for="sel1">Universitas:</label>
                            <select class="form-control" id="univ">
                                <option>UB</option>
                                <option>UMY</option>
                                <option>AMIKOM</option>
                                <option>UI</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="sel1">Jurusan:</label>
                            <select class="form-control" id="jur">
                                <option>IT</option>
                                <option>Kedokteran</option>
                                <option>Hukum</option>
                                <option>Ekonomi</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="pwd">IPK:</label>
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

        <!--modal keahlian-->
        <div class="modal fade" id="keahlianModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Keahlian</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="sel1">Keahlian:</label>
                            <select class="form-control" id="skill">
                                <option>C#</option>
                                <option>Java</option>
                                <option>PHP</option>
                                <option>Microsoft Office</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="comment">Deskripsi:</label>
                            <textarea class="form-control" rows="5" id="desk"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>

        <!--modal pencapaian-->
        <div class="modal fade" id="pencapaianModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Pencapaian</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="pwd">Pencapaian:</label>
                            <input type="text" class="form-control" id="pencapaian">
                        </div>
                        <div class="form-group">
                            <label for="comment">Deskripsi:</label>
                            <textarea class="form-control" rows="5" id="desk"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
        <!--modal bahasa-->
        <div class="modal fade" id="bahasaModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Bahasa</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="sel1">Bahasa:</label>
                            <select class="form-control" id="bhs">
                                <option>Indonesia</option>
                                <option>Inggris</option>
                                <option>Perancis</option>
                                <option>Mandarin</option>
                                <option>Jepang</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
        <!--modal pengalaman-->
        <div class="modal fade" id="pengalamanModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Pengalaman Kerja</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="pwd">Posisi:</label>
                            <input type="text" class="form-control" id="pos">
                        </div>
                        <div class="form-group">
                            <label for="pwd">Perusahaan:</label>
                            <input type="text" class="form-control" id="prshn">
                        </div>
                        <div class="form-group">
                            <label for="comment">Deskripsi:</label>
                            <textarea class="form-control" rows="5" id="desk"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="pwd">Tanggal Mulai Bekerja</label>
                            <input type="date" class="form-control" id="tglstrt">
                        </div>
                        <div class="form-group">
                            <label for="pwd">Tanggal selesai Bekerja</label>
                            <input type="date" class="form-control" id="tglsls">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
