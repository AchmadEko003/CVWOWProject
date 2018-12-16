<%-- 
    Document   : dropdownCv
    Created on : Dec 13, 2018, 11:26:19 AM
    Author     : Igaz
--%>

<%@page import="entities.Bahasa"%>
<%@page import="controllers.BahasaController"%>
<%@page import="interfaces.BahasaInterface"%>
<%@page import="entities.Requirements"%>
<%@page import="controllers.ReqController"%>
<%@page import="interfaces.ReqInterface"%>
<%@page import="entities.Universitas"%>
<%@page import="controllers.UniversitasController"%>
<%@page import="interfaces.UniversitasInterface"%>
<%@page import="entities.Jurusan"%>
<%@page import="controllers.JurusanController"%>
<%@page import="interfaces.JurusanInterface"%>
<%@page import="controllers.PendidikanController"%>
<%@page import="interfaces.PendidikanInterface"%>
<%@page import="tools.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
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
        <div class="float-sm-right">
            <div class="container form-group" >
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
                        <a class="dropdown-item" data-toggle="modal" data-target="#sertifikatModal">Sertifikat</a>
                    </div>
                </div>
            </div>
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
                        <form action="../addPendidikan" method="POST">
                            <div class="form-group">
                                <label for="sel1">Universitas:</label>
                                <select class="form-control" name="univId" id="univ">
                                    <option selected value="">Pilih Universitas:</option>
                                    <%
                                        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
                                        UniversitasInterface ui = new UniversitasController(sessionFactory);
                                        for (Object elem : ui.search("")) {
                                            Universitas univ = (Universitas) elem;

                                    %>

                                    <option value="<%= univ.getId()%>"><%= univ.getNama()%> </option>


                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="sel1">Jurusan:</label>
                                <select class="form-control" name="jurusanId" id="jur">
                                    <option selected value="">Pilih Jurusan:</option>
                                    <%
                                        JurusanInterface ji = new JurusanController(sessionFactory);
                                        for (Object elem : ji.search("")) {
                                            Jurusan jur = (Jurusan) elem;

                                    %>

                                    <option value="<%= jur.getId()%>"><%= jur.getNama()%> </option>


                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="pwd">Instansi:</label>
                                <input type="text" class="form-control" name="instansi" id="ipk">
                            </div>
                            <div class="form-group">
                                <label for="pwd">IPK:</label>
                                <input type="text" class="form-control" name="ipk" id="ipk">
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
                        <form action="../addKeahlian" method="POST">
                            <div class="form-group">
                                <label for="sel1">Keahlian:</label>
                                <select class="form-control" id="skill" name="nama">
                                    <option selected value="">Pilih Keahlian:</option>
                                    <%
                                        ReqInterface ri = new ReqController(sessionFactory);
                                        for (Object elem : ri.search("")) {
                                            Requirements req = (Requirements) elem;

                                    %>

                                    <option value="<%= req.getId()%>"><%= req.getNama()%> </option>


                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group" name="deskripsi">
                                <label for="comment">Deskripsi:</label>
                                <textarea class="form-control" rows="5" id="desk"></textarea>
                            </div>
                            <div class="form-group">
                                <button type="button" class="btn btn-primary">Save changes</button>
                            </div>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
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
                        <form action="?" method="POST">

                            <div class="form-group">
                                <label for="pwd">Pencapaian:</label>
                                <input type="text" class="form-control" id="pencapaian" name="pencapaian">
                            </div>
                            <div class="form-group">
                                <label for="comment">Deskripsi:</label>
                                <textarea class="form-control" rows="5" id="desk" name="deskripsiPencapaian"></textarea>
                            </div>
                            <div class="form-group">
                                <button type="button" class="btn btn-primary">Save changes</button>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
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
                        <form action="?" method="POST">
                            <div class="form-group">
                                <label for="sel1">Bahasa:</label>
                                <select class="form-control" id="bhs" name="bahasaUserProfile">
                                    <option selected value="">Pilih Bahasa:</option>
                                    <%
                                        BahasaInterface bi = new BahasaController(sessionFactory);
                                        for (Object elem : bi.search("")) {
                                            Bahasa bhs = (Bahasa) elem;

                                    %>

                                    <option value="<%= bhs.getId()%>"><%= bhs.getNama()%> </option>


                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                        </form>
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
                        <form action="../addPengalaman" method="POST">
                            <div class="form-group">
                                <label for="pwd">Posisi:</label>
                                <input type="text" class="form-control" id="pos" name="posisi">
                            </div>
                            <div class="form-group">
                                <label for="pwd">Perusahaan:</label>
                                <input type="text" class="form-control" id="prshn" name="perusahaan">
                            </div>
                            <div class="form-group">
                                <label for="comment">Deskripsi:</label>
                                <textarea class="form-control" rows="5" id="desk" name="deskripsiPengalaman"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="pwd">Tanggal Mulai Bekerja</label>
                                <input type="date" class="form-control" id="tglstrt" name="tglMulai">
                            </div>
                            <div class="form-group">
                                <label for="pwd">Tanggal selesai Bekerja</label>
                                <input type="date" class="form-control" id="tglsls" name="tglSelesei">
                            </div>
                            <div class="form-group">
                                <button type="button" class="btn btn-primary">Save changes</button>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!--modal serti-->
        <div class="modal fade" id="sertifikatModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Sertifikat</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="../addSertifikat" method="POST">
                            <div class="form-group">
                                <label for="pwd">Nama:</label>
                                <input type="text" class="form-control" id="pos" name="namaSerti">
                            </div>
                            <div class="form-group">
                                <label for="pwd">Lembaga</label>
                                <input type="text" class="form-control" id="prshn" nama="lembaga">
                            </div>
                            <div class="form-group">
                                <button type="button" class="btn btn-primary">Save changes</button>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
