/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import java.io.InputStream;
import java.util.List;

/**
 *
 * @author Nitani
 */
public interface DAOInterface {
    public boolean doDML(Object object, boolean isDelete);//iud
    public List<Object> doDDL(Object table, String keyword);//sga
    public List<Object> doDatasId(Object table, String keyword);//sga
    public List<Object> listLokerIsDelete();
    public List<Object> getViewUserApply(Object id);
    public Object getById(Object table, Object id);
    public boolean insImg(int paramIndex,InputStream stream,long length);
    public boolean login(Object user, String password);
    public Integer getUser(Object user);
    public Object getIdProfile(Object id);
    public Object getIdProfileIdUser(Object id);
    public Object getAttributPendidikan(Object table, Object id);
    public Object getAttributReq(Object id);
    public Object getLoker(Object id);
    public Object getAttributBahasa(Object id);
    public Object getUserApply(Object id);
}
