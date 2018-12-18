/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.DAOInterface;
import daos.GeneralDAO;
import entities.Keahlian;
import entities.UserProfile;
import interfaces.KeahlianInterface;
import java.util.List;
import org.hibernate.SessionFactory;

/**
 *
 * @author Nitani
 */
public class KeahlianController implements KeahlianInterface {

    private SessionFactory factory;
    private GeneralDAO gdao = new GeneralDAO(factory);
    private DAOInterface daoid = new GeneralDAO(factory);

    public KeahlianController() {
    }

    public KeahlianController(SessionFactory factory) {
        this.factory = factory;
        this.gdao = new GeneralDAO(factory);
        this.daoid = new GeneralDAO(factory);
    }

    @Override
    public List<Object> search(String keyword) {
        return this.daoid.doDDL(new Keahlian(), keyword);
    }

    @Override
    public boolean insert(String nama, String deskripsi, String userProfileId) {
        boolean hasil = false;
        try {
            Keahlian use = new Keahlian(nama, deskripsi, new UserProfile(Integer.valueOf(userProfileId)));
            if (daoid.doDML(use, false)) {
                hasil = true;
            }
        } catch (Exception e) {
            e.getMessage();
        }
        return hasil;
    }

//    @Override
//    public boolean delete(String id, String nama, String deskripsi) {
//        boolean hasil = false;
//        try {
//            int idB = Integer.parseInt(id);
//            Keahlian b = new Keahlian(idB, nama, deskripsi);
//            if (daoid.doDML(b, true)) {
//                hasil = true;
//            }
//        } catch (Exception e) {
//            e.getMessage();
//        }
//        return hasil;
//    }

    @Override
    public Object getById(Object table, Object id) {
        return daoid.getById(table, id);
    }

    @Override
    public boolean delete(String id, String nama) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
