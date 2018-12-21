/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.DAOInterface;
import daos.GeneralDAO;
import entities.Bahasa;
import entities.UserProfile;
import entities.User;
import interfaces.UserProfileInterface;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import org.hibernate.SessionFactory;

/**
 *
 * @author Nitani
 */
public class UserProfileController implements UserProfileInterface {

    private SessionFactory factory;
    private GeneralDAO gdao = new GeneralDAO(factory);
    private DAOInterface daoid = new GeneralDAO(factory);

    public UserProfileController() {
    }

    public UserProfileController(SessionFactory factory) {
        this.factory = factory;
        this.gdao = new GeneralDAO(factory);
        this.daoid = new GeneralDAO(factory);
    }

    @Override
    public List<Object> search(String keyword) {
        return daoid.doDDL(new UserProfile(), keyword);
    }

    @Override
    public boolean inputData(String nama, String umur, String alamat, String tanggalLahir, String noTelpon, String foto, String cv, String ktp, String userId) {
        boolean hasil = false;
        try {
            DateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
            Date dates = format.parse(tanggalLahir);
            byte[] a = foto.getBytes();
            byte[] b = cv.getBytes();
            byte[] c = ktp.getBytes();
//            UserProfile up = new UserProfile(Integer.valueOf(""), nama, Integer.valueOf(umur), alamat, dates, Integer.valueOf(noTelpon), a, b, c);
            System.out.println(nama);
            System.out.println(umur);
            System.out.println(alamat);
            System.out.println(tanggalLahir);
            System.out.println(noTelpon);
            System.out.println(foto);
            System.out.println(cv);
            System.out.println(ktp);
            System.out.println(userId);
            UserProfile up = new UserProfile(nama, Integer.valueOf(umur), alamat, dates, Integer.valueOf(noTelpon), a, b, c, new User(Integer.valueOf(userId)));
            if (daoid.doDML(up, false)) {
                hasil = true;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return hasil;
    }

    @Override
    public Object getById(Object id) {
        return this.daoid.getIdProfile(id);
    }

    @Override
    public Object getIdProfileIdUser(Object id) {
        return this.daoid.getIdProfileIdUser(id);
    }

    @Override
    public boolean update(String id, String nama, String umur, String alamat, String tanggalLahir, String noTelpon, String foto, String cv, String ktp, String userId) {
        boolean hasil = false;
        try {
            DateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
            Date dates = format.parse(tanggalLahir);
            byte[] a = foto.getBytes();
            byte[] b = cv.getBytes();
            byte[] c = ktp.getBytes();
            UserProfile up = new UserProfile(Integer.valueOf(id), nama, Integer.valueOf(umur), alamat, dates, Integer.valueOf(noTelpon), a, b, c, new User(Integer.valueOf(userId)));
            
            if (daoid.doDML(up, false)) {
                hasil = true;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return hasil;
    }

    @Override
    public Object getProfileIdByID(Object id) {
        return this.daoid.getProfileIdByID(id);
    }
}
