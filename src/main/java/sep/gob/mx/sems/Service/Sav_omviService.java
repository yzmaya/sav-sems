package sep.gob.mx.sems.Service;

import java.util.List;

import sep.gob.mx.sems.Model.Sav_omvi;

public interface Sav_omviService {
	
	public void addOmvi(Sav_omvi omvi)throws Exception;
	public List<Sav_omvi> listaOmvi()throws Exception;
	public void deleteOmvi(Integer idOmvi)throws Exception;
	public Sav_omvi getOmvi(int idOmvi)throws Exception;
	public Sav_omvi updateOmvi(Sav_omvi omvi)throws Exception;

}
