package sep.gob.mx.sems.Model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "national_tours")
public class National_tours implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7976951861823738137L;
	@Id
	@Column
	private Integer ID_VIAT;
	
	@Column
	private String NT_DATE1;
	
	@Column
	private String PLACE1;
	
	@Column
	private String PERIOD1;
	
	@Column
	private Integer SHARE1;
	
	@Column
	private Integer DAYS1;
	
	@Column
	private Integer IMPORT1;
	
	@Column
	private String PLACE2;
	
	@Column
	private String PERIOD2;
	
	@Column
	private Integer SHARE2;
	
	@Column
	private Integer DAYS2;
	
	@Column
	private Integer IMPORT2;
	
	@Column
	private String PLACE3;
	
	@Column
	private String PERIOD3;
	
	@Column
	private Integer SHARE3;
	
	@Column
	private Integer DAYS3;
	
	@Column
	private Integer IMPORT3;
	
	@Column
	private Integer TOTAL_IMPORT;
	
	@Column
	private String MOT_COMISION;
	
	@Column
	private String OBSERVACIONES;
	
	@Column
	private String CARACTERISTICAS_VIAT;
	
	public Integer getID_VIAT() {
		return ID_VIAT;
	}
	public void setID_VIAT(Integer iD_VIAT) {
		ID_VIAT = iD_VIAT;
	}
	public String getNT_DATE1() {
		return NT_DATE1;
	}
	public void setNT_DATE1(String nT_DATE1) {
		NT_DATE1 = nT_DATE1;
	}
	public String getPLACE1() {
		return PLACE1;
	}
	public void setPLACE1(String pLACE1) {
		PLACE1 = pLACE1;
	}
	public String getPERIOD1() {
		return PERIOD1;
	}
	public void setPERIOD1(String pERIOD1) {
		PERIOD1 = pERIOD1;
	}
	public Integer getSHARE1() {
		return SHARE1;
	}
	public void setSHARE1(Integer sHARE1) {
		SHARE1 = sHARE1;
	}
	public Integer getDAYS1() {
		return DAYS1;
	}
	public void setDAYS1(Integer dAYS1) {
		DAYS1 = dAYS1;
	}
	public Integer getIMPORT1() {
		return IMPORT1;
	}
	public void setIMPORT1(Integer iMPORT1) {
		IMPORT1 = iMPORT1;
	}
	public String getPLACE2() {
		return PLACE2;
	}
	public void setPLACE2(String pLACE2) {
		PLACE2 = pLACE2;
	}
	public String getPERIOD2() {
		return PERIOD2;
	}
	public void setPERIOD2(String pERIOD2) {
		PERIOD2 = pERIOD2;
	}
	public Integer getSHARE2() {
		return SHARE2;
	}
	public void setSHARE2(Integer sHARE2) {
		SHARE2 = sHARE2;
	}
	public Integer getDAYS2() {
		return DAYS2;
	}
	public void setDAYS2(Integer dAYS2) {
		DAYS2 = dAYS2;
	}
	public Integer getIMPORT2() {
		return IMPORT2;
	}
	public void setIMPORT2(Integer iMPORT2) {
		IMPORT2 = iMPORT2;
	}
	public String getPLACE3() {
		return PLACE3;
	}
	public void setPLACE3(String pLACE3) {
		PLACE3 = pLACE3;
	}
	public String getPERIOD3() {
		return PERIOD3;
	}
	public void setPERIOD3(String pERIOD3) {
		PERIOD3 = pERIOD3;
	}
	public Integer getSHARE3() {
		return SHARE3;
	}
	public void setSHARE3(Integer sHARE3) {
		SHARE3 = sHARE3;
	}
	public Integer getDAYS3() {
		return DAYS3;
	}
	public void setDAYS3(Integer dAYS3) {
		DAYS3 = dAYS3;
	}
	public Integer getIMPORT3() {
		return IMPORT3;
	}
	public void setIMPORT3(Integer iMPORT3) {
		IMPORT3 = iMPORT3;
	}
	public Integer getTOTAL_IMPORT() {
		return TOTAL_IMPORT;
	}
	public void setTOTAL_IMPORT(Integer tOTAL_IMPORT) {
		TOTAL_IMPORT = tOTAL_IMPORT;
	}
	public String getMOT_COMISION() {
		return MOT_COMISION;
	}
	public void setMOT_COMISION(String mOT_COMISION) {
		MOT_COMISION = mOT_COMISION;
	}
	public String getOBSERVACIONES() {
		return OBSERVACIONES;
	}
	public void setOBSERVACIONES(String oBSERVACIONES) {
		OBSERVACIONES = oBSERVACIONES;
	}
	public String getCARACTERISTICAS_VIAT() {
		return CARACTERISTICAS_VIAT;
	}
	public void setCARACTERISTICAS_VIAT(String cARACTERISTICAS_VIAT) {
		CARACTERISTICAS_VIAT = cARACTERISTICAS_VIAT;
	}

}
