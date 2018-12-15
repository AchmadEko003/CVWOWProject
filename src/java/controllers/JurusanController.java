/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.DAOInterface;
import daos.GeneralDAO;
import entities.Jurusan;
import interfaces.JurusanInterface;
import java.util.List;
import org.hibernate.SessionFactory;

/**
 *
 * @author Igaz
 */
public class JurusanController implements JurusanInterface{

    private SessionFactory factory;
    private DAOInterface daoid = new GeneralDAO(factory);

    public JurusanController() {
    }

    public JurusanController(SessionFactory factory) {
        this.factory = factory;
        this.daoid = new GeneralDAO(factory);
    }
    
    
    
    @Override
    public List<Object> search(String keyword) {
        return daoid.doDDL(new Jurusan(), keyword);
    }

    @Override
    public boolean insert(String nama) {
        boolean result = false;
        try {
            Jurusan j = new Jurusan(nama);
            if (daoid.doDML(j, false)) {
                result = true;
            }
        } catch (Exception e) {
            e.getMessage();
        }
        return result;
    }
    
}
