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
public interface LokerInterface {

    public List<Object> search(String keyword);

    public boolean insert(String judul, String deskripsi, String tanggalSelesai, String requirementsId, String userId);

    public Object getByIds(Object id);
}
