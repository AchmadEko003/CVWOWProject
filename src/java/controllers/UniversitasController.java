/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.DAOInterface;
import daos.GeneralDAO;
import entities.Requirements;
import entities.Universitas;
import interfaces.UniversitasInterface;
import java.util.List;
import org.hibernate.SessionFactory;

/**
 *
 * @author Igaz
 */
public class UniversitasController implements UniversitasInterface{

     private SessionFactory factory;
    private DAOInterface daoid = new GeneralDAO(factory);

    public UniversitasController() {
    }

    public UniversitasController(SessionFactory factory) {
        this.factory = factory;
        this.daoid = new GeneralDAO(factory);
    }
    
    
    
    @Override
    public List<Object> search(String keyword) {
        return daoid.doDDL(new Universitas(), keyword);
    }

    @Override
    public boolean insert(String nama, String akreditasi) {
        boolean result = false;
        try {
            Universitas universitas = new Universitas(nama, akreditasi);
            if (daoid.doDML(universitas, false)) {
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
    public boolean delete(String id, String nama, String akreditasi) {
        boolean hasil = false;
        try {
            int idB = Integer.parseInt(id);
            Universitas b = new Universitas(idB, nama, akreditasi);
            if (daoid.doDML(b, true)) {
                hasil = true;
            }
        } catch (Exception e) {
            e.getMessage();
        }
        return hasil;
    }
    
}
