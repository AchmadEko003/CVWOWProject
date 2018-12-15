/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Nitani
 */
@Entity
@Table(name = "universitas")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Universitas.findAll", query = "SELECT u FROM Universitas u")
    , @NamedQuery(name = "Universitas.findById", query = "SELECT u FROM Universitas u WHERE u.id = :id")
    , @NamedQuery(name = "Universitas.findByNama", query = "SELECT u FROM Universitas u WHERE u.nama = :nama")
    , @NamedQuery(name = "Universitas.findByAkreditasi", query = "SELECT u FROM Universitas u WHERE u.akreditasi = :akreditasi")})
public class Universitas implements Serializable {

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
    @Column(name = "AKREDITASI")
    private String akreditasi;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "universitasId", fetch = FetchType.LAZY)
    private List<RiwayatPendidikan> riwayatPendidikanList;

    public Universitas() {
    }

    public Universitas(Integer id) {
        this.id = id;
    }

    public Universitas(Integer id, String nama, String akreditasi) {
        this.id = id;
        this.nama = nama;
        this.akreditasi = akreditasi;
    }

    public Universitas(String nama, String akreditasi) {
        this.nama = nama;
        this.akreditasi = akreditasi;
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

    public String getAkreditasi() {
        return akreditasi;
    }

    public void setAkreditasi(String akreditasi) {
        this.akreditasi = akreditasi;
    }

    @XmlTransient
    public List<RiwayatPendidikan> getRiwayatPendidikanList() {
        return riwayatPendidikanList;
    }

    public void setRiwayatPendidikanList(List<RiwayatPendidikan> riwayatPendidikanList) {
        this.riwayatPendidikanList = riwayatPendidikanList;
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
        if (!(object instanceof Universitas)) {
            return false;
        }
        Universitas other = (Universitas) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Universitas[ id=" + id + " ]";
    }
    
}
