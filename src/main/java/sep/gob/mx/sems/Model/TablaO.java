package sep.gob.mx.sems.Model;

/**
 *
 * @author brayan.padilla
 */
public class TablaO {
    
	public Integer Id_OMVI;
	public String Ap_Paterno;
        public String Ap_Materno;
        public String Nombre_s;
	public String Area_Adscripcion;
	public String Motivo_Comision;
	public Double Total_Importe;

    public String getAp_Materno() {
        return Ap_Materno;
    }

    public void setAp_Materno(String Ap_Materno) {
        this.Ap_Materno = Ap_Materno;
    }

    public String getAp_Paterno() {
        return Ap_Paterno;
    }

    public void setAp_Paterno(String Ap_Paterno) {
        this.Ap_Paterno = Ap_Paterno;
    }

    public String getArea_Adscripcion() {
        return Area_Adscripcion;
    }

    public void setArea_Adscripcion(String Area_Adscripcion) {
        this.Area_Adscripcion = Area_Adscripcion;
    }

    public Integer getId_OMVI() {
        return Id_OMVI;
    }

    public void setId_OMVI(Integer Id_OMVI) {
        this.Id_OMVI = Id_OMVI;
    }

    public String getMotivo_Comision() {
        return Motivo_Comision;
    }

    public void setMotivo_Comision(String Motivo_Comision) {
        this.Motivo_Comision = Motivo_Comision;
    }

    public String getNombre_s() {
        return Nombre_s;
    }

    public void setNombre_s(String Nombre_s) {
        this.Nombre_s = Nombre_s;
    }

    public Double getTotal_Importe() {
        return Total_Importe;
    }

    public void setTotal_Importe(Double Total_Importe) {
        this.Total_Importe = Total_Importe;
    }

}
