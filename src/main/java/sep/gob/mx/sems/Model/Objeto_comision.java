package sep.gob.mx.sems.Model;

import java.io.Serializable;
import javax.persistence.*;
/**
 *
 * @author brayan.padilla
 */
@Entity
@Table(name="objeto_comision")
public class Objeto_comision implements Serializable{
    
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column
    private Integer Id_Obj_Comision;
    @Column
    private Integer Id_OMVI;
    @Column
    private String Motivo_Comision;
    @Column
    private String Observaciones;

    public Integer getId_OMVI() {
        return Id_OMVI;
    }

    public void setId_OMVI(Integer Id_OMVI) {
        this.Id_OMVI = Id_OMVI;
    }

    public Integer getId_Obj_Comision() {
        return Id_Obj_Comision;
    }

    public void setId_Obj_Comision(Integer Id_Obj_Comision) {
        this.Id_Obj_Comision = Id_Obj_Comision;
    }

    public String getMotivo_Comision() {
        return Motivo_Comision;
    }

    public void setMotivo_Comision(String Motivo_Comision) {
        this.Motivo_Comision = Motivo_Comision;
    }

    public String getObservaciones() {
        return Observaciones;
    }

    public void setObservaciones(String Observaciones) {
        this.Observaciones = Observaciones;
    }
    
}
