/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tools;

import controllers.UserController;
import entities.User;
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
//            System.out.println(emp.insert("222", "a", "b", "fsfes", "2301293", "08/08/2009", "IT_PROG", "5000", "0.0", "100", "100"));
//        System.out.println(emp.getById("220"));
        System.out.println(ui.search(""));
//            for (Object emp2 : emp.search("")) {
//                Regions en = (Regions) emp2;
//                System.out.println(en.getRegionName());
//    }
    }
}
