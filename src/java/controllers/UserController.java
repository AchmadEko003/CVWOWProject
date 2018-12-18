/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.DAOInterface;
import daos.GeneralDAO;
import entities.Role;
import entities.User;
import interfaces.UserInterface;
import java.util.List;
import org.hibernate.SessionFactory;

/**
 *
 * @author Nitani
 */
public class UserController implements UserInterface {

    private SessionFactory factory;
    private GeneralDAO gdao = new GeneralDAO(factory);
    private DAOInterface daoid = new GeneralDAO(factory);

    public UserController() {
    }

    public UserController(SessionFactory factory) {
        this.factory = factory;
        this.gdao = new GeneralDAO(factory);
        this.daoid = new GeneralDAO(factory);
    }

    @Override
    public List<Object> search(String keyword) {
        return daoid.doDDL(new User(), keyword);
    }

    @Override
    public boolean register(String nama, String email, String password) {
        boolean hasil = false;
        try {
            User use = new User(nama, email, password, new Role(1));
            if (daoid.doDML(use, false)) {
                hasil = true;
            }
        } catch (Exception e) {
            e.getMessage();
        }
        return hasil;
    }

    @Override
    public boolean login(Object nama, String password) {
        return this.daoid.login(nama, password);
    }

    @Override
    public Integer getUser(Object user) {
        return this.daoid.getUser(user);
    }

    @Override
    public Object getById(Object id) {
        return this.daoid.getById(new User(), id);
    }

}
