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
@Table(name="usuariocomisionado")
public class UsuarioComisionado implements Serializable{
    
    @Id
    @Column
    private Integer Id_UsrCom;
    @Column
    private String Ap_Paterno;
    @Column
    private String Ap_Materno;
    @Column
    private String Nombre_s;
    @Column
    private String RFC;
    @Column
    private Integer Puesto;
    @Column
    private String Area_Adscripcion;
    @Column
    private String Direccion_Area_Adscripcion;
    @Column
    private String Clave_SAV;

    public String getClave_SAV() {
        return Clave_SAV;
    }

    public void setClave_SAV(String Clave_SAV) {
        this.Clave_SAV = Clave_SAV;
    }

    public String getAp_Materno() {
        return Ap_Materno;
    }

    public void setAp_Materno(String Ap_Materno) {
        this.Ap_Materno = Ap_Materno;
    }

    public String getAp_Paterno() {
        return Ap_Paterno;
    }

    public void setAp_Paterno(String Ap_Paterno) {
        this.Ap_Paterno = Ap_Paterno;
    }

    public String getArea_Adscripcion() {
        return Area_Adscripcion;
    }

    public void setArea_Adscripcion(String Area_Adscripcion) {
        this.Area_Adscripcion = Area_Adscripcion;
    }

    public String getDireccion_Area_Adscripcion() {
        return Direccion_Area_Adscripcion;
    }

    public void setDireccion_Area_Adscripcion(String Direccion_Area_Adscripcion) {
        this.Direccion_Area_Adscripcion = Direccion_Area_Adscripcion;
    }

    public Integer getId_UsrCom() {
        return Id_UsrCom;
    }

    public void setId_UsrCom(Integer Id_UsrCom) {
        this.Id_UsrCom = Id_UsrCom;
    }

    public String getNombre_s() {
        return Nombre_s;
    }

    public void setNombre_s(String Nombre_s) {
        this.Nombre_s = Nombre_s;
    }

    public Integer getPuesto() {
        return Puesto;
    }

    public void setPuesto(Integer Puesto) {
        this.Puesto = Puesto;
    }

    public String getRFC() {
        return RFC;
    }

    public void setRFC(String RFC) {
        this.RFC = RFC;
    }
    
}
