package sep.gob.mx.sems.Model;

import javax.persistence.Id;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Column;
import java.io.Serializable;
/**
 *
 * @author brayan.padilla
 */
@Entity
@Table(name="viaticos_destinos_nacionales")
public class Viaticos_Destinos_Nacionales implements Serializable{
    
    @Id
    @Column
    private Integer Id_Viat_Dest_Nac;
    
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

    public Integer getId_Viat_Dest_Nac() {
        return Id_Viat_Dest_Nac;
    }

    public void setId_Viat_Dest_Nac(Integer Id_Viat_Dest_Nac) {
        this.Id_Viat_Dest_Nac = Id_Viat_Dest_Nac;
    }

    public Integer getId_Viaticos() {
        return Id_Viaticos;
    }

    public void setId_Viaticos(Integer Id_Viaticos) {
        this.Id_Viaticos = Id_Viaticos;
    }
    
    
}
