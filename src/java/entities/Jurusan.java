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
@Table(name = "jurusan")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Jurusan.findAll", query = "SELECT j FROM Jurusan j")
    , @NamedQuery(name = "Jurusan.findById", query = "SELECT j FROM Jurusan j WHERE j.id = :id")
    , @NamedQuery(name = "Jurusan.findByNama", query = "SELECT j FROM Jurusan j WHERE j.nama = :nama")})
public class Jurusan implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "NAMA")
    private String nama;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "jurusanId", fetch = FetchType.LAZY)
    private List<RiwayatPendidikan> riwayatPendidikanList;

    public Jurusan() {
    }

    public Jurusan(String nama) {
        this.nama = nama;
    }

    
    public Jurusan(Integer id) {
        this.id = id;
    }

    public Jurusan(Integer id, String nama) {
        this.id = id;
        this.nama = nama;
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
        if (!(object instanceof Jurusan)) {
            return false;
        }
        Jurusan other = (Jurusan) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Jurusan[ id=" + id + " ]";
    }
    
}
