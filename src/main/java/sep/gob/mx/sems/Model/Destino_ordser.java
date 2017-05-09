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
@Table(name="destino_ordser")
public class Destino_ordser implements Serializable{
    
    @Id
    @Column
    private Integer Id_Destino_ORDSER;
    @Column
    private Integer Id_OMVI;
    @Column
    private String Punto_Partida;
    @Column
    private String Punto_Llegada;
    @Column
    private String Otro_Destino;
    @Column
    private String Clase_Servicio;

    public String getClase_Servicio() {
        return Clase_Servicio;
    }

    public void setClase_Servicio(String Clase_Servicio) {
        this.Clase_Servicio = Clase_Servicio;
    }

    public Integer getId_Destino_ORDSER() {
        return Id_Destino_ORDSER;
    }

    public void setId_Destino_ORDSER(Integer Id_Destino_ORDSER) {
        this.Id_Destino_ORDSER = Id_Destino_ORDSER;
    }

    public Integer getId_OMVI() {
        return Id_OMVI;
    }

    public void setId_OMVI(Integer Id_OMVI) {
        this.Id_OMVI = Id_OMVI;
    }

    public String getOtro_Destino() {
        return Otro_Destino;
    }

    public void setOtro_Destino(String Otro_Destino) {
        this.Otro_Destino = Otro_Destino;
    }

    public String getPunto_Llegada() {
        return Punto_Llegada;
    }

    public void setPunto_Llegada(String Punto_Llegada) {
        this.Punto_Llegada = Punto_Llegada;
    }

    public String getPunto_Partida() {
        return Punto_Partida;
    }

    public void setPunto_Partida(String Punto_Partida) {
        this.Punto_Partida = Punto_Partida;
    }
   
}
