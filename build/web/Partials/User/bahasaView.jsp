<%-- 
    Document   : bahasaView
    Created on : Dec 18, 2018, 6:28:34 AM
    Author     : Nitani
--%>

<%@page import="entities.Bahasa"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="tools.HibernateUtil"%>
<%@page import="controllers.BahasaController"%>
<%@page import="interfaces.BahasaInterface"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% SessionFactory ssessionFactory = HibernateUtil.getSessionFactory(); %>
        <div class="container">
            <form method="POST" action="../addBahasaServlet">
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
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </body>
</html>
