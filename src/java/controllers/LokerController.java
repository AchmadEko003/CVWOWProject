/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.DAOInterface;
import daos.GeneralDAO;
import entities.LowonganPekerjaan;
import entities.Requirements;
import entities.User;
import interfaces.LokerInterface;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import org.hibernate.SessionFactory;

/**
 *
 * @author Nitani
 */
public class LokerController implements LokerInterface {

    private SessionFactory factory;
    private GeneralDAO gdao = new GeneralDAO(factory);
    private DAOInterface daoid = new GeneralDAO(factory);

    public LokerController() {
    }

    public LokerController(SessionFactory factory) {
        this.factory = factory;
        this.gdao = new GeneralDAO(factory);
        this.daoid = new GeneralDAO(factory);
    }

    @Override
    public List<Object> search() {
        return this.daoid.listLokerIsDelete();
    }

    @Override
    public boolean insert(String judul, String deskripsi, String tanggalSelesai, String requirementsId, String userId) {
        boolean hasil = false;
        try {
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            System.out.println("1");
            DateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
            System.out.println("2");
            Date dates = format.parse(tanggalSelesai);
            LocalDate localDate = LocalDate.now();
            String tglMulai = dtf.format(localDate);
            Date mulai = format.parse(tglMulai);
            System.out.println(mulai);
            LowonganPekerjaan use = new LowonganPekerjaan(judul, deskripsi, mulai, dates, 1, new Requirements(Integer.valueOf(requirementsId)), new User(Integer.valueOf(userId)));
            if (daoid.doDML(use, false)) {
                hasil = true;
            }
        } catch (Exception e) {
            e.getMessage();
        }
        return hasil;
    }

    @Override
    public Object getByIds(Object id) {
        return this.daoid.getLoker(id);
    }

    @Override
    public boolean delete(LowonganPekerjaan lp) {
        boolean hasil = false;
        try {
            lp.setIsdelete(0);
            if (daoid.doDML(lp, false)) {
                hasil = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return hasil;
    }

}
