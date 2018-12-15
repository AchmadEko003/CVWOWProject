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
@Table(name = "lowongan_pekerjaan")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "LowonganPekerjaan.findAll", query = "SELECT l FROM LowonganPekerjaan l")
    , @NamedQuery(name = "LowonganPekerjaan.findById", query = "SELECT l FROM LowonganPekerjaan l WHERE l.id = :id")
    , @NamedQuery(name = "LowonganPekerjaan.findByJudul", query = "SELECT l FROM LowonganPekerjaan l WHERE l.judul = :judul")
    , @NamedQuery(name = "LowonganPekerjaan.findByTanggalMulai", query = "SELECT l FROM LowonganPekerjaan l WHERE l.tanggalMulai = :tanggalMulai")
    , @NamedQuery(name = "LowonganPekerjaan.findByTanggalSelesai", query = "SELECT l FROM LowonganPekerjaan l WHERE l.tanggalSelesai = :tanggalSelesai")})
public class LowonganPekerjaan implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "JUDUL")
    private String judul;
    @Basic(optional = false)
    @Lob
    @Column(name = "DESKRIPSI")
    private String deskripsi;
    @Basic(optional = false)
    @Column(name = "TANGGAL_MULAI")
    @Temporal(TemporalType.TIMESTAMP)
    private Date tanggalMulai;
    @Basic(optional = false)
    @Column(name = "TANGGAL_SELESAI")
    @Temporal(TemporalType.DATE)
    private Date tanggalSelesai;
    @JoinColumn(name = "REQUIREMENTS_ID", referencedColumnName = "ID")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Requirements requirementsId;
    @JoinColumn(name = "USER_ID", referencedColumnName = "ID")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private User userId;

    public LowonganPekerjaan() {
    }

    public LowonganPekerjaan(Integer id) {
        this.id = id;
    }

    public LowonganPekerjaan(Integer id, String judul, String deskripsi, Date tanggalMulai, Date tanggalSelesai) {
        this.id = id;
        this.judul = judul;
        this.deskripsi = deskripsi;
        this.tanggalMulai = tanggalMulai;
        this.tanggalSelesai = tanggalSelesai;
    }

    public LowonganPekerjaan(String judul, String deskripsi, Date tanggalMulai, Date tanggalSelesai, Requirements requirementsId, User userId) {
        this.judul = judul;
        this.deskripsi = deskripsi;
        this.tanggalMulai = tanggalMulai;
        this.tanggalSelesai = tanggalSelesai;
        this.requirementsId = requirementsId;
        this.userId = userId;
    }

    public LowonganPekerjaan(String judul, String deskripsi, Date tanggalSelesai, Requirements requirementsId, User userId) {
        this.judul = judul;
        this.deskripsi = deskripsi;
        this.tanggalSelesai = tanggalSelesai;
        this.requirementsId = requirementsId;
        this.userId = userId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getJudul() {
        return judul;
    }

    public void setJudul(String judul) {
        this.judul = judul;
    }

    public String getDeskripsi() {
        return deskripsi;
    }

    public void setDeskripsi(String deskripsi) {
        this.deskripsi = deskripsi;
    }

    public Date getTanggalMulai() {
        return tanggalMulai;
    }

    public void setTanggalMulai(Date tanggalMulai) {
        this.tanggalMulai = tanggalMulai;
    }

    public Date getTanggalSelesai() {
        return tanggalSelesai;
    }

    public void setTanggalSelesai(Date tanggalSelesai) {
        this.tanggalSelesai = tanggalSelesai;
    }

    public Requirements getRequirementsId() {
        return requirementsId;
    }

    public void setRequirementsId(Requirements requirementsId) {
        this.requirementsId = requirementsId;
    }

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
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
        if (!(object instanceof LowonganPekerjaan)) {
            return false;
        }
        LowonganPekerjaan other = (LowonganPekerjaan) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.LowonganPekerjaan[ id=" + id + " ]";
    }
    
}
