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
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.*;
import java.util.Base64;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.tomcat.util.http.fileupload.FileUtils;
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
        String foto = request.getParameter("C:/Users/Nitani/Downloads/METRODATA/Data Karyawan/Transkrip Nilai.pdf");
        String cv = request.getParameter("cv");
        String ktp = request.getParameter("ktp");
        
        HttpSession session = request.getSession();
        try (PrintWriter out = response.getWriter()) {
            SessionFactory SessionFactory = new HibernateUtil().getSessionFactory();
            UserProfileInterface i = new UserProfileController(SessionFactory);
            User r = (User) session.getAttribute("userData");

//            Path p = Paths.get(cv);
//            Path folder = p.getParent();
//            out.print(encodeToString("C:/Users/Nitani/Downloads/METRODATA/Data Karyawan/Transkrip Nilai.pdf"));
//            out.print(upload("C:/Users/Nitani/Downloads/METRODATA/Data Karyawan/Transkrip Nilai.pdf"));
//            String a = encodeToString("C:/Users/Nitani/Downloads/METRODATA/SPKWT Achmad Eko Julianto.pdf");
//            out.print("<img src='data:image/png;base64," + a + "' style='width:500px; height:500px;'/>");
//            out.print("<embed src='data:application/pdf;base64," + a + "' width='100%' height='100%'>");
            out.print(i.inputData(nama, umur, alamat, tanggal, noTelp, encodeToString(foto), encodeToString(cv), encodeToString(ktp), r.getId().toString()));
//            if (i.inputData(nama, umur, alamat, tanggal, noTelp, encodeToString(foto), encodeToString(cv), encodeToString(ktp), r.getId().toString())) {
//                response.sendRedirect("index.jsp");
//            }
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
    
    public static String encodeToString(String file) throws FileNotFoundException, IOException {
        String encodedfile = "";
        File filee = new File(file);
        FileInputStream fileInputStreamReader = new FileInputStream(filee);
        byte imageData[] = new byte[(int) filee.length()];
        fileInputStreamReader.read(imageData);
        encodedfile = Base64.getEncoder().encodeToString(imageData);
        return encodedfile;
    }
    
    public static String decode(String file) throws FileNotFoundException, IOException {
        String encodedfile = "";
        FileOutputStream imageOutFile = new FileOutputStream("C:\\Users\\Nitani\\Downloads\\METRODATA");
        byte[] imageByteArray = Base64.getDecoder().decode(file);
        imageOutFile.write(imageByteArray);
//        FileOutputStream fos = new FileOutputStream("C:\\Users\\Nitani\\Downloads\\METRODATA");
//        fos.write(Base64.decode(file, Base64.NO_WRAP));
//        fos.close();
        return encodedfile;
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
