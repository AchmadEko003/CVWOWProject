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
@Table(name = "bahasa")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Bahasa.findAll", query = "SELECT b FROM Bahasa b")
    , @NamedQuery(name = "Bahasa.findById", query = "SELECT b FROM Bahasa b WHERE b.id = :id")
    , @NamedQuery(name = "Bahasa.findByNama", query = "SELECT b FROM Bahasa b WHERE b.nama = :nama")})
public class Bahasa implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "NAMA")
    private String nama;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idBahasa", fetch = FetchType.LAZY)
    private List<BahasaLang> bahasaLangList;

    public Bahasa() {
    }

    public Bahasa(Integer id) {
        this.id = id;
    }

    public Bahasa(String nama) {
        this.nama = nama;
    }

    public Bahasa(Integer id, String nama) {
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
    public List<BahasaLang> getBahasaLangList() {
        return bahasaLangList;
    }

    public void setBahasaLangList(List<BahasaLang> bahasaLangList) {
        this.bahasaLangList = bahasaLangList;
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
        if (!(object instanceof Bahasa)) {
            return false;
        }
        Bahasa other = (Bahasa) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Bahasa[ id=" + id + " ]";
    }
    
}
