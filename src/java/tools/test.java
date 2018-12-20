/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tools;

import controllers.ApplyController;
import controllers.BahasaLangController;
import controllers.JurusanController;
import controllers.KeahlianController;
import controllers.LokerController;
import controllers.PendidikanController;
import controllers.PengalamanController;
import controllers.ProjectController;
import controllers.SertifikatController;
import controllers.UniversitasController;
import controllers.UserController;
import controllers.UserProfileController;
import entities.LowonganPekerjaan;
import entities.User;
import interfaces.ApplyInterface;
import interfaces.BahasaLangInterface;
import interfaces.JurusanInterface;
import interfaces.KeahlianInterface;
import interfaces.LokerInterface;
import interfaces.PendidikanInterface;
import interfaces.PengalamanInterface;
import interfaces.ProjectInterface;
import interfaces.SertifikatInterface;
import interfaces.UniversitasInterface;
import interfaces.UserInterface;
import interfaces.UserProfileInterface;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Base64;
import org.hibernate.SessionFactory;

/**
 *
 * @author Nitani
 */
public class test {

    public static void main(String[] args) throws IOException {

        SessionFactory factory = HibernateUtil.getSessionFactory();
//        UserInterface ui = new UserController(factory);
        UserProfileInterface upi = new UserProfileController(factory);
//        SertifikatInterface si = new SertifikatController(factory);
//        LokerInterface li = new LokerController(factory);
//        ProjectInterface pi = new ProjectController(factory);
//        PengalamanInterface peng = new PengalamanController(factory);
//        KeahlianInterface ki = new KeahlianController(factory);
//        ApplyInterface ai = new ApplyController(factory);
//        PendidikanInterface pendidikanInterface = new PendidikanController(factory);
//        UniversitasInterface universitasInterface = new UniversitasController(factory);
//        JurusanInterface ji = new JurusanController(factory);
//        BahasaLangInterface bli = new BahasaLangController(factory);

        String a = "C:\\Users\\Nitani\\Downloads\\METRODATA\\wr.jpg";
        String b = "C:\\Users\\Nitani\\Downloads\\METRODATA\\14415 - Achmad Eko Julianto.pdf";
        String c = "C:\\Users\\Nitani\\Downloads\\METRODATA\\Data Karyawan\\ktp.jpg";
//        System.out.println(ui.getAttributApplyUser("6"));
//        System.out.println(bli.insert("9", "1"));
//        System.out.println(ji.getById("TEKNIK ELEKTRO"));
//        System.out.println(universitasInterface.getById("UNIVERSITAS MUHAMMADIYAH MALANG"));
//        System.out.println(pendidikanInterface.insert("daw", "3", "2", "1", "7"));
//        System.out.println(ai.insert("Apply", "1", "6"));
//        System.out.println(emp.insert("222", "a", "b", "fsfes", "2301293", "08/08/2009", "IT_PROG", "5000", "0.0", "100", "100"));
//        System.out.println(emp.getById("220"));
//        System.out.println(ui.register("eko","achmadeko003@gmail.com","ekoeko123"));
        boolean as = upi.inputData("Achmad Eko", "22", "Jl.Nogogini", "1996-07-16", "082221383227", encodeToString(a), encodeToString(b), encodeToString(c), "12");
        System.out.println(as);
//        System.out.println(si.delete("7", "aa", "va"));
//        System.out.println(li.delete("7", "Test", "Testing Error", "2018-12-17", "2018-12-20", "2", "5"));
//        System.out.println(li.insert("Daw", "da", "2018-12-17", "2", "12"));
//        System.out.println(pi.insert("eko", "ko", "Selesai", "7"));
//        System.out.println(peng.insert("test", "MII", "A", "2018-12-17", "2018-12-17", "7"));
//        System.out.println(ki.insert("a", "v", "9"));
//        System.out.println(pi.search("a"));
//        System.out.println(ui.search("1"));
//            for (Object emp2 : emp.search("")) {
//                Regions en = (Regions) emp2;
//                System.out.println(en.getRegionName());
//    }
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
}
