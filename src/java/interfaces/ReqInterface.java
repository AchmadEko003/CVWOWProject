/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

import java.util.List;

/**
 *
 * @author Igaz
 */
public interface ReqInterface {
    
    public List<Object> search(String keyword);

    public boolean insert(String nama);
    
    public Object getById(Object id);
    
    public boolean delete(String id, String nama);
    
}
