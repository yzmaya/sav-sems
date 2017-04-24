package sep.gob.mx.sems.Model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "users")
public class Users implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -1858041398320870443L;
	
	@Id
	@Column
	private Integer ID_USER;
	
	@Column
	private String NAME;
	
	@Column
	private String FIRST_NAME;
	
	@Column
	private String LAST_NAME;
	
	@Column
	private String FULL_NAME;
	
	@Column
	private String RFC;
	
	@Column
	private String POSITION;
	
	@Column
	private String ADDRESS;
	
	@Column
	private String KEY_SAV;
	
	@Column
	private String AREA_OF_ASCRIPTION;
	
	@Column
	private Integer CHECK_SAV;
	
	@Column
	private Integer TARGET;
	
	@Column
	private Integer DEVASTED;
	
	@Column
	private Integer TOTAL_REINTEGRATED;
	
	@Column
	private Integer BALANCE_TO_BE_REINTEGRATED;
	
	@Column
	private Integer BALANCE_TO_BE_PAID_UP;
	
	@Column
	private Integer DEVASTED_PAID;
	
	@Column
	private Integer OBSERVATIONS;
	
	public Integer getID_USER() {
		return ID_USER;
	}
	public void setID_USER(Integer iD_USER) {
		ID_USER = iD_USER;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getFIRST_NAME() {
		return FIRST_NAME;
	}
	public void setFIRST_NAME(String fIRST_NAME) {
		FIRST_NAME = fIRST_NAME;
	}
	public String getLAST_NAME() {
		return LAST_NAME;
	}
	public void setLAST_NAME(String lAST_NAME) {
		LAST_NAME = lAST_NAME;
	}
	public String getFULL_NAME() {
		return FULL_NAME;
	}
	public void setFULL_NAME(String fULL_NAME) {
		FULL_NAME = fULL_NAME;
	}
	public String getRFC() {
		return RFC;
	}
	public void setRFC(String rFC) {
		RFC = rFC;
	}
	public String getPOSITION() {
		return POSITION;
	}
	public void setPOSITION(String pOSITION) {
		POSITION = pOSITION;
	}
	public String getADDRESS() {
		return ADDRESS;
	}
	public void setADDRESS(String aDDRESS) {
		ADDRESS = aDDRESS;
	}
	public String getKEY_SAV() {
		return KEY_SAV;
	}
	public void setKEY_SAV(String kEY_SAV) {
		KEY_SAV = kEY_SAV;
	}
	public String getAREA_OF_ASCRIPTION() {
		return AREA_OF_ASCRIPTION;
	}
	public void setAREA_OF_ASCRIPTION(String aREA_OF_ASCRIPTION) {
		AREA_OF_ASCRIPTION = aREA_OF_ASCRIPTION;
	}
	public Integer getCHECK_SAV() {
		return CHECK_SAV;
	}
	public void setCHECK_SAV(Integer cHECK_SAV) {
		CHECK_SAV = cHECK_SAV;
	}
	public Integer getTARGET() {
		return TARGET;
	}
	public void setTARGET(Integer tARGET) {
		TARGET = tARGET;
	}
	public Integer getDEVASTED() {
		return DEVASTED;
	}
	public void setDEVASTED(Integer dEVASTED) {
		DEVASTED = dEVASTED;
	}
	public Integer getTOTAL_REINTEGRATED() {
		return TOTAL_REINTEGRATED;
	}
	public void setTOTAL_REINTEGRATED(Integer tOTAL_REINTEGRATED) {
		TOTAL_REINTEGRATED = tOTAL_REINTEGRATED;
	}
	public Integer getBALANCE_TO_BE_REINTEGRATED() {
		return BALANCE_TO_BE_REINTEGRATED;
	}
	public void setBALANCE_TO_BE_REINTEGRATED(Integer bALANCE_TO_BE_REINTEGRATED) {
		BALANCE_TO_BE_REINTEGRATED = bALANCE_TO_BE_REINTEGRATED;
	}
	public Integer getBALANCE_TO_BE_PAID_UP() {
		return BALANCE_TO_BE_PAID_UP;
	}
	public void setBALANCE_TO_BE_PAID_UP(Integer bALANCE_TO_BE_PAID_UP) {
		BALANCE_TO_BE_PAID_UP = bALANCE_TO_BE_PAID_UP;
	}
	public Integer getDEVASTED_PAID() {
		return DEVASTED_PAID;
	}
	public void setDEVASTED_PAID(Integer dEVASTED_PAID) {
		DEVASTED_PAID = dEVASTED_PAID;
	}
	public Integer getOBSERVATIONS() {
		return OBSERVATIONS;
	}
	public void setOBSERVATIONS(Integer oBSERVATIONS) {
		OBSERVATIONS = oBSERVATIONS;
	}

}
