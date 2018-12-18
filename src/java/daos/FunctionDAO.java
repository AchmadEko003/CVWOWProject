/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import entities.Bahasa;
import entities.Jurusan;
import entities.LowonganPekerjaan;
import entities.Requirements;
import entities.Universitas;
import java.io.FileInputStream;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import entities.User;
import entities.UserProfile;
import tools.BCrypt;

/**
 *
 * @author Ignatius
 */
public class FunctionDAO {

    private SessionFactory factory;
    private Session session;
    private Transaction transaction;

    public FunctionDAO() {
    }

    public FunctionDAO(SessionFactory factory) {
        this.factory = factory;
    }

    /**
     * Fungsi untuk melakukan insert atau update Region
     *
     * @param region
     * @param isDelete
     * @return
     */
    public boolean insertOrUpdateOrDelete(Object object,
            boolean isDelete) {
        boolean result = false;
        try {
            session = factory.openSession();
            transaction = session.beginTransaction();
            if (isDelete) {
                session.delete(object);
            } else {
                session.saveOrUpdate(object);
            }
            result = true;
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return result;
    }

    /**
     *
     * @param query
     * @return
     */
    public List<Object> getDatas(Object entities, String key) {
        List<Object> rs = new ArrayList<>();
        String className = entities.getClass().getSimpleName();
        className = className.substring(className.indexOf(".") + 1);
        String query = "From " + className;
        if (!key.equals("")) {
            query = getQuery(entities, key, query);
        }
        try {
            session = factory.openSession();
            transaction = session.beginTransaction();
            rs = session.createQuery(query).list();
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return rs;
    }

    public String getQuery(Object entity, String key, String query) {
        String className = entity.getClass().getName();
        query += " WHERE ";
        for (Object r : entity.getClass().getDeclaredFields()) {
            String field = r + "";
            if (!field.contains("UID") && !field.contains("List")) {
                field = field.substring(field.lastIndexOf(".") + 1);
                query += field + " LIKE '%" + key + "%' OR ";
            }
        }
        query = query.substring(0, query.lastIndexOf("OR")) + " ORDER BY 1";

        return query;
    }

    /**
     *
     * @param query
     * @return
     */
    public Object getById(Object table, Object id) {
        Object object = new Object();
        String className = table.getClass().getName();
        className = className.substring(className.indexOf(".") + 1);
        String query = "FROM " + className + " where Id =" + id;
        System.out.println(query);
        try {
            session = factory.openSession();
            transaction = session.beginTransaction();
            object = session.createQuery(query).uniqueResult();
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return object;
    }

    public boolean insImg(int paramIndex, InputStream stream, long length) {
        boolean hasil = false;
        Object object = new Object();
        try {
            String query = "insert into IMGTABLE values(?,?)";
            session = factory.openSession();
            transaction = session.beginTransaction();
            object = session.createQuery(query).uniqueResult();
            FileInputStream fin = new FileInputStream("C:\\Users\\Nitani\\Pictures\\Capture.png");
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return hasil;
    }

    public User login(Object user) {
        User object = null;
        String query = "from User where email= '" + user + "'";
        System.out.println(query);
        try {
            session = factory.openSession();
            transaction = session.beginTransaction();
            object = (User) session.createQuery(query).uniqueResult();
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return object;
    }
//    

    public Integer getUser(Object user) {
        Integer a;
        User e = this.login(user);
        a = e.getId();
        return a;
    }

    public boolean validationLogin(Object user, String password) {
        User e = this.login(user);
        if (e != null) {
            if (BCrypt.checkpw(password, e.getPassword())) {
                return true;
            }
        }
        return false;
    }

    public UserProfile getProfileId(Object user) {
        UserProfile object = null;
        String query = "from UserProfile where USER_ID= " + user;
        System.out.println(query);
        try {
            session = factory.openSession();
            transaction = session.beginTransaction();
            object = (UserProfile) session.createQuery(query).uniqueResult();
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return object;
    }
//    
//    public boolean getProfilesId(Object user){
//        boolean hasil = false;
//        UserProfile e = this.getProfileId(user);
//        if(e != null){
//            hasil = true;
//        }
//        return hasil;
//    }

    public List<Object> getDatasId(Object entities, String key) {
        List<Object> rs = new ArrayList<>();
        String className = entities.getClass().getSimpleName();
        className = className.substring(className.indexOf(".") + 1);
        System.out.println(className);
        String query = "From " + className + " where USER_PROFILE_ID=" + key;
        System.out.println(query);
        try {
            session = factory.openSession();
            transaction = session.beginTransaction();
            rs = session.createQuery(query).list();
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return rs;
    }

    public Object getAttributPendidikan(Object table, Object user) {
        Object object = null;
        String query = "";
        if (table == "univ") {
            query = "from Universitas where NAMA= '" + user + "'";
        } else {
            query = "from Jurusan where NAMA= '" + user + "'";
        }
        System.out.println(query);
        try {
            session = factory.openSession();
            transaction = session.beginTransaction();
            if (table == "univ") {
                object = (Universitas) session.createQuery(query).uniqueResult();
            } else {
                object = (Jurusan) session.createQuery(query).uniqueResult();
            }
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return object;
    }

    public Object getAttributReq(Object user) {
        Object object = null;
        String query = "from Requirements where NAMA= '" + user + "'";

        System.out.println(query);
        try {
            session = factory.openSession();
            transaction = session.beginTransaction();
            object = (Requirements) session.createQuery(query).uniqueResult();

            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return object;
    }
    
    public LowonganPekerjaan getLoker(Object user) {
        LowonganPekerjaan object = null;
        String query = "from LowonganPekerjaan where ID= " + user;
        System.out.println(query);
        try {
            session = factory.openSession();
            transaction = session.beginTransaction();
            object = (LowonganPekerjaan) session.createQuery(query).uniqueResult();
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return object;
    }
    
    public Bahasa getBahasa(Object user) {
        Bahasa object = null;
        String query = "from Bahasa where NAMA= '" + user + "'";
        System.out.println(query);
        try {
            session = factory.openSession();
            transaction = session.beginTransaction();
            object = (Bahasa) session.createQuery(query).uniqueResult();
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return object;
    }
}
