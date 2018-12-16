/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Nitani
 */
@Entity
@Table(name = "sertifikat")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Sertifikat.findAll", query = "SELECT s FROM Sertifikat s")
    , @NamedQuery(name = "Sertifikat.findById", query = "SELECT s FROM Sertifikat s WHERE s.id = :id")
    , @NamedQuery(name = "Sertifikat.findByNama", query = "SELECT s FROM Sertifikat s WHERE s.nama = :nama")
    , @NamedQuery(name = "Sertifikat.findByLembaga", query = "SELECT s FROM Sertifikat s WHERE s.lembaga = :lembaga")})
public class Sertifikat implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "NAMA")
    private String nama;
    @Basic(optional = false)
    @Column(name = "LEMBAGA")
    private String lembaga;
    @JoinColumn(name = "USER_PROFILE_ID", referencedColumnName = "ID")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private UserProfile userProfileId;

    public Sertifikat() {
    }

    public Sertifikat(Integer id) {
        this.id = id;
    }

    public Sertifikat(Integer id, String nama, String lembaga) {
        this.id = id;
        this.nama = nama;
        this.lembaga = lembaga;
    }

    public Sertifikat(Integer id, String nama) {
        this.id = id;
        this.nama = nama;
    }

    public Sertifikat(String nama, String lembaga, UserProfile userProfileId) {
        this.nama = nama;
        this.lembaga = lembaga;
        this.userProfileId = userProfileId;
    }

    
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public String getLembaga() {
        return lembaga;
    }

    public void setLembaga(String lembaga) {
        this.lembaga = lembaga;
    }

    public UserProfile getUserProfileId() {
        return userProfileId;
    }

    public void setUserProfileId(UserProfile userProfileId) {
        this.userProfileId = userProfileId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Sertifikat)) {
            return false;
        }
        Sertifikat other = (Sertifikat) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Sertifikat[ id=" + id + " ]";
    }
    
}
