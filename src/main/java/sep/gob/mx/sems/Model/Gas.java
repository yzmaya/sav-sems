package sep.gob.mx.sems.Model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Id;

@Entity
@Table(name = "gas")
public class Gas implements Serializable{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -3259909750789021729L;
	@Id
	@Column
	private Integer ID_GAS;
	
	@Column
	private String DATE_COMPERCO;
	
	@Column
	private String DATE_COMISION;
	
	@Column
	private String G_DATE1;
	
	@Column
	private String START1;
	
	@Column
	private String END1;
	
	@Column
	private Integer KM1;
	
	public Integer getID_GAS() {
		return ID_GAS;
	}
	public void setID_GAS(Integer iD_GAS) {
		ID_GAS = iD_GAS;
	}
	public String getDATE_COMPERCO() {
		return DATE_COMPERCO;
	}
	public void setDATE_COMPERCO(String dATE_COMPERCO) {
		DATE_COMPERCO = dATE_COMPERCO;
	}
	public String getDATE_COMISION() {
		return DATE_COMISION;
	}
	public void setDATE_COMISION(String dATE_COMISION) {
		DATE_COMISION = dATE_COMISION;
	}
	public String getG_DATE1() {
		return G_DATE1;
	}
	public void setG_DATE1(String g_DATE1) {
		G_DATE1 = g_DATE1;
	}
	public String getSTART1() {
		return START1;
	}
	public void setSTART1(String sTART1) {
		START1 = sTART1;
	}
	public String getEND1() {
		return END1;
	}
	public void setEND1(String eND1) {
		END1 = eND1;
	}
	public Integer getKM1() {
		return KM1;
	}
	public void setKM1(Integer kM1) {
		KM1 = kM1;
	}

}
