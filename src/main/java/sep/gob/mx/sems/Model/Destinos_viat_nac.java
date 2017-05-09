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
@Table(name="destinos_viat_nac")
public class Destinos_viat_nac implements Serializable{
    @Id
    @Column
    private Integer Id_Destino;
    @Column
    private String Lugar;
    @Column
    private String Periodo;
    @Column
    private Double Cuota_Diaria;
    @Column
    private Double Dias;
    @Column
    private Double Importe;

    public Double getCuota_Diaria() {
        return Cuota_Diaria;
    }

    public void setCuota_Diaria(Double Cuota_Diaria) {
        this.Cuota_Diaria = Cuota_Diaria;
    }

    public Double getDias() {
        return Dias;
    }

    public void setDias(Double Dias) {
        this.Dias = Dias;
    }

    public Integer getId_Destino() {
        return Id_Destino;
    }

    public void setId_Destino(Integer Id_Destino) {
        this.Id_Destino = Id_Destino;
    }

    public Double getImporte() {
        return Importe;
    }

    public void setImporte(Double Importe) {
        this.Importe = Importe;
    }

    public String getLugar() {
        return Lugar;
    }

    public void setLugar(String Lugar) {
        this.Lugar = Lugar;
    }

    public String getPeriodo() {
        return Periodo;
    }

    public void setPeriodo(String Periodo) {
        this.Periodo = Periodo;
    }
    
}
