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
 * @author Nitani
 */
public class SertifikatController implements SertifikatInterface {

    private SessionFactory factory;
    private GeneralDAO gdao = new GeneralDAO(factory);
    private DAOInterface daoid = new GeneralDAO(factory);

    public SertifikatController() {
    }

    public SertifikatController(SessionFactory factory) {
        this.factory = factory;
        this.gdao = new GeneralDAO(factory);
        this.daoid = new GeneralDAO(factory);
    }

    @Override
    public boolean inputData(String nama, String lembaga, String userProfileId) {
        boolean hasil = false;
        try {
            Sertifikat use = new Sertifikat(nama, lembaga, new UserProfile(Integer.valueOf(userProfileId)));
            if (daoid.doDML(use, false)) {
                hasil = true;
            }
        } catch (Exception e) {
            e.getMessage();
        }
        return hasil;
    }

    @Override
    public List<Object> search(String keyword) {
        return daoid.doDatasId(new Sertifikat(), keyword);
    }

    @Override
    public boolean delete(String id, String nama, String lembaga) {
        boolean hasil = false;
        try {
            int idB = Integer.parseInt(id);
            Sertifikat b = new Sertifikat(idB, nama, lembaga);
            if (daoid.doDML(b, true)) {
                hasil = true;
            }
        } catch (Exception e) {
            e.getMessage();
        }
        return hasil;
    }

    @Override
    public Object getById(Object table, Object id) {
        return daoid.getById(table, id);
    }

}
