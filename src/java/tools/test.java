/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tools;

import controllers.JurusanController;
import controllers.PendidikanController;
import controllers.UniversitasController;
import controllers.UserController;
import entities.Jurusan;
import entities.Universitas;
import entities.User;
import entities.UserProfile;
import interfaces.JurusanInterface;
import interfaces.PendidikanInterface;
import interfaces.UniversitasInterface;
import interfaces.UserInterface;
import org.hibernate.SessionFactory;

/**
 *
 * @author Nitani
 */
public class test {

    public static void main(String[] args) {
        SessionFactory factory = HibernateUtil.getSessionFactory();
        UserInterface ui = new UserController(factory);
        UniversitasInterface universitasInterface = new UniversitasController(factory);
        JurusanInterface ji = new JurusanController(factory);
        PendidikanInterface pi = new PendidikanController(factory);
//            System.out.println(emp.insert("222", "a", "b", "fsfes", "2301293", "08/08/2009", "IT_PROG", "5000", "0.0", "100", "100"));
//        System.out.println(emp.getById("220"));
//        System.out.println(ui.register("ekoa","achmadawd@gmail.com","wkaoddwa3"));
//        System.out.println(ui.search("1"));
//            for (Object emp2 : emp.search("")) {
//                Regions en = (Regions) emp2;
//                System.out.println(en.getRegionName());
//    }

//        System.out.println(universitasInterface.insert("UB", "A"));
//            System.out.println(ji.insert("Teknik Informatika"));
            Jurusan j = new Jurusan();
            
            Universitas u = new Universitas();
            
            UserProfile user = new UserProfile();
            
            System.out.println(pi.insert("OPTiik", "3.23", "IT", "UB", "1"));
    }
}
