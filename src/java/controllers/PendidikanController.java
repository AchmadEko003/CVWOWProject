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
import java.util.List;
import org.hibernate.SessionFactory;

/**
 *
 * @author Igaz
 */
public class PendidikanController implements PendidikanInterface{

     private SessionFactory factory;
    private DAOInterface daoid = new GeneralDAO(factory);

    public PendidikanController() {
    }

    public PendidikanController(SessionFactory factory) {
        this.factory = factory;
        this.daoid = new GeneralDAO(factory);
    }
    
    @Override
    public List<Object> search(String keyword) {
        return daoid.doDatasId(new RiwayatPendidikan(), keyword);
    }

    
    
    @Override
    public boolean insert(String instansi, String ipk, String jurusanId, String universitasId, String userProfileId) {
        boolean result = false;
        try {
            int ipkNew = Integer.parseInt(ipk);
            Jurusan j = new Jurusan(Integer.parseInt(jurusanId));
            Universitas univ = new Universitas(Integer.parseInt(universitasId));
            UserProfile up = new UserProfile(Integer.parseInt(userProfileId));
            RiwayatPendidikan rp = new RiwayatPendidikan(instansi, ipkNew, j, univ, new UserProfile(1));
            if (daoid.doDML(rp, false)) {
                result = true;
            }
        } catch (Exception e) {
            e.getMessage();
        }
        return result;
    }

    @Override
    public List<Object> getAll(String keyword) {
        return daoid.doDDL(new RiwayatPendidikan(), "");
    }

    
    
}
