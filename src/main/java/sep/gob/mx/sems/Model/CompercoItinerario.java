package sep.gob.mx.sems.Model;

import java.io.Serializable;
import javax.persistence.*;

/**
 *
 * @author brayan.padilla
 */
@Entity
@Table(name = "compercoitinerario")
public class CompercoItinerario implements Serializable {

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column
    private Integer Id_COMPERCOItinerario;
    @Column
    private Integer Id_OMVI;
    @Column
    private Integer Id_COMPERCO;
    @Column
    private Integer ID_Itinerario;

    public Integer getID_Itinerario() {
        return ID_Itinerario;
    }

    public void setID_Itinerario(Integer ID_Itinerario) {
        this.ID_Itinerario = ID_Itinerario;
    }

    public Integer getId_COMPERCO() {
        return Id_COMPERCO;
    }

    public void setId_COMPERCO(Integer Id_COMPERCO) {
        this.Id_COMPERCO = Id_COMPERCO;
    }

    public Integer getId_COMPERCOItinerario() {
        return Id_COMPERCOItinerario;
    }

    public void setId_COMPERCOItinerario(Integer Id_COMPERCOItinerario) {
        this.Id_COMPERCOItinerario = Id_COMPERCOItinerario;
    }

    public Integer getId_OMVI() {
        return Id_OMVI;
    }

    public void setId_OMVI(Integer Id_OMVI) {
        this.Id_OMVI = Id_OMVI;
    }
}
