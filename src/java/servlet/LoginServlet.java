/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controllers.LokerController;
import controllers.UserController;
import controllers.UserProfileController;
import entities.User;
import entities.UserProfile;
import interfaces.LokerInterface;
import interfaces.UserInterface;
import interfaces.UserProfileInterface;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.SessionFactory;
import tools.BCrypt;
import tools.HibernateUtil;
import tools.getLoginData;

/**
 *
 * @author Nitani
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/loginServlet"})
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String emails = request.getParameter("emailsa");
        String password = request.getParameter("passwords");
        HttpSession session = request.getSession();
        try (PrintWriter out = response.getWriter()) {
            SessionFactory SessionFactory = new HibernateUtil().getSessionFactory();
            UserInterface i = new UserController(SessionFactory);
            UserProfileInterface ri = new UserProfileController(SessionFactory);
//            session.invalidate();

            if (i.login(emails, password)) {
                int idUser = i.getUser(emails);
                User r = (User) i.getById(idUser);
                UserProfile up = (UserProfile) ri.getById(r.getId());
                session.setAttribute("profile", up);
                session.setAttribute("userData", r);

                LokerInterface li = new LokerController(HibernateUtil.getSessionFactory());
                List<Object> datas = li.search("");
                session.setAttribute("lokerData", datas);
                response.sendRedirect("index.jsp");
            } else {
                out.print("gagal");
            }
//            response.sendRedirect("newjsp.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
