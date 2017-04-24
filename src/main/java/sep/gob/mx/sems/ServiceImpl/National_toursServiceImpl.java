package sep.gob.mx.sems.ServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sep.gob.mx.sems.DAO.National_toursDAO;
import sep.gob.mx.sems.Model.National_tours;
import sep.gob.mx.sems.Service.National_toursService;

@Service
@Transactional
public class National_toursServiceImpl implements National_toursService{
	
	@Autowired
	National_toursDAO natToursDAO;

	@Override
	@Transactional
	public void addNationalTours(National_tours natTours) throws Exception {
		natToursDAO.addNationalTours(natTours);
	}

	@Override
	@Transactional
	public List<National_tours> listNationaltours() throws Exception {
		return natToursDAO.listNationalTours();
	}

	@Override
	@Transactional
	public void deleteNationalTours(Integer idNatTours) throws Exception {
		natToursDAO.deleteNationalTours(idNatTours);
	}

	@Override
	public National_tours updateNationalTours(National_tours natTours)throws Exception {
		return natToursDAO.updateNationalTours(natTours);
	}

	@Override
	public National_tours getNationalToursById(int idNatTours) throws Exception {
		return natToursDAO.getNationalToursById(idNatTours);
	}
	
	public void setNationalToursDAO(National_toursDAO natToursDAO){
		this.natToursDAO = natToursDAO;
	}

}
