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
@Table(name = "apply")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Apply.findAll", query = "SELECT a FROM Apply a")
    , @NamedQuery(name = "Apply.findById", query = "SELECT a FROM Apply a WHERE a.id = :id")
    , @NamedQuery(name = "Apply.findByStatus", query = "SELECT a FROM Apply a WHERE a.status = :status")})
public class Apply implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "STATUS")
    private String status;
    @JoinColumn(name = "LOWONGAN_ID", referencedColumnName = "ID")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private LowonganPekerjaan lowonganId;
    @JoinColumn(name = "USER_ID", referencedColumnName = "ID")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private User userId;

    public Apply() {
    }

    public Apply(Integer id) {
        this.id = id;
    }

    public Apply(String status, LowonganPekerjaan lowonganId, User userId) {
        this.status = status;
        this.lowonganId = lowonganId;
        this.userId = userId;
    }

    public Apply(Integer id, String status) {
        this.id = id;
        this.status = status;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public LowonganPekerjaan getLowonganId() {
        return lowonganId;
    }

    public void setLowonganId(LowonganPekerjaan lowonganId) {
        this.lowonganId = lowonganId;
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
        if (!(object instanceof Apply)) {
            return false;
        }
        Apply other = (Apply) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Apply[ id=" + id + " ]";
    }
    
}
