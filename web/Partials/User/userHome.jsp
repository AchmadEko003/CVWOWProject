<%-- 
    Document   : userHome
    Created on : Dec 20, 2018, 9:07:24 PM
    Author     : Nitani
--%>

<%@page import="entities.Universitas"%>
<%@page import="controllers.UniversitasController"%>
<%@page import="interfaces.UniversitasInterface"%>
<%@page import="entities.Jurusan"%>
<%@page import="interfaces.JurusanInterface"%>
<%@page import="controllers.JurusanController"%>
<%@page import="controllers.BahasaController"%>
<%@page import="entities.Bahasa"%>
<%@page import="interfaces.BahasaInterface"%>
<%@page import="entities.Pencapaian"%>
<%@page import="controllers.PencapaianController"%>
<%@page import="interfaces.PencapaianInterface"%>
<%@page import="controllers.ProjectController"%>
<%@page import="entities.Project"%>
<%@page import="interfaces.ProjectInterface"%>
<%@page import="entities.Keahlian"%>
<%@page import="controllers.KeahlianController"%>
<%@page import="interfaces.KeahlianInterface"%>
<%@page import="entities.Pengalaman"%>
<%@page import="controllers.PengalamanController"%>
<%@page import="interfaces.PengalamanInterface"%>
<%@page import="entities.RiwayatPendidikan"%>
<%@page import="controllers.PendidikanController"%>
<%@page import="interfaces.PendidikanInterface"%>
<%@page import="entities.Sertifikat"%>
<%@page import="controllers.SertifikatController"%>
<%@page import="interfaces.SertifikatInterface"%>
<%@page import="entities.BahasaLang"%>
<%@page import="controllers.BahasaLangController"%>
<%@page import="interfaces.BahasaLangInterface"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="tools.HibernateUtil"%>
<%@page import="entities.UserProfile"%>
<%@page import="entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Profile | Okler Themes | Porto-Admin</title>
        <meta name="keywords" content="HTML5 Admin Template" />
        <meta name="description" content="Porto Admin - Responsive HTML5 Template">
        <meta name="author" content="okler.net">

        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

        <!-- Web Fonts  -->
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light" rel="stylesheet" type="text/css">

        <!-- Vendor CSS -->
        <link rel="stylesheet" href="../../assets/vendor/bootstrap/css/bootstrap.css" />
        <link rel="stylesheet" href="../../assets/vendor/font-awesome/css/font-awesome.css" />
        <link rel="stylesheet" href="../../assets/vendor/magnific-popup/magnific-popup.css" />
        <link rel="stylesheet" href="../../assets/vendor/bootstrap-datepicker/css/datepicker3.css" />

        <!-- Theme CSS -->
        <link rel="stylesheet" href="../../assets/stylesheets/theme.css" />

        <!-- Skin CSS -->
        <link rel="stylesheet" href="../../assets/stylesheets/skins/default.css" />

        <!-- Theme Custom CSS -->
        <link rel="stylesheet" href="../../assets/stylesheets/theme-custom.css">

        <!-- Head Libs -->
        <script src="../../assets/vendor/modernizr/modernizr.js"></script>

        <!-- Sweet Alert-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>
            function deletes() {
                swal({
                    title: "Ingin logout?",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                        .then((willDelete) => {
                            if (willDelete) {
                                swal("Berhasil logout", {
                                    icon: "success",
                                });
                                window.location.href = "../../logoutServlet";
                            }
                        });
            }
        </script>
    </head>
    <body>
        <% String namas = "", umurs = "", alamats = "", tglLahirs = "", telps = "", image = "";
            byte[] imageByte = null;
            UserProfile r = (UserProfile) session.getAttribute("profile");
            SessionFactory factorys = HibernateUtil.getSessionFactory();
            if (session.getAttribute("profile") != null) {
                namas = r.getNama();
                umurs = String.valueOf(r.getUmur());
                alamats = r.getAlamat();
                tglLahirs = r.getTanggalLahir().toString();
                telps = String.valueOf(r.getNoTelpon());
                image = new String(r.getFoto());
            }
        %>
        <section class="body">
            <!-- start: header -->
            <header class="header">
                <div class="logo-container">
                    <a href="../" class="logo">
                        <img src="../../assets/MII-logo.png" height="35" alt="Porto Admin" />
                    </a>
                    <div class="visible-xs toggle-sidebar-left" data-toggle-class="sidebar-left-opened" data-target="html" data-fire-event="sidebar-left-opened">
                        <i class="fa fa-bars" aria-label="Toggle sidebar"></i>
                    </div>
                </div>

                <!-- start: search & user box -->
                <div class="header-right">

                    <form action="pages-search-results.html" class="search nav-form">
                        <div class="input-group input-search">
                            <input type="text" class="form-control" name="q" id="q" placeholder="Search...">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                            </span>
                        </div>
                    </form>

                    <span class="separator"></span>

                    <div id="userbox" class="userbox">
                        <a href="#" data-toggle="dropdown">
                            <div class="profile-info" data-lock-name="John Doe" data-lock-email="johndoe@okler.com">
                                <span class="name"><%= namas%></span>
                            </div>

                            <i class="fa custom-caret"></i>
                        </a>

                        <div class="dropdown-menu">
                            <ul class="list-unstyled">
                                <li class="divider"></li>
                                <li>
                                    <a role="menuitem" tabindex="-1" href="pages-user-profile.html"><i class="fa fa-user"></i> My Profile</a>
                                </li>
                                <li>
                                    <a role="menuitem" tabindex="-1" href="#" data-lock-screen="true"><i class="fa fa-lock"></i> Lock Screen</a>
                                </li>
                                <li>
                                    <a role="menuitem" tabindex="-1" href="../../logoutServlet" onclick="deletes()"><i class="fa fa-power-off"></i> Logout</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- end: search & user box -->
            </header>
            <!-- end: header -->

            <div class="inner-wrapper">
                <!-- start: sidebar -->
                <aside id="sidebar-left" class="sidebar-left">

                    <div class="sidebar-header">
                        <div class="sidebar-title">
                            Navigation
                        </div>
                        <div class="sidebar-toggle hidden-xs" data-toggle-class="sidebar-left-collapsed" data-target="html" data-fire-event="sidebar-left-toggle">
                            <i class="fa fa-bars" aria-label="Toggle sidebar"></i>
                        </div>
                    </div>

                    <div class="nano">
                        <div class="nano-content">
                            <nav id="menu" class="nav-main" role="navigation">
                                <ul class="nav nav-main">
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-home" aria-hidden="true"></i>
                                            <span>Home</span>
                                        </a>
                                    </li>

                                    <li class="nav-parent nav-expanded nav-active">
                                        <a>
                                            <i class="fa fa-copy" aria-hidden="true"></i>
                                            <span>Profile</span>
                                        </a>
                                        <ul class="nav nav-children">
                                            <li>
                                                <a href="#" data-toggle="modal" data-target="#bahasaModal">
                                                    Bahasa
                                                </a>
                                                <!-- Modal -->
                                                <div class="modal fade" id="bahasaModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalCenterTitle">Bahasa</h5>
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <% SessionFactory ssessionFactory = HibernateUtil.getSessionFactory(); %>
                                                                <form method="POST" action="../../addBahasaServlet">
                                                                    <div class="form-group">
                                                                        <label>Bahasa</label>
                                                                        <select name="nama" class="form-control">
                                                                            <%  BahasaInterface jis = new BahasaController(ssessionFactory);
                                                                                for (Object object : jis.search("")) {
                                                                                    Bahasa js = (Bahasa) object;%>
                                                                            <option><%= js.getNama()%></option>
                                                                            <% }%>
                                                                        </select>
                                                                    </div>
                                                                    <div class="slidecontainer">
                                                                        <input name="a" type="range" min="1" max="100" value="50" class="custom-range" id="myRange">
                                                                        <label>Value: <span id="demo"></span></label>
                                                                    </div>
                                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                    <button type="button" class="btn btn-primary">Submit</button>
                                                                </form>
                                                                <script>
                                                                    var slider = document.getElementById("myRange");
                                                                    var output = document.getElementById("demo");
                                                                    output.innerHTML = slider.value;

                                                                    slider.oninput = function () {
                                                                        output.innerHTML = this.value;
                                                                    }
                                                                </script>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <a href="#" data-toggle="modal" data-target="#sertifikatModal">
                                                    Sertifikat
                                                </a>
                                                <div class="modal fade" id="sertifikatModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalCenterTitle">Sertifikat</h5>
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <form method="POST" action="../../addSertifikatServlet">
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Nama</label>
                                                                        <input name="nama" type="text" class="form-control" id="exampleInputEmail1">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputPassword1">Lembaga</label>
                                                                        <input name="lembaga" type="text" class="form-control" id="exampleInputEmail1">
                                                                    </div>
                                                                    <br>
                                                                    <button type="submit" class="btn btn-primary">Submit</button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <a href="#" data-toggle="modal" data-target="#pendidikanModal">
                                                    Pendidikan
                                                </a>
                                                <div class="modal fade" id="pendidikanModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalCenterTitle">Pendidikan</h5>
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <form method="POST" action="../../addPendidikan">
                                                                    <div class="form-group">
                                                                        <label for="exampleInputPassword1">Universitas</label>
                                                                        <select name="univ" class="form-control" id="exampleFormControlSelect1">
                                                                            <% SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
                                                                                UniversitasInterface ui = new UniversitasController(sessionFactory);
                                                                                for (Object univ : ui.search("")) {
                                                                                    Universitas j = (Universitas) univ;
                                                                            %>
                                                                            <option><%= j.getNama()%> </option>
                                                                            <% } %>
                                                                        </select>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="exampleFormControlSelect1">Jurusan</label>
                                                                        <select name="jurusan" class="form-control" id="exampleFormControlSelect1">
                                                                            <% JurusanInterface ji = new JurusanController(sessionFactory);
                                                                                for (Object object : ji.search("")) {
                                                                                    Jurusan j = (Jurusan) object;

                                                                            %>
                                                                            <option><%= j.getNama()%> </option>
                                                                            <% }%>
                                                                        </select>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">IPK</label>
                                                                        <input name="ipk" type="text" class="form-control" id="exampleInputEmail1">
                                                                    </div><br>

                                                                    <button type="submit" class="btn btn-primary">Submit</button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <a href="#" data-toggle="modal" data-target="#pengalamanModal">
                                                    Pengalaman
                                                </a>
                                                <div class="modal fade" id="pengalamanModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalCenterTitle">Pengalaman</h5>
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <form method="POST" action="../../addPengalamanView">
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
                                                                    </div><br>

                                                                    <button type="submit" class="btn btn-primary">Submit</button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="nav-active">
                                                <a href="#" data-toggle="modal" data-target="#keahlianModal">
                                                    Keahlian
                                                </a>
                                                <div class="modal fade" id="keahlianModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalCenterTitle">Keahlian</h5>
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <form method="POST" action="../../addKealhianServlet">
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Keahlian</label>
                                                                        <input name="keahlian" type="text" class="form-control" id="exampleInputEmail1" placeholder="Keahlian">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputPassword1">Deskripsi</label>
                                                                        <textarea name="deskripsi" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                                                                    </div><br>
                                                                    <button type="submit" class="btn btn-primary">Submit</button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <a href="#" data-toggle="modal" data-target="#projectModal">
                                                    Project
                                                </a>
                                                <div class="modal fade" id="projectModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalCenterTitle">Project</h5>
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <form method="POST" action="../../addProjectServlet">
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Nama</label>
                                                                        <input name="nama" type="text" class="form-control" id="exampleInputEmail1">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputPassword1">Deskripsi</label>
                                                                        <textarea name="deskripsi" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputPassword1">Status</label>
                                                                        <input name="status" type="text" class="form-control" id="exampleInputEmail1">
                                                                    </div><br>
                                                                    <button type="submit" class="btn btn-primary">Submit</button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="lowonganUser.jsp">
                                            <i class="fa fa-suitcase" aria-hidden="true"></i>
                                            <span>Lowongan Pekerjaan</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="listApply.jsp">
                                            <i class="fa fa-list" aria-hidden="true"></i>
                                            <span>Apply List</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </aside>
                <!-- end: sidebar -->

                <section role="main" class="content-body">
                    <header class="page-header">
                        <h2>User Profile</h2>

                        <div class="right-wrapper pull-right">
                            <ol class="breadcrumbs mr-sm">
                                <li>
                                    <a href="#">
                                        <i class="fa fa-home"></i>
                                    </a>
                                </li>
                            </ol>
                        </div>
                    </header>

                    <!-- start: page -->

                    <div class="row">
                        <div class="col-md-4 col-lg-3">

                            <section class="panel">
                                <div class="panel-body">
                                    <div class="thumb-info mb-md">
                                        <img src="data:image/png;base64,<%= image%>" class="rounded img-responsive" alt="John Doe">
                                        <div class="thumb-info-title">
                                            <span class="thumb-info-inner"><%= namas%></span>
                                        </div>
                                    </div>

                                    <div class="widget-toggle-expand mb-md">
                                        <div class="widget-header">
                                            <h6>Bio</h6>
                                            <div class="widget-toggle">+</div>
                                        </div>
                                        <div class="widget-content-expanded">
                                            <ul class="simple-todo-list">
                                                <li><i class="fa fa-child"></i> : <%= umurs%> Tahun</li>
                                                <li><i class="fa fa-calendar"></i> : <%= tglLahirs%></li>
                                                <li><i class="fa fa-phone"></i> : +62 <%= telps%></li>
                                                <li><i class="fa fa-home"></i> : <%= alamats%> </li>
                                                <div class="text-right"><a class="mb-xs mt-xs mr-xs" href="#"><i class="fa fa-pencil-square"></i> Edit</a></div>
                                            </ul>
                                        </div>
                                    </div>

                                    <hr class="dotted short">

                                    <h6 class="text-muted">Bahasa</h6>
                                    <% BahasaLangInterface bhsl = new BahasaLangController(factorys);
                                        for (Object bahas : bhsl.search(r.getId().toString())) {
                                            BahasaLang bhs = (BahasaLang) bahas;%>
                                    <p><%= bhs.getIdBahasa().getNama()%></p>

                                    <div class="widget-content-collapsed">
                                        <div class="progress progress-xs light">
                                            <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%= bhs.getRate()%>%;">
                                                60%
                                            </div>
                                        </div>
                                    </div>
                                    <% }%>

                                    <hr class="dotted short">

                                    <h6 class="text-muted">Sertifikat</h6>
                                    <% SertifikatInterface sis = new SertifikatController(factorys);
                                        for (Object serti : sis.search(r.getId().toString())) {
                                            Sertifikat sert = (Sertifikat) serti;%>
                                    <p class="mb-1"> <%= sert.getNama()%> - <%= sert.getLembaga()%></p>
                                    <% }%>
                                </div>
                            </section>
                        </div>

                        <div class="col-md-8 col-lg-9">
                            <section class="panel panel-featured panel-featured-primary">
                                <header class="panel-heading">
                                    <div class="panel-actions">
                                        <a href="#" class="fa fa-caret-down"></a>
                                        <a href="#" class="fa fa-times"></a>
                                    </div>

                                    <h2 class="panel-title">Pendidikan</h2>
                                </header>

                                <% PendidikanInterface pni = new PendidikanController(factorys);
                                    for (Object pendi : pni.search(r.getId().toString())) {
                                        RiwayatPendidikan pe = (RiwayatPendidikan) pendi;%>
                                <div class="panel-body mt-sm">
                                    <ul class="simple-todo-list">
                                        <li><b><%= pe.getUniversitasId().getNama()%></b></li>
                                        <li><%= pe.getJurusanId().getNama()%></li>
                                        <li><%= pe.getIpk()%></li>
                                    </ul>
                                </div>
                                <% }%>
                            </section>

                            <section class="panel panel-featured panel-featured-primary">
                                <header class="panel-heading">
                                    <div class="panel-actions">
                                        <a href="#" class="fa fa-caret-down"></a>
                                        <a href="#" class="fa fa-times"></a>
                                    </div>

                                    <h2 class="panel-title">Pengalaman</h2>
                                </header>

                                <% PengalamanInterface pi = new PengalamanController(factorys);
                                    for (Object pengalaman : pi.search(r.getId().toString())) {
                                        Pengalaman peng = (Pengalaman) pengalaman;%>
                                <div class="panel-body mt-sm">
                                    <ul class="simple-todo-list">
                                        <li><b><%= peng.getPerusahaan()%> (<%= peng.getPosisi()%>)</b></li>
                                        <li><%= peng.getDeskripsi()%></li>
                                        <li><%= peng.getMulaiBekerja()%> sampai <%= peng.getSelesaiBekerja()%></li>
                                    </ul>
                                </div>
                                <% }%>
                            </section>

                            <section class="panel panel-featured panel-featured-primary">
                                <header class="panel-heading">
                                    <div class="panel-actions">
                                        <a href="#" class="fa fa-caret-down"></a>
                                        <a href="#" class="fa fa-times"></a>
                                    </div>

                                    <h2 class="panel-title">Keahlian</h2>
                                </header>

                                <% KeahlianInterface ki = new KeahlianController(factorys);
                                    for (Object keahlian : ki.search(r.getId().toString())) {
                                        Keahlian keh = (Keahlian) keahlian;%>
                                <div class="panel-body mt-sm">
                                    <ul class="simple-todo-list">
                                        <li><b><%= keh.getNama()%></b></li>
                                        <li><%= keh.getDeskripsi()%></li>
                                    </ul>
                                </div>
                                <% }%>
                            </section>

                            <section class="panel panel-featured panel-featured-primary">
                                <header class="panel-heading">
                                    <div class="panel-actions">
                                        <a href="#" class="fa fa-caret-down"></a>
                                        <a href="#" class="fa fa-times"></a>
                                    </div>

                                    <h2 class="panel-title">Project</h2>
                                </header>

                                <% ProjectInterface proi = new ProjectController(factorys);
                                    for (Object o : proi.search(r.getId().toString())) {
                                        Project pro = (Project) o;%>
                                <div class="panel-body mt-sm">
                                    <ul class="simple-todo-list">
                                        <li><b><%= pro.getNama()%></b></li>
                                        <li><%= pro.getDeskripsi()%></li>
                                        <li><%= pro.getStatus()%></li>
                                    </ul>
                                </div>
                                <% }%>
                            </section>

                        </div>
                    </div>
                    <!-- end: page -->
                </section>
            </div>
        </section>

        <!-- Vendor -->
        <script src="../../assets/vendor/jquery/jquery.js"></script>
        <script src="../../assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
        <script src="../../assets/vendor/bootstrap/js/bootstrap.js"></script>
        <script src="../../assets/vendor/nanoscroller/nanoscroller.js"></script>
        <script src="../../assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script src="../../assets/vendor/magnific-popup/magnific-popup.js"></script>
        <script src="../../assets/vendor/jquery-placeholder/jquery.placeholder.js"></script>

        <!-- Specific Page Vendor -->
        <script src="../../assets/vendor/jquery-autosize/jquery.autosize.js"></script>

        <!-- Theme Base, Components and Settings -->
        <script src="../../assets/javascripts/theme.js"></script>

        <!-- Theme Custom -->
        <script src="../../assets/javascripts/theme.custom.js"></script>

        <!-- Theme Initialization Files -->
        <script src="../../assets/javascripts/theme.init.js"></script>

    </body>
</html>
