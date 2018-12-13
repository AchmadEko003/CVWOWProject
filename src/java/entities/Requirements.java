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
@Table(name = "requirements")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Requirements.findAll", query = "SELECT r FROM Requirements r")
    , @NamedQuery(name = "Requirements.findById", query = "SELECT r FROM Requirements r WHERE r.id = :id")
    , @NamedQuery(name = "Requirements.findByNama", query = "SELECT r FROM Requirements r WHERE r.nama = :nama")})
public class Requirements implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "NAMA")
    private int nama;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "requirementsId", fetch = FetchType.LAZY)
    private List<LowonganPekerjaan> lowonganPekerjaanList;

    public Requirements() {
    }

    public Requirements(Integer id) {
        this.id = id;
    }

    public Requirements(Integer id, int nama) {
        this.id = id;
        this.nama = nama;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getNama() {
        return nama;
    }

    public void setNama(int nama) {
        this.nama = nama;
    }

    @XmlTransient
    public List<LowonganPekerjaan> getLowonganPekerjaanList() {
        return lowonganPekerjaanList;
    }

    public void setLowonganPekerjaanList(List<LowonganPekerjaan> lowonganPekerjaanList) {
        this.lowonganPekerjaanList = lowonganPekerjaanList;
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
    
}
