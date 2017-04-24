package sep.gob.mx.sems.Service;

import java.util.List;

import sep.gob.mx.sems.Model.Gas;

public interface GasService {
	
	public void addViaticosCombustible(Gas gas)throws Exception;
	public List<Gas> listaViaticosCombustible()throws Exception;
	public void deleteViaticosCombustible(Integer idGas)throws Exception;
	public Gas getViaticosCombustibleById(int idGas)throws Exception;
	public Gas updateVicticosCombustible(Gas gas)throws Exception;

}
