/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.DAOInterface;
import daos.GeneralDAO;
import entities.Bahasa;
import interfaces.BahasaInterface;
import java.util.List;
import org.hibernate.SessionFactory;

/**
 *
 * @author Igaz
 */
public class BahasaController implements BahasaInterface{

    private SessionFactory factory;
    private DAOInterface daoi = new GeneralDAO(factory);

    public BahasaController() {
    }

    public BahasaController(SessionFactory factory) {
        this.factory = factory;
        this.daoi = new GeneralDAO(factory);
    }
    
    
    
    @Override
    public List<Object> search(String keyword) {
        return daoi.doDDL(new Bahasa(), keyword);
    }

    @Override
    public boolean insert(String nama) {
        boolean result = false;
        try {
            Bahasa b = new Bahasa(nama);
            if (daoi.doDML(b, false)) {
                result = true;
            }
        } catch (Exception e) {
            e.getMessage();
        }
        return result;
    }

    @Override
    public boolean delete(String id, String nama) {
        boolean hasil = false;
        try {
            int idB = Integer.parseInt(id);
            Bahasa b = new Bahasa(idB, nama);
            if (daoi.doDML(b, true)) {
                hasil = true;
            }
        } catch (Exception e) {
            e.getMessage();
        }
        return hasil;
    }

    @Override
    public Object getById(Object table, Object id) {
        return daoi.getById(table, id);
    }
    
}
