package sep.gob.mx.sems.Service;

import java.util.List;

import sep.gob.mx.sems.Model.National_tours;

public interface National_toursService {
	
	public void addNationalTours(National_tours natTours)throws Exception;
	public List<National_tours> listNationaltours()throws Exception;
	public void deleteNationalTours(Integer idNatTours)throws Exception;
	public National_tours updateNationalTours(National_tours natTours)throws Exception;
	public National_tours getNationalToursById(int idNatTours)throws Exception;
	
}
