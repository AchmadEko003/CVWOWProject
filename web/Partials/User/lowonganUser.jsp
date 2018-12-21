<%-- 
    Document   : lowonganUser
    Created on : Dec 20, 2018, 11:25:32 PM
    Author     : Nitani
--%>

<%@page import="java.util.Date"%>
<%@page import="entities.LowonganPekerjaan"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="controllers.LokerController"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="interfaces.LokerInterface"%>
<%@page import="tools.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
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

    </head>
    <body>
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
                            <span class="name">John Doe Junior</span>
                            <span class="role">administrator</span>
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
                                <a role="menuitem" tabindex="-1" href="pages-signin.html"><i class="fa fa-power-off"></i> Logout</a>
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
                                    <a href="userHome.jsp">
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
                                            <a href="pages-signup.html">
                                                Bahasa
                                            </a>
                                        </li>
                                        <li>
                                            <a href="pages-signin.html">
                                                Sertifikat
                                            </a>
                                        </li>
                                        <li>
                                            <a href="pages-recover-password.html">
                                                Pendidikan
                                            </a>
                                        </li>
                                        <li>
                                            <a href="pages-lock-screen.html">
                                                Pengalaman
                                            </a>
                                        </li>
                                        <li class="nav-active">
                                            <a href="pages-user-profile.html">
                                                Keahlian
                                            </a>
                                        </li>
                                        <li>
                                            <a href="pages-session-timeout.html">
                                                Project
                                            </a>
                                        </li>
                                        <li>
                                            <a href="pages-calendar.html">
                                                Pencapaian
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#">
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
                    <div class="col-12">

                        <div class="col-md-12">
                            <!--Lowongan Kerja-->
                            <% SessionFactory factory = HibernateUtil.getSessionFactory();
                                LokerInterface li = new LokerController(factory);
                                DateFormat formats = new SimpleDateFormat("d MMMM yyyy", Locale.ENGLISH);
                                for (Object loker : li.search()) {
                                    LowonganPekerjaan lowker = (LowonganPekerjaan) loker;
                                    Date hire = lowker.getTanggalSelesai();%>
                            <section class="panel panel-tertiary">
                                <header class="panel-heading">
                                    <div class="panel-actions">
                                        <a href="#" class="fa fa-caret-down"></a>
                                    </div>

                                    <h2 class="panel-title"><%= lowker.getJudul()%></h2>
                                    <p class="panel-subtitle">PT. Mitra Integrasi Informatika</p>
                                </header>
                                <div class="panel-body">
                                    <h5><%= lowker.getDeskripsi()%></h5>
                                    <p class="panel-subtitle text-dark">Berakhir pada <b><%= formats.format(hire)%></b></p><br>
                                    <a href="../../applyLokerServlet?id=<%= lowker.getId()%>" class="mb-xs mt-xs mr-xs btn btn-info" onclick="return confirm('Ingin melamar di lowongan ini?');">Apply</a>
                                </div>
                            </section>
                            <% }%>
                        </div>

                    </div>
                </div>
                <!-- end: page -->
            </section>
        </div>

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
