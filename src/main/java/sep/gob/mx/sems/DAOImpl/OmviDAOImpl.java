package sep.gob.mx.sems.DAOImpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sep.gob.mx.sems.DAO.OmviDAO;
import sep.gob.mx.sems.Model.TablaOmvi;

@Repository
public class OmviDAOImpl implements OmviDAO{
	
	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<TablaOmvi> llenaTablaOmvi() throws Exception {
		return sessionFactory.getCurrentSession().createQuery(""
				+ "select omvi.ID_OMVI, user.FULL_NAME, user.AREA_OF_ASCRIPTION, nat_tour.MOT_COMISION, nat_tour.TOTAL_IMPORT "
				+ "from Sav_omvi omvi, Users user, National_tours nat_tour, Gas gas "
				+ "where omvi.FK_ID_USUARIO=user.ID_USER and omvi.FK_ID_VIAT=nat_tour.ID_VIAT and omvi.FK_ID_GAS=gas.ID_GAS"
				+ " order by omvi.ID_OMVI desc").list();
	}

}
