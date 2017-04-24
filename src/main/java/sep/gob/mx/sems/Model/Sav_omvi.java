package sep.gob.mx.sems.Model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "sav_omvi")
public class Sav_omvi implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3384451798329848747L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer ID_OMVI;
	
	@Column
	private Integer FK_ID_USUARIO;
	
	@Column
	private Integer FK_ID_VIAT;
	
	@Column
	private Integer FK_ID_GAS;
	
	public Integer getID_OMVI() {
		return ID_OMVI;
	}
	public void setID_OMVI(Integer iD_OMVI) {
		ID_OMVI = iD_OMVI;
	}
	public Integer getFK_ID_USUARIO() {
		return FK_ID_USUARIO;
	}
	public void setFK_ID_USUARIO(Integer fK_ID_USUARIO) {
		FK_ID_USUARIO = fK_ID_USUARIO;
	}
	public Integer getFK_ID_VIAT() {
		return FK_ID_VIAT;
	}
	public void setFK_ID_VIAT(Integer fK_ID_VIAT) {
		FK_ID_VIAT = fK_ID_VIAT;
	}
	public Integer getFK_ID_GAS() {
		return FK_ID_GAS;
	}
	public void setFK_ID_GAS(Integer fK_ID_GAS) {
		FK_ID_GAS = fK_ID_GAS;
	}
}
