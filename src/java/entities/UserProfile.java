/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Nitani
 */
@Entity
@Table(name = "user_profile")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "UserProfile.findAll", query = "SELECT u FROM UserProfile u")
    , @NamedQuery(name = "UserProfile.findById", query = "SELECT u FROM UserProfile u WHERE u.id = :id")
    , @NamedQuery(name = "UserProfile.findByNama", query = "SELECT u FROM UserProfile u WHERE u.nama = :nama")
    , @NamedQuery(name = "UserProfile.findByUmur", query = "SELECT u FROM UserProfile u WHERE u.umur = :umur")
    , @NamedQuery(name = "UserProfile.findByTanggalLahir", query = "SELECT u FROM UserProfile u WHERE u.tanggalLahir = :tanggalLahir")
    , @NamedQuery(name = "UserProfile.findByNoTelpon", query = "SELECT u FROM UserProfile u WHERE u.noTelpon = :noTelpon")})
public class UserProfile implements Serializable {

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
    @Column(name = "UMUR")
    private int umur;
    @Basic(optional = false)
    @Lob
    @Column(name = "ALAMAT")
    private String alamat;
    @Basic(optional = false)
    @Column(name = "TANGGAL_LAHIR")
    @Temporal(TemporalType.DATE)
    private Date tanggalLahir;
    @Basic(optional = false)
    @Column(name = "NO_TELPON")
    private int noTelpon;
    @Basic(optional = false)
    @Lob
    @Column(name = "FOTO")
    private byte[] foto;
    @Basic(optional = false)
    @Lob
    @Column(name = "CV")
    private byte[] cv;
    @Basic(optional = false)
    @Lob
    @Column(name = "KTP")
    private byte[] ktp;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "userProfileId", fetch = FetchType.LAZY)
    private List<Pencapaian> pencapaianList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "userProfileId", fetch = FetchType.LAZY)
    private List<Project> projectList;
    @JoinColumn(name = "BAHASA_ID", referencedColumnName = "ID")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Bahasa bahasaId;
    @JoinColumn(name = "USER_ID", referencedColumnName = "ID")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private User userId;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "userProfileId", fetch = FetchType.LAZY)
    private List<Keahlian> keahlianList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "userProfileId", fetch = FetchType.LAZY)
    private List<Sertifikat> sertifikatList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "userProfileId", fetch = FetchType.LAZY)
    private List<RiwayatPendidikan> riwayatPendidikanList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "userProfileId", fetch = FetchType.LAZY)
    private List<Pengalaman> pengalamanList;

    public UserProfile() {
    }

    public UserProfile(Integer id) {
        this.id = id;
    }

    public UserProfile(Integer id, String nama, int umur, String alamat, Date tanggalLahir, int noTelpon, byte[] foto, byte[] cv, byte[] ktp) {
        this.id = id;
        this.nama = nama;
        this.umur = umur;
        this.alamat = alamat;
        this.tanggalLahir = tanggalLahir;
        this.noTelpon = noTelpon;
        this.foto = foto;
        this.cv = cv;
        this.ktp = ktp;
    }

    public UserProfile(String nama, int umur, String alamat, Date tanggalLahir, int noTelpon, byte[] foto, byte[] cv, byte[] ktp, Bahasa bahasaId, User userId) {
        this.nama = nama;
        this.umur = umur;
        this.alamat = alamat;
        this.tanggalLahir = tanggalLahir;
        this.noTelpon = noTelpon;
        this.foto = foto;
        this.cv = cv;
        this.ktp = ktp;
        this.bahasaId = bahasaId;
        this.userId = userId;
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

    public int getUmur() {
        return umur;
    }

    public void setUmur(int umur) {
        this.umur = umur;
    }

    public String getAlamat() {
        return alamat;
    }

    public void setAlamat(String alamat) {
        this.alamat = alamat;
    }

    public Date getTanggalLahir() {
        return tanggalLahir;
    }

    public void setTanggalLahir(Date tanggalLahir) {
        this.tanggalLahir = tanggalLahir;
    }

    public int getNoTelpon() {
        return noTelpon;
    }

    public void setNoTelpon(int noTelpon) {
        this.noTelpon = noTelpon;
    }

    public byte[] getFoto() {
        return foto;
    }

    public void setFoto(byte[] foto) {
        this.foto = foto;
    }

    public byte[] getCv() {
        return cv;
    }

    public void setCv(byte[] cv) {
        this.cv = cv;
    }

    public byte[] getKtp() {
        return ktp;
    }

    public void setKtp(byte[] ktp) {
        this.ktp = ktp;
    }

    @XmlTransient
    public List<Pencapaian> getPencapaianList() {
        return pencapaianList;
    }

    public void setPencapaianList(List<Pencapaian> pencapaianList) {
        this.pencapaianList = pencapaianList;
    }

    @XmlTransient
    public List<Project> getProjectList() {
        return projectList;
    }

    public void setProjectList(List<Project> projectList) {
        this.projectList = projectList;
    }

    public Bahasa getBahasaId() {
        return bahasaId;
    }

    public void setBahasaId(Bahasa bahasaId) {
        this.bahasaId = bahasaId;
    }

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
    }

    @XmlTransient
    public List<Keahlian> getKeahlianList() {
        return keahlianList;
    }

    public void setKeahlianList(List<Keahlian> keahlianList) {
        this.keahlianList = keahlianList;
    }

    @XmlTransient
    public List<Sertifikat> getSertifikatList() {
        return sertifikatList;
    }

    public void setSertifikatList(List<Sertifikat> sertifikatList) {
        this.sertifikatList = sertifikatList;
    }

    @XmlTransient
    public List<RiwayatPendidikan> getRiwayatPendidikanList() {
        return riwayatPendidikanList;
    }

    public void setRiwayatPendidikanList(List<RiwayatPendidikan> riwayatPendidikanList) {
        this.riwayatPendidikanList = riwayatPendidikanList;
    }

    @XmlTransient
    public List<Pengalaman> getPengalamanList() {
        return pengalamanList;
    }

    public void setPengalamanList(List<Pengalaman> pengalamanList) {
        this.pengalamanList = pengalamanList;
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
        if (!(object instanceof UserProfile)) {
            return false;
        }
        UserProfile other = (UserProfile) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.UserProfile[ id=" + id + " ]";
    }
    
}
