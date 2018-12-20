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
import javax.persistence.Lob;
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
@Table(name = "requirements")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Requirements.findAll", query = "SELECT r FROM Requirements r")
    , @NamedQuery(name = "Requirements.findById", query = "SELECT r FROM Requirements r WHERE r.id = :id")})
public class Requirements implements Serializable {

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "requirementsId", fetch = FetchType.LAZY)
    private List<LowonganPekerjaan> lowonganPekerjaanList;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Basic(optional = false)
    @Lob
    @Column(name = "NAMA")
    private String nama;

    public Requirements() {
    }

    public Requirements(Integer id) {
        this.id = id;
    }

    public Requirements(Integer id, String nama) {
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Requirements)) {
            return false;
        }
        Requirements other = (Requirements) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Requirements[ id=" + id + " ]";
    }

    @XmlTransient
    public List<LowonganPekerjaan> getLowonganPekerjaanList() {
        return lowonganPekerjaanList;
    }

    public void setLowonganPekerjaanList(List<LowonganPekerjaan> lowonganPekerjaanList) {
        this.lowonganPekerjaanList = lowonganPekerjaanList;
    }
    
}
