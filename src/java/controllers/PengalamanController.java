/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.DAOInterface;
import daos.GeneralDAO;
import entities.Pengalaman;
import entities.UserProfile;
import interfaces.PengalamanInterface;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import org.hibernate.SessionFactory;

/**
 *
 * @author Igaz
 */
public class PengalamanController implements PengalamanInterface{

     private SessionFactory factory;
    private DAOInterface daoid = new GeneralDAO(factory);

    public PengalamanController() {
    }

    public PengalamanController(SessionFactory factory) {
        this.factory = factory;
        this.daoid = new GeneralDAO(factory);
    }
    
    
    
    @Override
    public List<Object> search(String keyword) {
       return daoid.doDDL(new Pengalaman(), keyword);
    }

    @Override
    public boolean insert(String deskripsi, String perusahaan, String posisi, String mulaiBekerja, String selesaiBekerja, 
            String userProfileId) {
       boolean result = false;
        try {
            UserProfile up = new UserProfile(Integer.valueOf(userProfileId));
            DateFormat format = new SimpleDateFormat("MM/dd/yyyy", Locale.ENGLISH);
            Date dMulai = format.parse(mulaiBekerja);
            Date dSelesai = format.parse(selesaiBekerja);
            Pengalaman p = new Pengalaman(deskripsi, perusahaan, posisi, dMulai, dSelesai, up);
            if (daoid.doDML(p, false)) {
                result = true;
            }
        } catch (Exception e) {
        }
       return result;
    }

    @Override
    public boolean delete(String id, String nama) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Object getById(Object table, Object id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
