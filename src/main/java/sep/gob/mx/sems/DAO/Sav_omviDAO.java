package sep.gob.mx.sems.DAO;

import java.util.List;

import sep.gob.mx.sems.Model.Sav_omvi;

public interface Sav_omviDAO {
	
	public void addOmvi(Sav_omvi omvi)throws Exception;//------------------> Agregar OMVI
	public List<Sav_omvi> listaOmvi()throws Exception;//------------------> Listar todos los OMVI que hay
	public void deleteOmvi(Integer idOmvi)throws Exception;//------------------> Borrar OMVI mediante ID
	public Sav_omvi updateOmvi(Sav_omvi omvi)throws Exception;//------------------> Actualizar OMVI
	public Sav_omvi getOmvi(int idOmvi)throws Exception;//------------------> Consulta 1 solo OMVI por su ID

}
