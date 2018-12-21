<%-- 
    Document   : adminHome
    Created on : Dec 21, 2018, 8:19:29 AM
    Author     : Nitani
--%>

<%@page import="entities.User"%>
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
        <% String idUser = "", emails = "", role = "", decodedUrl = "";
            SessionFactory factory = HibernateUtil.getSessionFactory();
            User r = (User) session.getAttribute("userData");
            if (session.getAttribute("userData") != null) {
                idUser = r.getId().toString();
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
                                <span class="name"><%= r.getEmail()%></span>
                            </div>

                            <i class="fa custom-caret"></i>
                        </a>

                        <div class="dropdown-menu">
                            <ul class="list-unstyled">
                                <li class="divider"></li>
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
                                <!-- start: page -->
                                <section class="panel">
                                    <header class="panel-heading">
                                        <div class="panel-actions">
                                            <a href="#" class="fa fa-caret-down"></a>
                                            <a href="#" class="fa fa-times"></a>
                                        </div>

                                        <h2 class="panel-title">Basic</h2>
                                    </header>
                                    <div class="panel-body">
                                        <table class="table table-bordered table-striped mb-none" id="datatable-default">
                                            <thead>
                                                <tr>
                                                    <th>Nama</th>
                                                    <th>Lowongan Pekerjaan</th>
                                                    <th>Deskripsi</th>
                                                    <th>Tanggal Berakhir</th>
                                                    <th class="hidden-phone">Status</th>
                                                    <th class="hidden-phone">Detail</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%  ApplyInterface uiUserss = new ApplyController(factory);
                                                    for (Object userApplyV : uiUserss.search("")) {
                                                        Apply idApplyUser = (Apply) userApplyV;%>
                                                <tr class="grade">
                                                    <td><%= idApplyUser.getUserId().getUsername()%></td>
                                                    <td><%= idApplyUser.getLowonganId().getJudul()%></td>
                                                    <td><%= idApplyUser.getLowonganId().getDeskripsi()%></td>
                                                    <td><%= idApplyUser.getLowonganId().getTanggalSelesai()%></td>
                                                    <td class="center hidden-phone"><%= idApplyUser.getStatus()%></td>
                                                    <td class="center hidden-phone"><a href="../../getProfileIDServlet?id=<%= idApplyUser.getUserId().getId()%>">Detail</a></td>
                                                </tr>
                                                <% }%>
                                            </tbody>
                                        </table>
                                    </div>
                                </section>
                            </div>
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
