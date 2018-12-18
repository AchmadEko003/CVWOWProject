/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controllers.JurusanController;
import controllers.KeahlianController;
import controllers.PendidikanController;
import controllers.UniversitasController;
import entities.Jurusan;
import entities.Universitas;
import entities.User;
import interfaces.JurusanInterface;
import interfaces.KeahlianInterface;
import interfaces.PendidikanInterface;
import interfaces.UniversitasInterface;
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
@WebServlet(name = "addPendidikan", urlPatterns = {"/addPendidikan"})
public class addPendidikan extends HttpServlet {

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
        String instansi = request.getParameter("instansi");
        String univ = request.getParameter("univ");
        String jurusan = request.getParameter("jurusan");
        String ipk = request.getParameter("ipk");
        HttpSession session = request.getSession();
        try (PrintWriter out = response.getWriter()) {
            SessionFactory SessionFactory = new HibernateUtil().getSessionFactory();
            PendidikanInterface i = new PendidikanController(SessionFactory);
            UniversitasInterface ui = new UniversitasController(SessionFactory);
            JurusanInterface ji = new JurusanController(SessionFactory);
            User r = (User) session.getAttribute("userData");
            Universitas u = (Universitas) ui.getById(univ);
            Jurusan j = (Jurusan) ji.getById(jurusan);
            
            if (i.insert(instansi, ipk, j.getId().toString(), u.getId().toString(), r.getId().toString())); {
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
