/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controllers.UserProfileController;
import entities.User;
import interfaces.UserProfileInterface;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Base64;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
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
public class addProfileServlet extends HttpServlet {

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
        String nama = request.getParameter("nama");
        String umur = request.getParameter("umur");
        String alamat = request.getParameter("alamat");
        String tanggal = request.getParameter("tglLahir");
        String noTelp = request.getParameter("telp");
        String foto = request.getParameter("foto");
        String cv = request.getParameter("cv");
        String ktp = request.getParameter("ktp");
        
        HttpSession session = request.getSession();
        try (PrintWriter out = response.getWriter()) {
            SessionFactory SessionFactory = new HibernateUtil().getSessionFactory();
            UserProfileInterface i = new UserProfileController(SessionFactory);
            User r = (User) session.getAttribute("userData");
            if (i.inputData(nama, umur, alamat, tanggal, noTelp, upload(foto), upload(cv), upload(ktp), r.getId().toString())) {
                response.sendRedirect("index.jsp");
            }
        }
    }

    protected String upload(String files) throws IOException {
        String hasil = "";
        File filee = new File(files);
        BufferedImage bufferedImage = ImageIO.read(filee);
        String a = bufferedImage.toString();
        hasil = Base64.getUrlEncoder().encodeToString(a.getBytes());
        return hasil;
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
