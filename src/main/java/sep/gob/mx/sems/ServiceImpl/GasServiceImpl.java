package sep.gob.mx.sems.ServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sep.gob.mx.sems.DAO.GasDAO;
import sep.gob.mx.sems.Model.Gas;
import sep.gob.mx.sems.Service.GasService;

@Service
@Transactional
public class GasServiceImpl implements GasService{
	
	@Autowired
	GasDAO gasDAO;

	@Override
	@Transactional
	public void addViaticosCombustible(Gas gas) throws Exception {
		gasDAO.addViaticosCombustible(gas);
	}

	@Override
	@Transactional
	public List<Gas> listaViaticosCombustible() throws Exception {
		return gasDAO.listaViaticosCombustible();
	}

	@Override
	@Transactional
	public void deleteViaticosCombustible(Integer idGas) throws Exception {
		gasDAO.deleteViaticosCombustible(idGas);
	}

	@Override
	public Gas getViaticosCombustibleById(int idGas) throws Exception {
		return gasDAO.getViaticoCombustible(idGas);
	}

	@Override
	public Gas updateVicticosCombustible(Gas gas) throws Exception {
		return gasDAO.updateViaticosCombustible(gas);
	}
	
	public void setGasDAO(GasDAO gasDAO){
		this.gasDAO=gasDAO;
	}

}
