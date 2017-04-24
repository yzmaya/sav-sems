package sep.gob.mx.sems.ServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sep.gob.mx.sems.DAO.Sav_omviDAO;
import sep.gob.mx.sems.Model.Sav_omvi;
import sep.gob.mx.sems.Service.Sav_omviService;

@Service
@Transactional
public class Sav_omviServiceImpl implements Sav_omviService{
	
	@Autowired
	Sav_omviDAO omviDAO;

	@Override
	@Transactional
	public void addOmvi(Sav_omvi omvi) throws Exception {
		omviDAO.addOmvi(omvi);
	}

	@Override
	@Transactional
	public List<Sav_omvi> listaOmvi() throws Exception {
		return omviDAO.listaOmvi();
	}

	@Override
	@Transactional
	public void deleteOmvi(Integer idOmvi) throws Exception {
		omviDAO.deleteOmvi(idOmvi);
	}

	@Override
	public Sav_omvi getOmvi(int idOmvi) throws Exception {
		return omviDAO.getOmvi(idOmvi);
	}

	@Override
	public Sav_omvi updateOmvi(Sav_omvi omvi) throws Exception {
		return omviDAO.updateOmvi(omvi);
	}
	
	public void setOmviDAO(Sav_omviDAO omviDAO){
		this.omviDAO =omviDAO;
	}
}
