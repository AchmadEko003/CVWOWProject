<%-- 
    Document   : lowonganFormView
    Created on : Dec 15, 2018, 11:33:11 PM
    Author     : Nitani
--%>

<%@page import="tools.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="entities.Requirements"%>
<%@page import="controllers.ReqController"%>
<%@page import="interfaces.ReqInterface"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <form method="POST" action="tambahLowonganServlet">
                <div class="form-group">
                    <i class="fas fa-user"></i>
                    <label for="exampleInputEmail1">Judul</label>
                    <input name="judul" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="name" placeholder="Name">
                </div>
                <div class="form-group">
                    <i class="fas fa-lock"></i>
                    <label for="exampleInputPassword1">Deskripsi</label>
                    <textarea name="deskripsi" class="form-control" id="exampleInputPassword1" placeholder="Password"></textarea>
                </div>
                <div class="form-group">
                    <label for="sel1">Keahlian:</label>
                    <select class="form-control" id="skill" name="req">
                        <option selected value="">Pilih Keahlian:</option>
                        <%
                            SessionFactory factory = HibernateUtil.getSessionFactory();
                            ReqInterface ri = new ReqController(factory);
                            for (Object elem : ri.search("")) {
                                Requirements req = (Requirements) elem;

                        %>

                        <option value="<%= req.getId()%>"><%= req.getNama()%> </option>


                        <%
                            }
                        %>
                    </select>
                </div>
                <div class="form-group">
                    <i class="fas fa-lock"></i>
                    <label for="exampleInputPassword1">Tanggal Selesai</label>
                    <input name="tglSelesai" type="date" class="form-control" id="exampleInputPassword1" placeholder="Confirm Password">
                </div>
                <div class="form-group">
                    <input type="submit" class="btn btn-info btn-lg btn-block">Tambah <i class="fab fa-telegram-plane"></i>
                </div>
            </form>
        </div>
    </body>
</html>
