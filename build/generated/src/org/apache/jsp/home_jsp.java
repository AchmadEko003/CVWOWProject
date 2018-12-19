package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import entities.User;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.text.DateFormat;
import java.util.Locale;
import controllers.LokerController;
import interfaces.LokerInterface;
import tools.HibernateUtil;
import org.hibernate.SessionFactory;
import entities.LowonganPekerjaan;

public final class home_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/lokerViews_1.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Home</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css\" integrity=\"sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO\" crossorigin=\"anonymous\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://use.fontawesome.com/releases/v5.6.1/css/all.css\" integrity=\"sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP\" crossorigin=\"anonymous\">\n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.3.1.slim.min.js\" integrity=\"sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js\" integrity=\"sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js\" integrity=\"sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy\" crossorigin=\"anonymous\"></script>\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <nav class=\"navbar navbar-expand-lg navbar-dark bg-info sticky-top\">\n");
      out.write("            <button type=\"button\" class=\"btn btn-light\">\n");
      out.write("                <img src=\"./Assets/MII-logo.png\" alt=\"Logo\" style=\"width:40px;\">\n");
      out.write("            </button>\n");
      out.write("            <button class=\"navbar-toggler\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbarTogglerDemo02\" aria-controls=\"navbarTogglerDemo02\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\n");
      out.write("                <span class=\"navbar-toggler-icon\"></span>\n");
      out.write("            </button>\n");
      out.write("\n");
      out.write("            <div class=\"collapse navbar-collapse\" id=\"navbarTogglerDemo02\">\n");
      out.write("                <ul class=\"navbar-nav mr-auto mt-2 mt-lg-0\">\n");
      out.write("                    <li class=\"nav-item active\">\n");
      out.write("\n");
      out.write("                    </li>\n");
      out.write("                    <li class=\"nav-item\">\n");
      out.write("\n");
      out.write("                    </li>\n");
      out.write("                    <li class=\"nav-item\">\n");
      out.write("\n");
      out.write("                    </li>\n");
      out.write("                </ul>\n");
      out.write("                <ul class=\"nav justify-content-end\">\n");
      out.write("                    <li class=\"nav-item\">\n");
      out.write("                        <button type=\"button\" class=\"btn btn-outline-light\" data-toggle=\"modal\" data-target=\"#exampleModalCenter\">\n");
      out.write("                            Login\n");
      out.write("                        </button>\n");
      out.write("                    </li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("        </nav>\n");
      out.write("\n");
      out.write("        <!-- Modal -->\n");
      out.write("        <div class=\"modal fade bd-example-modal-lg\" id=\"cvModal\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"cvModal\" aria-hidden=\"true\">\n");
      out.write("            <div class=\"modal-dialog modal-lg\" role=\"document\">\n");
      out.write("                <div class=\"modal-content\">\n");
      out.write("\n");
      out.write("                    <div class=\"modal-body\">\n");
      out.write("                        ");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <!-- Modal Login-->\n");
      out.write("        <div class=\"modal fade\" id=\"exampleModalCenter\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalCenterTitle\" aria-hidden=\"true\">\n");
      out.write("            <div class=\"modal-dialog modal-dialog-centered\" role=\"document\">\n");
      out.write("                <div class=\"modal-content\">\n");
      out.write("\n");
      out.write("                    <div class=\"modal-body\">\n");
      out.write("                        <div class=\"\">\n");
      out.write("                            <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">\n");
      out.write("                                <span aria-hidden=\"true\">&times;</span>\n");
      out.write("                            </button>\n");
      out.write("                            <ul class=\"nav nav-tabs\">\n");
      out.write("                                <li class=\"nav-item\">\n");
      out.write("                                    <a class=\"nav-link active\" data-toggle=\"tab\" href=\"#login\">Login</a>\n");
      out.write("                                </li>\n");
      out.write("                                <li class=\"nav-item\">\n");
      out.write("                                    <a class=\"nav-link\" data-toggle=\"tab\" href=\"#signUp\">Register</a>\n");
      out.write("                                </li>\n");
      out.write("                            </ul>\n");
      out.write("\n");
      out.write("                            <!-- Tab panes -->\n");
      out.write("                            <div class=\"tab-content\">\n");
      out.write("                                <div id=\"login\" class=\"container tab-pane active\"><br>\n");
      out.write("                                    <form method=\"POST\"  action=\"loginServlet\">\n");
      out.write("                                        <div class=\"form-group\">\n");
      out.write("                                            <i class=\"fas fa-envelope\"></i>\n");
      out.write("                                            <label for=\"exampleInputEmail1\">Email address</label>\n");
      out.write("                                            <input name=\"emailsa\" type=\"email\" class=\"form-control\" id=\"exampleInputEmail1\" aria-describedby=\"emailHelp\" placeholder=\"example@gmail.com\">\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"form-group\">\n");
      out.write("                                            <i class=\"fas fa-lock\"></i>\n");
      out.write("                                            <label for=\"exampleInputPassword1\">Password</label>\n");
      out.write("                                            <input name=\"passwords\" type=\"password\" class=\"form-control\" id=\"exampleInputPassword1\" placeholder=\"Password\">\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"form-group\">\n");
      out.write("                                            <input type=\"submit\" class=\"btn btn-info btn-lg btn-block\" value=\"Login\">\n");
      out.write("                                        </div>\n");
      out.write("                                    </form>\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                                <div id=\"signUp\" class=\"container tab-pane fade\"><br>\n");
      out.write("                                    <form method=\"POST\" action=\"registerServlet\">\n");
      out.write("                                        <div class=\"form-group\">\n");
      out.write("                                            <i class=\"fas fa-user\"></i>\n");
      out.write("                                            <label for=\"exampleInputEmail1\">Name</label>\n");
      out.write("                                            <input name=\"userName\" type=\"text\" class=\"form-control\" id=\"exampleInputEmail1\" aria-describedby=\"name\" placeholder=\"Name\">\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"form-group\">\n");
      out.write("                                            <i class=\"fas fa-envelope\"></i>\n");
      out.write("                                            <label for=\"exampleInputEmail1\">Email address</label>\n");
      out.write("                                            <input name=\"email\" type=\"email\" class=\"form-control\" id=\"exampleInputEmail1\" aria-describedby=\"emailHelp\" placeholder=\"example@gmail.com\">\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"form-group\">\n");
      out.write("                                            <i class=\"fas fa-lock\"></i>\n");
      out.write("                                            <label for=\"exampleInputPassword1\">Password</label>\n");
      out.write("                                            <input name=\"password\" type=\"password\" class=\"form-control\" id=\"exampleInputPassword1\" placeholder=\"Password\">\n");
      out.write("                                        </div>\n");
      out.write("                                        <!--                                    <div class=\"form-group\">\n");
      out.write("                                                                                <i class=\"fas fa-lock\"></i>\n");
      out.write("                                                                                <label for=\"exampleInputPassword1\">Confirm Password</label>\n");
      out.write("                                                                                <input type=\"password\" class=\"form-control\" id=\"exampleInputPassword1\" placeholder=\"Confirm Password\">\n");
      out.write("                                                                            </div>-->\n");
      out.write("                                        <div class=\"form-group\">\n");
      out.write("                                            <input type=\"submit\" class=\"btn btn-info btn-lg btn-block\" value=\"Register\">\n");
      out.write("                                        </div>\n");
      out.write("                                    </form>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <div class=\"mx-auto\">\n");
      out.write("            ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css\" integrity=\"sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO\" crossorigin=\"anonymous\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://use.fontawesome.com/releases/v5.6.1/css/all.css\" integrity=\"sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP\" crossorigin=\"anonymous\">\n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.3.1.slim.min.js\" integrity=\"sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js\" integrity=\"sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js\" integrity=\"sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy\" crossorigin=\"anonymous\"></script>\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body class=\"bg-light\">\n");
      out.write("        \n");
      out.write("        <div class=\"container\">\n");
      out.write("            <div class=\"row\">\n");
      out.write("\n");
      out.write("                <div class=\"col-sm-9\">\n");
      out.write("                    ");
 SessionFactory factory = HibernateUtil.getSessionFactory();
                        LokerInterface li = new LokerController(factory);
                        DateFormat formats = new SimpleDateFormat("d MMMM yyyy", Locale.ENGLISH);
                        for (Object loker : li.search("")) {
                            LowonganPekerjaan lowker = (LowonganPekerjaan) loker;
                            Date hire = lowker.getTanggalSelesai();
      out.write("\n");
      out.write("                    <div class=\"card shadow p-3 mb-3 bg-white rounded\" style=\"margin-top: 10px;\">\n");
      out.write("                        <div class=\"card-header\">\n");
      out.write("                            <h3>");
      out.print( lowker.getJudul());
      out.write("</h3>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"card-body\">\n");
      out.write("                            <h5 class=\"card-title\">Mitra Integrasi Informatika</h5>\n");
      out.write("                            <p class=\"card-text\">");
      out.print( lowker.getDeskripsi());
      out.write("</p>\n");
      out.write("                            <footer class=\"blockquote-footer\">Waktu berahir <cite title=\"Source Title\">");
      out.print( formats.format((hire)));
      out.write("</cite></footer>\n");
      out.write("                            <a href=\"../applyLokerServlet?id=");
      out.print( lowker.getId());
      out.write("\" class=\"card-link\" data-toggle=\"modal\" data-target=\"#cvModal\">Apply</a>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    ");
 }
      out.write("\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <!-- Modal Keahlian -->\n");
      out.write("                <!--                <div class=\"modal fade\" id=\"cvModal\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalCenterTitle\" aria-hidden=\"true\">\n");
      out.write("                                    <div class=\"modal-dialog modal-dialog-centered\" role=\"document\">\n");
      out.write("                                        <div class=\"modal-content\">\n");
      out.write("                                            <div class=\"modal-body\">\n");
      out.write("                ");
      out.write("\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>-->\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <footer class=\"fixed-bottom\">\n");
      out.write("            <nav class=\"navbar navbar-expand-lg navbar-dark bg-info fixed-bottom\">\n");
      out.write("                <div class=\"container\">\n");
      out.write("                    <p class=\"text-light\">&copy; 2018 Mitra Integrasi Informatika. All rights reserved.</p>\n");
      out.write("                </div>\n");
      out.write("            </nav>\n");
      out.write("        </footer>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
