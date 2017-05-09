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
@Table(name="viaticosdestinos")
public class ViaticosDestinos implements Serializable{
    
    @Id
    @Column
    private Integer Id_ViaticosDestinos;
    @Column
    private Integer Id_OMVI;
    @Column
    private Integer Id_Viaticos;
    @Column
    private Integer Id_Destino;

    public Integer getId_Destino() {
        return Id_Destino;
    }

    public void setId_Destino(Integer Id_Destino) {
        this.Id_Destino = Id_Destino;
    }

    public Integer getId_OMVI() {
        return Id_OMVI;
    }

    public void setId_OMVI(Integer Id_OMVI) {
        this.Id_OMVI = Id_OMVI;
    }

    public Integer getId_Viaticos() {
        return Id_Viaticos;
    }

    public void setId_Viaticos(Integer Id_Viaticos) {
        this.Id_Viaticos = Id_Viaticos;
    }

    public Integer getId_ViaticosDestinos() {
        return Id_ViaticosDestinos;
    }

    public void setId_ViaticosDestinos(Integer Id_ViaticosDestinos) {
        this.Id_ViaticosDestinos = Id_ViaticosDestinos;
    }
    
}
