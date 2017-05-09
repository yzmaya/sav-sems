package sep.gob.mx.sems.Model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author brayan.padilla
 */

@Entity
@Table(name = "cat_unidad_responsable")
public class Cat_unidad_responsable implements Serializable {
    
    @Id
    @Column
    private Integer Id_ur;
    
    @Column
    private Integer Cve_UR;
    
    @Column
    private String Denominacion;
    
    
    public Integer getCve_UR() {
        return Cve_UR;
    }

    public void setCve_UR(Integer Cve_UR) {
        this.Cve_UR = Cve_UR;
    }

    public String getDenominacion() {
        return Denominacion;
    }

    public void setDenominacion(String Denominacion) {
        this.Denominacion = Denominacion;
    }

    public Integer getId_ur() {
        return Id_ur;
    }

    public void setId_ur(Integer Id_ur) {
        this.Id_ur = Id_ur;
    }
}
