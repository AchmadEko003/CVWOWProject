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
import entities.Jurusan;
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
import org.hibernate.SessionFactory;

/**
 *
 * @author Nitani
 */
public class test {

    public static void main(String[] args) {
        SessionFactory factory = HibernateUtil.getSessionFactory();
        UserInterface ui = new UserController(factory);
        UserProfileInterface upi = new UserProfileController(factory);
        SertifikatInterface si = new SertifikatController(factory);
        LokerInterface li = new LokerController(factory);
        ProjectInterface pi = new ProjectController(factory);
        PengalamanInterface peng = new PengalamanController(factory);
        KeahlianInterface ki = new KeahlianController(factory);
        ApplyInterface ai = new ApplyController(factory);
        PendidikanInterface pendidikanInterface = new PendidikanController(factory);
        UniversitasInterface universitasInterface = new UniversitasController(factory);
        JurusanInterface ji = new JurusanController(factory);
        BahasaLangInterface bli = new BahasaLangController(factory);
//        System.out.println(bli.insert("9", "1"));
//        System.out.println(ji.getById("TEKNIK ELEKTRO"));
//        System.out.println(universitasInterface.getById("UNIVERSITAS MUHAMMADIYAH MALANG"));
//        System.out.println(pendidikanInterface.insert("daw", "3", "2", "1", "7"));
//        System.out.println(ai.insert("Apply", "1", "6"));
//        System.out.println(emp.insert("222", "a", "b", "fsfes", "2301293", "08/08/2009", "IT_PROG", "5000", "0.0", "100", "100"));
//        System.out.println(emp.getById("220"));
//        System.out.println(ui.register("eko","achmadeko003@gmail.com","ekoeko123"));
//        System.out.println(upi.inputData("ddwa", "23", "kdwakd", "2018-12-17", "231", "", "", "", "12"));
//        System.out.println(si.delete("7", "aa", "va"));
//        System.out.println(li.search(""));
//        System.out.println(li.insert("Daw", "da", "2018-12-17", "1", "7"));
//        System.out.println(pi.insert("eko", "ko", "Selesai", "7"));
//        System.out.println(peng.insert("test", "MII", "A", "2018-12-17", "2018-12-17", "7"));
//        System.out.println(ki.insert("a", "v", "9"));
//        System.out.println(pi.search("a"));
//        System.out.println(ui.search("1"));
//            for (Object emp2 : emp.search("")) {
//                Regions en = (Regions) emp2;
//                System.out.println(en.getRegionName());
////    }
        
        for (Object object : ji.search("")) {
            Jurusan j = (Jurusan) object;
            System.out.println(j.getNama());
        }

    }
}
