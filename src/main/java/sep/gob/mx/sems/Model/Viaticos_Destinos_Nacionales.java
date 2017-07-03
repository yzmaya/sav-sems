package sep.gob.mx.sems.Model;

import java.io.Serializable;
import javax.persistence.*;

/**
 *
 * @author brayan.padilla
 */
@Entity
@Table(name = "viaticos_destinos_nacionales")
public class Viaticos_Destinos_Nacionales implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Integer Id_Viat_Dest_Nac;
    @Column
    private Integer Id_OMVI;
    @Column
    private Integer Id_Viaticos;
    @Column
    private Integer Id_Destino;
    @Column
    private String PP_Ord_Serv;
    @Column
    private Integer OG_Ord_Serv;
    @Column
    private String PP_COMPERCO;
    @Column
    private Integer OG_COMPERCO;
    @Column
    private String PP_Viat_Nac;
    @Column
    private Integer OG_Viat_Nac;
    @Column
    private Double ImporteDC_Ord_Serv;
    @Column
    private Double ImporteDC_COMPERCO;
    @Column
    private Double ImporteDC_Viat_Nac;

    public Double getImporteDC_COMPERCO() {
        return ImporteDC_COMPERCO;
    }

    public void setImporteDC_COMPERCO(Double ImporteDC_COMPERCO) {
        this.ImporteDC_COMPERCO = ImporteDC_COMPERCO;
    }

    public Double getImporteDC_Ord_Serv() {
        return ImporteDC_Ord_Serv;
    }

    public void setImporteDC_Ord_Serv(Double ImporteDC_Ord_Serv) {
        this.ImporteDC_Ord_Serv = ImporteDC_Ord_Serv;
    }

    public Double getImporteDC_Viat_Nac() {
        return ImporteDC_Viat_Nac;
    }

    public void setImporteDC_Viat_Nac(Double ImporteDC_Viat_Nac) {
        this.ImporteDC_Viat_Nac = ImporteDC_Viat_Nac;
    }

    public Integer getOG_COMPERCO() {
        return OG_COMPERCO;
    }

    public void setOG_COMPERCO(Integer OG_COMPERCO) {
        this.OG_COMPERCO = OG_COMPERCO;
    }

    public Integer getOG_Ord_Serv() {
        return OG_Ord_Serv;
    }

    public void setOG_Ord_Serv(Integer OG_Ord_Serv) {
        this.OG_Ord_Serv = OG_Ord_Serv;
    }

    public Integer getOG_Viat_Nac() {
        return OG_Viat_Nac;
    }

    public void setOG_Viat_Nac(Integer OG_Viat_Nac) {
        this.OG_Viat_Nac = OG_Viat_Nac;
    }

    public String getPP_COMPERCO() {
        return PP_COMPERCO;
    }

    public void setPP_COMPERCO(String PP_COMPERCO) {
        this.PP_COMPERCO = PP_COMPERCO;
    }

    public String getPP_Ord_Serv() {
        return PP_Ord_Serv;
    }

    public void setPP_Ord_Serv(String PP_Ord_Serv) {
        this.PP_Ord_Serv = PP_Ord_Serv;
    }

    public String getPP_Viat_Nac() {
        return PP_Viat_Nac;
    }

    public void setPP_Viat_Nac(String PP_Viat_Nac) {
        this.PP_Viat_Nac = PP_Viat_Nac;
    }

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