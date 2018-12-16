/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.DAOInterface;
import daos.GeneralDAO;
import entities.Bahasa;
import entities.User;
import entities.UserProfile;
import interfaces.UserProfileInterface;
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
public class UserProfileController implements UserProfileInterface {

    private SessionFactory factory;
    private DAOInterface daoid = new GeneralDAO(factory);

    public UserProfileController() {
    }

    public UserProfileController(SessionFactory factory) {
        this.factory = factory;
        this.daoid = new GeneralDAO(factory);
    }

    @Override
    public List<Object> search(String keyword) {
        return daoid.doDDL(new UserProfile(), keyword);
    }

    @Override
    public boolean insert(String nama, String umur, String alamat, String tanggalLahir, String noTelpon, String bahasaId, String userId) {
        boolean result = false;
        try {
            int umurNew = Integer.valueOf(umur);
            DateFormat format = new SimpleDateFormat("MM/dd/yyyy", Locale.ENGLISH);
            Date dates = format.parse(tanggalLahir);
            int noTelp = Integer.valueOf(noTelpon);
            Bahasa bhs = new Bahasa(Integer.valueOf(bahasaId));
            User user = new User(Integer.valueOf(userId));
            UserProfile up = new UserProfile(nama, umurNew, alamat, dates, noTelp, bhs, user);
            if (daoid.doDML(up, false)) {
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
