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
public interface ProjectInterface {
    public List<Object> search(String keyword);

    public boolean insert(String nama, String deskripsi, String status, String userProfileId);
}
