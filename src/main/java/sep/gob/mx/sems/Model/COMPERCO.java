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
@Table(name="comperco")
public class COMPERCO implements Serializable{
    
    @Id
    @Column
    private Integer Id_COMPERCO;
    
    @Column
    private String Fecha_COMPERCO;
    
    @Column
    private Double Precio_Vigente_Gasolina;
    
    @Column
    private Double Litros_Gasolina;
    
    @Column
    private Double Importe_Gasolina;

    public String getFecha_COMPERCO() {
        return Fecha_COMPERCO;
    }

    public void setFecha_COMPERCO(String Fecha_COMPERCO) {
        this.Fecha_COMPERCO = Fecha_COMPERCO;
    }

    public Integer getId_COMPERCO() {
        return Id_COMPERCO;
    }

    public void setId_COMPERCO(Integer Id_COMPERCO) {
        this.Id_COMPERCO = Id_COMPERCO;
    }

    public Double getImporte_Gasolina() {
        return Importe_Gasolina;
    }

    public void setImporte_Gasolina(Double Importe_Gasolina) {
        this.Importe_Gasolina = Importe_Gasolina;
    }

    public Double getLitros_Gasolina() {
        return Litros_Gasolina;
    }

    public void setLitros_Gasolina(Double Litros_Gasolina) {
        this.Litros_Gasolina = Litros_Gasolina;
    }

    public Double getPrecio_Vigente_Gasolina() {
        return Precio_Vigente_Gasolina;
    }

    public void setPrecio_Vigente_Gasolina(Double Precio_Vigente_Gasolina) {
        this.Precio_Vigente_Gasolina = Precio_Vigente_Gasolina;
    }
    
}
