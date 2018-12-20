/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

import java.util.List;

/**
 *
 * @author Nitani
 */
public interface ApplyInterface {

    public List<Object> search(String keyword);

    public boolean insert(String status, String lowonganId, String userId);

    public Object getById(Object id);
    
    public List<Object> getByIdd (Object table, Object id);
}
