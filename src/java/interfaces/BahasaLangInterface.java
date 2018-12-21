package interfaces;

import java.util.List;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Nitani
 */
public interface BahasaLangInterface {
    public List<Object> search(String keyword);

    public boolean insert(String user, String bahasa, String rate);

    public boolean delete(String id, String nama);
    
    public Object getById(Object id);
}
