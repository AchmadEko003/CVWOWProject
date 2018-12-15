/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.DAOInterface;
import daos.GeneralDAO;
import entities.Bahasa;
import entities.Requirements;
import interfaces.ReqInterface;
import java.util.List;
import org.hibernate.SessionFactory;

/**
 *
 * @author Igaz
 */
public class ReqController implements ReqInterface{

    private SessionFactory factory;
    private DAOInterface daoid = new GeneralDAO(factory);

    public ReqController() {
    }

    public ReqController(SessionFactory factory) {
        this.factory = factory;
        this.daoid = new GeneralDAO(factory);
    }
    
    
    
    @Override
    public List<Object> search(String keyword) {
        return daoid.doDDL(new Requirements(), keyword);
    }

    @Override
    public boolean insert(String nama) {
        boolean result = false;
        try {
            Requirements r = new Requirements(nama);
            if (daoid.doDML(r, false)) {
                result = true;
            }
        } catch (Exception e) {
            e.getMessage();
        }
        return result;
    }

    @Override
    public Object getById(Object table, Object id) {
        return daoid.getById(table, id);
    }

    @Override
    public boolean delete(String id, String nama) {
        boolean hasil = false;
        try {
            int idB = Integer.parseInt(id);
            Requirements b = new Requirements(idB, nama);
            if (daoid.doDML(b, true)) {
                hasil = true;
            }
        } catch (Exception e) {
            e.getMessage();
        }
        return hasil;
    }
    
}
