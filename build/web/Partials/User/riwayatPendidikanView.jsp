<%-- 
    Document   : riwayatPendidikanView
    Created on : Dec 16, 2018, 9:39:42 PM
    Author     : Nitani
--%>

<%@page import="entities.Universitas"%>
<%@page import="entities.RiwayatPendidikan"%>
<%@page import="controllers.UniversitasController"%>
<%@page import="interfaces.UniversitasInterface"%>
<%@page import="entities.Jurusan"%>
<%@page import="interfaces.JurusanInterface"%>
<%@page import="controllers.JurusanController"%>
<%@page import="tools.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <form method="POST" action="../addPendidikan">
                <div class="form-group">
                    <label for="exampleInputPassword1">Universitas</label>
                    <select name="univ" class="form-control" id="exampleFormControlSelect1">
                        <% SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
                            UniversitasInterface ui = new UniversitasController(sessionFactory);
                            for (Object univ : ui.search("")) {
                                Universitas j = (Universitas) univ;
                        %>
                        <option><%= j.getNama() %> </option>
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
                        <option><%= j.getNama() %> </option>
                        <% } %>
                    </select>
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Instansi</label>
                    <input name="instansi" type="text" class="form-control" id="exampleInputEmail1">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">IPK</label>
                    <input name="ipk" type="text" class="form-control" id="exampleInputEmail1">
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </body>
</html>
