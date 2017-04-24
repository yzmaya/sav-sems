package sep.gob.mx.sems.DAO;

import java.util.List;

import sep.gob.mx.sems.Model.Gas;

public interface GasDAO {
	
	public void addViaticosCombustible(Gas gas)throws Exception;
	public List<Gas> listaViaticosCombustible()throws Exception;
	public void deleteViaticosCombustible(Integer idGas)throws Exception;
	public Gas updateViaticosCombustible(Gas gas)throws Exception;
	public Gas getViaticoCombustible(int idGas)throws Exception;

}
