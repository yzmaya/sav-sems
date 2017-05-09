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
@Table(name="itinerario")
public class Itinerario implements Serializable{
    
    @Id
    @Column
    private Integer Id_Itinerario;
    @Column
    private String Fecha_Itinerario;
    @Column
    private String OrigenDe;
    @Column
    private String DestinoA;
    @Column
    private Double Distancia_Km;

    public String getDestinoA() {
        return DestinoA;
    }

    public void setDestinoA(String DestinoA) {
        this.DestinoA = DestinoA;
    }

    public Double getDistancia_Km() {
        return Distancia_Km;
    }

    public void setDistancia_Km(Double Distancia_Km) {
        this.Distancia_Km = Distancia_Km;
    }

    public String getFecha_Itinerario() {
        return Fecha_Itinerario;
    }

    public void setFecha_Itinerario(String Fecha_Itinerario) {
        this.Fecha_Itinerario = Fecha_Itinerario;
    }

    public Integer getId_Itinerario() {
        return Id_Itinerario;
    }

    public void setId_Itinerario(Integer Id_Itinerario) {
        this.Id_Itinerario = Id_Itinerario;
    }

    public String getOrigenDe() {
        return OrigenDe;
    }

    public void setOrigenDe(String OrigenDe) {
        this.OrigenDe = OrigenDe;
    }
}
