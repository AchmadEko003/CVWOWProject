/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tools;

/**
 *
 * @author Nitani
 */
public class getDataLogin {
    static private String usersName;
    static private Integer usersId;
    static private Integer role;
    static private Integer userProfileId;
    static private Integer lokerId;
    static private Integer cvId;

    public static String getUsersName() {
        return usersName;
    }

    public static void setUsersName(String usersName) {
        getDataLogin.usersName = usersName;
    }

    public static Integer getUsersId() {
        return usersId;
    }

    public static void setUsersId(Integer usersId) {
        getDataLogin.usersId = usersId;
    }

    public static Integer getRole() {
        return role;
    }

    public static void setRole(Integer role) {
        getDataLogin.role = role;
    }

    public static Integer getUserProfileId() {
        return userProfileId;
    }

    public static void setUserProfileId(Integer userProfileId) {
        getDataLogin.userProfileId = userProfileId;
    }

    public static Integer getLokerId() {
        return lokerId;
    }

    public static void setLokerId(Integer lokerId) {
        getDataLogin.lokerId = lokerId;
    }    

    public static Integer getCvId() {
        return cvId;
    }

    public static void setCvId(Integer cvId) {
        getDataLogin.cvId = cvId;
    }
}
