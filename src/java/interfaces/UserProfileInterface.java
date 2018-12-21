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
public interface UserProfileInterface {

    public List<Object> search(String keyword);

    public boolean inputData(String nama, String umur, String alamat, String tanggalLahir, String noTelpon, String foto, String cv, String ktp, String userId);
    
    public boolean update(String id, String nama, String umur, String alamat, String tanggalLahir, String noTelpon, String foto, String cv, String ktp, String userId);

    public Object getById(Object id);
    
    public Object getProfileIdByID(Object id);
    
    public Object getIdProfileIdUser(Object id);
}
