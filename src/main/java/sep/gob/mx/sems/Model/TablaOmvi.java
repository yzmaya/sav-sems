/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
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
@Table(name="tablaomvi")
public class TablaOmvi implements Serializable {
    
    
        @Id
        @Column(name="Id_OMVI")
	private Integer Id_OMVI;
        @Column
	private String Ap_Paterno;
        @Column
        private String Ap_Materno;
        @Column
        private String Nombre_s;
        @Column
	private String Area_Adscripcion;
        @Column
	private String Motivo_Comision;
        @Column
	private Double Total_Importe;

    public String getApMaterno() {
        return Ap_Materno;
    }

    public void setApMaterno(String ApMaterno) {
        this.Ap_Materno = ApMaterno;
    }

    public String getApPaterno() {
        return Ap_Paterno;
    }

    public void setApPaterno(String ApPaterno) {
        this.Ap_Paterno = ApPaterno;
    }

    public String getAreaAdscripcion() {
        return Area_Adscripcion;
    }

    public void setAreaAdscripcion(String AreaAdscripcion) {
        this.Area_Adscripcion = AreaAdscripcion;
    }

    public Integer getIdOMVI() {
        return Id_OMVI;
    }

    public void setIdOMVI(Integer IdOMVI) {
        this.Id_OMVI = IdOMVI;
    }

    public String getMotivoComision() {
        return Motivo_Comision;
    }

    public void setMotivoComision(String MotivoComision) {
        this.Motivo_Comision = MotivoComision;
    }

    public String getNombre_s() {
        return Nombre_s;
    }

    public void setNombre_s(String Nombre_s) {
        this.Nombre_s = Nombre_s;
    }

    public Double getTotalImporte() {
        return Total_Importe;
    }

    public void setTotalImporte(Double TotalImporte) {
        this.Total_Importe = TotalImporte;
    }
    
}
