<%-- 
    Document   : lowonganFormView
    Created on : Dec 15, 2018, 11:33:11 PM
    Author     : Nitani
--%>

<%@page import="org.hibernate.SessionFactory"%>
<%@page import="tools.HibernateUtil"%>
<%@page import="controllers.ReqController"%>
<%@page import="interfaces.ReqInterface"%>
<%@page import="entities.Requirements"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% SessionFactory reqFactory = HibernateUtil.getSessionFactory(); %>
        <div class="container">
            <form method="POST" action="tambahLowonganServlet">
                <div class="form-group">
                    <label>Judul</label>
                    <input name="judul" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="name" placeholder="Judul">
                </div>
                <div class="form-group">
                    <label>Deskripsi</label>
                    <textarea name="deskripsi" class="form-control" id="exampleInputPassword1" placeholder="Deskripsi"></textarea>
                </div>
                <div class="form-group">
                    <label>Requirements</label>
                    <select name="req" class="form-control">
                        <%  ReqInterface reqs = new ReqController(reqFactory);
                            for (Object object : reqs.search("")) {
                                Requirements rq = (Requirements) object;%>
                        <option><%= rq.getNama() %></option>
                        <% }%>
                    </select>
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Tanggal Selesai</label>
                    <input name="tglSelesai" type="date" class="form-control" id="exampleInputPassword1">
                </div>
                <div class="form-group">
                    <input type="submit" class="btn btn-info btn-lg btn-block" value="Submit">
                </div>
            </form>
        </div>
    </body>
</html>
