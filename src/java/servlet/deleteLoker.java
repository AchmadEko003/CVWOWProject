/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controllers.LokerController;
import controllers.ReqController;
import entities.LowonganPekerjaan;
import entities.Requirements;
import entities.User;
import interfaces.LokerInterface;
import interfaces.ReqInterface;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.SessionFactory;
import tools.HibernateUtil;

/**
 *
 * @author Nitani
 */
@WebServlet(name = "deleteLoker", urlPatterns = {"/deleteLoker"})
public class deleteLoker extends HttpServlet {

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
        String id = request.getParameter("id");
        HttpSession session = request.getSession();
        try (PrintWriter out = response.getWriter()) {
            SessionFactory sessionFactory = new HibernateUtil().getSessionFactory();
            LokerInterface i = new LokerController(sessionFactory);
            LowonganPekerjaan lp = (LowonganPekerjaan) i.getByIds(8);
            ReqInterface ri = new ReqController(sessionFactory);
            User r = (User) session.getAttribute("userData");
            out.println(lp.getId());
            out.println(lp.getJudul());
            out.println(lp.getDeskripsi());
            out.println(lp.getTanggalMulai());
            out.println(lp.getTanggalSelesai().toString());
            out.println(lp.getRequirementsId().toString());
            out.println(lp.getUserId());

            if (i.delete(lp)) {
                response.sendRedirect("index.jsp");
            }
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
