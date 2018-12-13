/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Nitani
 */
@Entity
@Table(name = "pengalaman")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Pengalaman.findAll", query = "SELECT p FROM Pengalaman p")
    , @NamedQuery(name = "Pengalaman.findById", query = "SELECT p FROM Pengalaman p WHERE p.id = :id")
    , @NamedQuery(name = "Pengalaman.findByPerusahaan", query = "SELECT p FROM Pengalaman p WHERE p.perusahaan = :perusahaan")
    , @NamedQuery(name = "Pengalaman.findByPosisi", query = "SELECT p FROM Pengalaman p WHERE p.posisi = :posisi")
    , @NamedQuery(name = "Pengalaman.findByMulaiBekerja", query = "SELECT p FROM Pengalaman p WHERE p.mulaiBekerja = :mulaiBekerja")
    , @NamedQuery(name = "Pengalaman.findBySelesaiBekerja", query = "SELECT p FROM Pengalaman p WHERE p.selesaiBekerja = :selesaiBekerja")})
public class Pengalaman implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Basic(optional = false)
    @Lob
    @Column(name = "DESKRIPSI")
    private String deskripsi;
    @Basic(optional = false)
    @Column(name = "PERUSAHAAN")
    private int perusahaan;
    @Basic(optional = false)
    @Column(name = "POSISI")
    private String posisi;
    @Basic(optional = false)
    @Column(name = "MULAI_BEKERJA")
    @Temporal(TemporalType.DATE)
    private Date mulaiBekerja;
    @Basic(optional = false)
    @Column(name = "SELESAI_BEKERJA")
    @Temporal(TemporalType.DATE)
    private Date selesaiBekerja;
    @JoinColumn(name = "USER_PROFILE_ID", referencedColumnName = "ID")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private UserProfile userProfileId;

    public Pengalaman() {
    }

    public Pengalaman(Integer id) {
        this.id = id;
    }

    public Pengalaman(Integer id, String deskripsi, int perusahaan, String posisi, Date mulaiBekerja, Date selesaiBekerja) {
        this.id = id;
        this.deskripsi = deskripsi;
        this.perusahaan = perusahaan;
        this.posisi = posisi;
        this.mulaiBekerja = mulaiBekerja;
        this.selesaiBekerja = selesaiBekerja;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDeskripsi() {
        return deskripsi;
    }

    public void setDeskripsi(String deskripsi) {
        this.deskripsi = deskripsi;
    }

    public int getPerusahaan() {
        return perusahaan;
    }

    public void setPerusahaan(int perusahaan) {
        this.perusahaan = perusahaan;
    }

    public String getPosisi() {
        return posisi;
    }

    public void setPosisi(String posisi) {
        this.posisi = posisi;
    }

    public Date getMulaiBekerja() {
        return mulaiBekerja;
    }

    public void setMulaiBekerja(Date mulaiBekerja) {
        this.mulaiBekerja = mulaiBekerja;
    }

    public Date getSelesaiBekerja() {
        return selesaiBekerja;
    }

    public void setSelesaiBekerja(Date selesaiBekerja) {
        this.selesaiBekerja = selesaiBekerja;
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
        if (!(object instanceof Pengalaman)) {
            return false;
        }
        Pengalaman other = (Pengalaman) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Pengalaman[ id=" + id + " ]";
    }
    
}
