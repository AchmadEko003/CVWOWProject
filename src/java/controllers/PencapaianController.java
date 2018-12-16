/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.DAOInterface;
import daos.GeneralDAO;
import entities.Pencapaian;
import entities.UserProfile;
import interfaces.PencapaianInterface;
import java.util.List;
import org.hibernate.SessionFactory;

/**
 *
 * @author Igaz
 */
public class PencapaianController implements PencapaianInterface{

    private SessionFactory factory;
    private DAOInterface daoi = new GeneralDAO(factory);

    public PencapaianController() {
    }

    public PencapaianController(SessionFactory factory) {
        this.factory = factory;
        this.daoi = new GeneralDAO(factory);
    }
    
    
    @Override
    public List<Object> search(String keyword) {
        return daoi.doDDL(new Pencapaian(), keyword);
    }

    @Override
    public boolean insert(String nama, String deskripsi, String userProfileId) {
        boolean result = false;
        try {
            UserProfile up = new UserProfile(Integer.valueOf(userProfileId));
            Pencapaian p = new Pencapaian(nama, deskripsi, up);
            if (daoi.doDML(p, false)) {
                result = true;
            }
        } catch (Exception e) {
            e.getMessage();
        }
        return result;
    }

    @Override
    public boolean delete(String id, String nama) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Object getById(Object table, Object id) {
        return daoi.getById(table, id);
    }
    
}
