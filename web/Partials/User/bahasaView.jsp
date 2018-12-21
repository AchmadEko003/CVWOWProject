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
            <form method="POST" action="addBahasaServlet">
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
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
        <script>
            var slider = document.getElementById("myRange");
            var output = document.getElementById("demo");
            output.innerHTML = slider.value;

            slider.oninput = function () {
                output.innerHTML = this.value;
            }
        </script>
    </body>
</html>
