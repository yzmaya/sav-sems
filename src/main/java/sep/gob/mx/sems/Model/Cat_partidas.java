package sep.gob.mx.sems.Model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "cat_partidas")
public class Cat_partidas implements Serializable{


	/**
	 * 
	 */
	private static final long serialVersionUID = -8740740289060850784L;

	@Id
	@Column
	private Integer Id_Partida;
	
	@Column
	private Integer Partida;
	
	@Column
	private String Descripcion;
	
	public Integer getId_Partida() {
		return Id_Partida;
	}
	public void setId_Partida(Integer id_Partida) {
		Id_Partida = id_Partida;
	}
	public Integer getPartida() {
		return Partida;
	}
	public void setPartida(Integer partida) {
		Partida = partida;
	}
	public String getDescripcion() {
		return Descripcion;
	}
	public void setDescripcion(String descripcion) {
		Descripcion = descripcion;
	}

}
