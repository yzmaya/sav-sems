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
@Table(name="viaticos_nacionales")
public class Viaticos_nacionales implements Serializable{
    
    @Id
    @Column
    private Integer Id_Viaticos;
    @Column
    private Double Total_Importe;
    @Column
    private String Caracteristicas_Viat;

    public String getCaracteristicas_Viat() {
        return Caracteristicas_Viat;
    }

    public void setCaracteristicas_Viat(String Caracteristicas_Viat) {
        this.Caracteristicas_Viat = Caracteristicas_Viat;
    }

    public Integer getId_Viaticos() {
        return Id_Viaticos;
    }

    public void setId_Viaticos(Integer Id_Viaticos) {
        this.Id_Viaticos = Id_Viaticos;
    }

    public Double getTotal_Importe() {
        return Total_Importe;
    }

    public void setTotal_Importe(Double Total_Importe) {
        this.Total_Importe = Total_Importe;
    }
}
