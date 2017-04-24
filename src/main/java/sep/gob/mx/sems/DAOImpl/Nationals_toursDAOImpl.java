package sep.gob.mx.sems.DAOImpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sep.gob.mx.sems.DAO.National_toursDAO;
import sep.gob.mx.sems.Model.National_tours;

@Repository
public class Nationals_toursDAOImpl implements National_toursDAO{
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void addNationalTours(National_tours natTours) throws Exception {
		sessionFactory.getCurrentSession().saveOrUpdate(natTours);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<National_tours> listNationalTours() throws Exception {
		return sessionFactory.getCurrentSession().createQuery("from National_tours").list();
	}

	@Override
	public void deleteNationalTours(Integer idNatTours) throws Exception {
		National_tours natTours = (National_tours)sessionFactory.getCurrentSession().load(National_tours.class, idNatTours);
		if(null != natTours)this.sessionFactory.getCurrentSession().delete(natTours);
	}

	@Override
	public National_tours updateNationalTours(National_tours natTours)throws Exception {
		sessionFactory.getCurrentSession().update(natTours);
		return natTours;
	}

	@Override
	public National_tours getNationalToursById(int idNatTours) throws Exception {
		return (National_tours)sessionFactory.getCurrentSession().get(National_tours.class, idNatTours);
	}
}
