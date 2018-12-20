/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.DAOInterface;
import daos.GeneralDAO;
import entities.Jurusan;
import entities.RiwayatPendidikan;
import entities.Universitas;
import entities.UserProfile;
import interfaces.PendidikanInterface;
import java.math.BigDecimal;
import java.util.List;
import org.hibernate.SessionFactory;

/**
 *
 * @author Nitani
 */
public class PendidikanController implements PendidikanInterface{
    
    private SessionFactory factory;
    private GeneralDAO gdao = new GeneralDAO(factory);
    private DAOInterface daoid = new GeneralDAO(factory);

    public PendidikanController() {
    }

    public PendidikanController(SessionFactory factory) {
        this.factory = factory;
        this.gdao = new GeneralDAO(factory);
        this.daoid = new GeneralDAO(factory);
    }

    @Override
    public List<Object> search(String keyword) {
        return this.daoid.doDDL(new RiwayatPendidikan(), keyword);
    }

    @Override
    public boolean insert(String ipk, String jurusanId, String universitasId, String userProfileId) {
        boolean hasil = false;
        try {
            RiwayatPendidikan use = new RiwayatPendidikan(new BigDecimal(ipk), new Jurusan(Integer.valueOf(jurusanId)), new Universitas(Integer.valueOf(universitasId)), new UserProfile(Integer.valueOf(userProfileId)));
            if (daoid.doDML(use, false)) {
                hasil = true;
            }
        } catch (Exception e) {
            e.getMessage();
        }
        return hasil;
    }

    @Override
    public List<Object> getAll(String keyword) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
