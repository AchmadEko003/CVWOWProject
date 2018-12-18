/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.DAOInterface;
import daos.GeneralDAO;
import entities.Apply;
import entities.LowonganPekerjaan;
import entities.User;
import interfaces.ApplyInterface;
import java.util.List;
import org.hibernate.SessionFactory;

/**
 *
 * @author Nitani
 */
public class ApplyController implements ApplyInterface {

    private SessionFactory factory;
    private GeneralDAO gdao = new GeneralDAO(factory);
    private DAOInterface daoid = new GeneralDAO(factory);

    public ApplyController() {
    }

    public ApplyController(SessionFactory factory) {
        this.factory = factory;
        this.gdao = new GeneralDAO(factory);
        this.daoid = new GeneralDAO(factory);
    }

    @Override
    public List<Object> search(String keyword) {
        return this.daoid.doDDL(new Apply(), keyword);
    }

    @Override
    public boolean insert(String status, String lowonganId, String userId) {
        boolean hasil = false;
        try {
            Apply use = new Apply(status, new LowonganPekerjaan(Integer.valueOf(lowonganId)), new User(Integer.valueOf(userId)));
            if (daoid.doDML(use, false)) {
                hasil = true;
            }
        } catch (Exception e) {
            e.getMessage();
        }
        return hasil;
    }

}
