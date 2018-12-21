<%-- 
    Document   : viewUserDetail
    Created on : Dec 21, 2018, 6:14:02 AM
    Author     : Nitani
--%>

<%@page import="tools.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="entities.UserProfile"%>
<%@page import="entities.BahasaLang"%>
<%@page import="interfaces.BahasaLangInterface"%>
<%@page import="controllers.BahasaLangController"%>
<%@page import="entities.Sertifikat"%>
<%@page import="interfaces.SertifikatInterface"%>
<%@page import="controllers.SertifikatController"%>
<%@page import="controllers.PendidikanController"%>
<%@page import="interfaces.PendidikanInterface"%>
<%@page import="entities.RiwayatPendidikan"%>
<%@page import="controllers.PengalamanController"%>
<%@page import="interfaces.PengalamanInterface"%>
<%@page import="entities.Pengalaman"%>
<%@page import="entities.Project"%>
<%@page import="interfaces.ProjectInterface"%>
<%@page import="controllers.ProjectController"%>
<%@page import="entities.Keahlian"%>
<%@page import="controllers.KeahlianController"%>
<%@page import="interfaces.KeahlianInterface"%>
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
            UserProfile r = (UserProfile) session.getAttribute("profileManager");
            SessionFactory factorys = HibernateUtil.getSessionFactory();
            if (session.getAttribute("profileManager") != null) {
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
                                        <a href="managerHome.jsp">
                                            <i class="fa fa-home" aria-hidden="true"></i>
                                            <span>Home</span>
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
                            <ol class="breadcrumbs">
                                <li>
                                    <a href="index.html">
                                        <i class="fa fa-home"></i>
                                    </a>
                                </li>
                                <li><span>Pages</span></li>
                                <li><span>User Profile</span></li>
                            </ol>

                            <a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
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

            <aside id="sidebar-right" class="sidebar-right">
                <div class="nano">
                    <div class="nano-content">
                        <a href="#" class="mobile-close visible-xs">
                            Collapse <i class="fa fa-chevron-right"></i>
                        </a>

                        <div class="sidebar-right-wrapper">

                            <div class="sidebar-widget widget-calendar">
                                <h6>Upcoming Tasks</h6>
                                <div data-plugin-datepicker data-plugin-skin="dark" ></div>

                                <ul>
                                    <li>
                                        <time datetime="2014-04-19T00:00+00:00">04/19/2014</time>
                                        <span>Company Meeting</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </aside>
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
