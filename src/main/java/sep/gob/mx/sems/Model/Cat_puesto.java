package sep.gob.mx.sems.Model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "cat_puesto")
public class Cat_puesto implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 691106931409922813L;
	
        @Id
	@Column
	private Integer Id_Puesto;

    public String getCve_Nivel_Puesto() {
        return Cve_Nivel_Puesto;
    }

    public void setCve_Nivel_Puesto(String Cve_Nivel_Puesto) {
        this.Cve_Nivel_Puesto = Cve_Nivel_Puesto;
    }

    public String getDenominacion_Cargo() {
        return Denominacion_Cargo;
    }

    public void setDenominacion_Cargo(String Denominacion_Cargo) {
        this.Denominacion_Cargo = Denominacion_Cargo;
    }

    public String getDenominacion_Puesto() {
        return Denominacion_Puesto;
    }

    public void setDenominacion_Puesto(String Denominacion_Puesto) {
        this.Denominacion_Puesto = Denominacion_Puesto;
    }

    public Integer getId_Puesto() {
        return Id_Puesto;
    }

    public void setId_Puesto(Integer Id_Puesto) {
        this.Id_Puesto = Id_Puesto;
    }
	
	@Column
	private String Cve_Nivel_Puesto;
	
	@Column
	private String Denominacion_Puesto;
	
	@Column
	private String Denominacion_Cargo;
        
        

}
