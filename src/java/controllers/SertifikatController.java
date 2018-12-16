/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.DAOInterface;
import daos.GeneralDAO;
import entities.Sertifikat;
import entities.UserProfile;
import interfaces.SertifikatInterface;
import java.util.List;
import org.hibernate.SessionFactory;

/**
 *
 * @author Igaz
 */
public class SertifikatController implements SertifikatInterface{

    private SessionFactory factory;
    private DAOInterface daoid = new GeneralDAO(factory);

    public SertifikatController() {
    }

    public SertifikatController(SessionFactory factory) {
        this.factory = factory;
        this.daoid = new GeneralDAO(factory);
    }
    
    
    
    @Override
    public List<Object> search(String keyword) {
        return daoid.doDDL(new Sertifikat(), keyword);
    }

    @Override
    public boolean insert(String nama, String lembaga, String userProfileId) {
        boolean result = false;
        try {
            UserProfile up = new UserProfile(Integer.parseInt(userProfileId));
            Sertifikat ser = new Sertifikat(nama, lembaga, up);
            if (daoid.doDML(ser, false)) {
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
        return daoid.getById(table, id);
    }
    
}
