/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.DAOInterface;
import daos.GeneralDAO;
import entities.Bahasa;
import entities.BahasaLang;
import entities.UserProfile;
import interfaces.BahasaLangInterface;
import java.util.List;
import org.hibernate.SessionFactory;

/**
 *
 * @author Nitani
 */
public class BahasaLangController implements BahasaLangInterface {

    private SessionFactory factory;
    private GeneralDAO gdao = new GeneralDAO(factory);
    private DAOInterface daoid = new GeneralDAO(factory);

    public BahasaLangController() {
    }

    public BahasaLangController(SessionFactory factory) {
        this.factory = factory;
        this.gdao = new GeneralDAO(factory);
        this.daoid = new GeneralDAO(factory);
    }

    @Override
    public List<Object> search(String keyword) {
        return this.daoid.doDDL(new BahasaLang(), keyword);
    }

    @Override
    public boolean insert(String user, String bahasa) {
        boolean hasil = false;
        try {
            BahasaLang use = new BahasaLang(new Bahasa(Integer.valueOf(bahasa)), new UserProfile(Integer.valueOf(user)));
            if (daoid.doDML(use, false)) {
                hasil = true;
            }
        } catch (Exception e) {
            e.getMessage();
        }
        return hasil;
    }

    @Override
    public boolean delete(String id, String nama) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Object getById(Object id) {
        return this.daoid.getAttributBahasa(id);
    }

}
