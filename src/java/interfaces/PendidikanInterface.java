/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

import entities.Jurusan;
import entities.Universitas;
import entities.UserProfile;
import java.util.List;

/**
 *
 * @author Igaz
 */
public interface PendidikanInterface {
    
    public List<Object> search(String keyword);
    public List<Object> getAll(String keyword);
    public boolean insert(String ipk, String jurusanId, String universitasId, String userProfileId);
    
}
