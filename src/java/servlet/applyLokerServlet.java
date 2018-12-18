/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controllers.ApplyController;
import controllers.LokerController;
import entities.LowonganPekerjaan;
import entities.User;
import interfaces.ApplyInterface;
import interfaces.LokerInterface;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import tools.HibernateUtil;

/**
 *
 * @author Nitani
 */
@WebServlet(name = "applyLokerServlet", urlPatterns = {"/applyLokerServlet"})
public class applyLokerServlet extends HttpServlet {

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
        String id = request.getParameter("id");
        HttpSession session = request.getSession();
        try (PrintWriter out = response.getWriter()) {
            LokerInterface i = new LokerController(HibernateUtil.getSessionFactory());
            ApplyInterface ia = new ApplyController(HibernateUtil.getSessionFactory());
            LowonganPekerjaan r = (LowonganPekerjaan) i.getByIds(id);
            out.print(id);
            out.println(r.getId());
            out.println(r.getDeskripsi());
            out.println(r.getJudul());
            out.println(r.getTanggalMulai());
            out.println(r.getTanggalSelesai());
            out.println(r.getUserId());
            session.setAttribute("idsa", r);
            User ra = (User) session.getAttribute("userData");
            if (ia.insert("Apply", id, ra.getId().toString())) {
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
