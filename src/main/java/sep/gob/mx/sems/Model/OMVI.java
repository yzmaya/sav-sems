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
@Table(name="omvi")
public class OMVI implements Serializable{
    
    @Id
    @Column
    private Integer Id_OMVI;
    @Column
    private String Fecha_OMVI;
    @Column
    private Integer Id_UsrCom;
    @Column
    private Integer Id_Destino_OrdSer;
    @Column
    private Integer Id_UR;
    @Column
    private Integer Id_Obj_Comision;
    @Column
    private Integer Id_Viaticos_Destino;
    @Column
    private Integer Id_COMPERCO;

    public String getFecha_OMVI() {
        return Fecha_OMVI;
    }

    public void setFecha_OMVI(String Fecha_OMVI) {
        this.Fecha_OMVI = Fecha_OMVI;
    }

    public Integer getId_COMPERCO() {
        return Id_COMPERCO;
    }

    public void setId_COMPERCO(Integer Id_COMPERCO) {
        this.Id_COMPERCO = Id_COMPERCO;
    }

    public Integer getId_Destino_OrdSer() {
        return Id_Destino_OrdSer;
    }

    public void setId_Destino_OrdSer(Integer Id_Destino_OrdSer) {
        this.Id_Destino_OrdSer = Id_Destino_OrdSer;
    }

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

    public Integer getId_UR() {
        return Id_UR;
    }

    public void setId_UR(Integer Id_UR) {
        this.Id_UR = Id_UR;
    }

    public Integer getId_UsrCom() {
        return Id_UsrCom;
    }

    public void setId_UsrCom(Integer Id_UsrCom) {
        this.Id_UsrCom = Id_UsrCom;
    }

    public Integer getId_Viaticos_Destino() {
        return Id_Viaticos_Destino;
    }

    public void setId_Viaticos_Destino(Integer Id_Viaticos_Destino) {
        this.Id_Viaticos_Destino = Id_Viaticos_Destino;
    }
       
}
