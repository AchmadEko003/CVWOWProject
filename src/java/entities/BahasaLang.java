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
@Table(name = "bahasa_lang")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "BahasaLang.findAll", query = "SELECT b FROM BahasaLang b")
    , @NamedQuery(name = "BahasaLang.findById", query = "SELECT b FROM BahasaLang b WHERE b.id = :id")
    , @NamedQuery(name = "BahasaLang.findByRate", query = "SELECT b FROM BahasaLang b WHERE b.rate = :rate")})
public class BahasaLang implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "RATE")
    private int rate;
    @JoinColumn(name = "ID_BAHASA", referencedColumnName = "ID")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Bahasa idBahasa;
    @JoinColumn(name = "ID_USER_PROFILE", referencedColumnName = "ID")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private UserProfile idUserProfile;

    public BahasaLang() {
    }

    public BahasaLang(Integer id) {
        this.id = id;
    }

    public BahasaLang(int rate, Bahasa idBahasa, UserProfile idUserProfile) {
        this.rate = rate;
        this.idBahasa = idBahasa;
        this.idUserProfile = idUserProfile;
    }

    public BahasaLang(Integer id, int rate) {
        this.id = id;
        this.rate = rate;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public Bahasa getIdBahasa() {
        return idBahasa;
    }

    public void setIdBahasa(Bahasa idBahasa) {
        this.idBahasa = idBahasa;
    }

    public UserProfile getIdUserProfile() {
        return idUserProfile;
    }

    public void setIdUserProfile(UserProfile idUserProfile) {
        this.idUserProfile = idUserProfile;
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
        if (!(object instanceof BahasaLang)) {
            return false;
        }
        BahasaLang other = (BahasaLang) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.BahasaLang[ id=" + id + " ]";
    }
    
}
