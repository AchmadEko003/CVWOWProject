/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.math.BigDecimal;
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
@Table(name = "riwayat_pendidikan")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "RiwayatPendidikan.findAll", query = "SELECT r FROM RiwayatPendidikan r")
    , @NamedQuery(name = "RiwayatPendidikan.findById", query = "SELECT r FROM RiwayatPendidikan r WHERE r.id = :id")
    , @NamedQuery(name = "RiwayatPendidikan.findByIpk", query = "SELECT r FROM RiwayatPendidikan r WHERE r.ipk = :ipk")})
public class RiwayatPendidikan implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @Column(name = "IPK")
    private BigDecimal ipk;
    @JoinColumn(name = "JURUSAN_ID", referencedColumnName = "ID")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Jurusan jurusanId;
    @JoinColumn(name = "UNIVERSITAS_ID", referencedColumnName = "ID")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Universitas universitasId;
    @JoinColumn(name = "USER_PROFILE_ID", referencedColumnName = "ID")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private UserProfile userProfileId;

    public RiwayatPendidikan() {
    }

    public RiwayatPendidikan(Integer id) {
        this.id = id;
    }

    public RiwayatPendidikan(Integer id, BigDecimal ipk) {
        this.id = id;
        this.ipk = ipk;
    }

    public RiwayatPendidikan(BigDecimal ipk, Jurusan jurusanId, Universitas universitasId, UserProfile userProfileId) {
        this.ipk = ipk;
        this.jurusanId = jurusanId;
        this.universitasId = universitasId;
        this.userProfileId = userProfileId;
    }

    public RiwayatPendidikan(Integer id, BigDecimal ipk, Jurusan jurusanId, Universitas universitasId, UserProfile userProfileId) {
        this.id = id;
        this.ipk = ipk;
        this.jurusanId = jurusanId;
        this.universitasId = universitasId;
        this.userProfileId = userProfileId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public BigDecimal getIpk() {
        return ipk;
    }

    public void setIpk(BigDecimal ipk) {
        this.ipk = ipk;
    }

    public Jurusan getJurusanId() {
        return jurusanId;
    }

    public void setJurusanId(Jurusan jurusanId) {
        this.jurusanId = jurusanId;
    }

    public Universitas getUniversitasId() {
        return universitasId;
    }

    public void setUniversitasId(Universitas universitasId) {
        this.universitasId = universitasId;
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
        if (!(object instanceof RiwayatPendidikan)) {
            return false;
        }
        RiwayatPendidikan other = (RiwayatPendidikan) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.RiwayatPendidikan[ id=" + id + " ]";
    }
    
}
