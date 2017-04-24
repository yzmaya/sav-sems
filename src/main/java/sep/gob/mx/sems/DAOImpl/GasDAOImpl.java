package sep.gob.mx.sems.DAOImpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sep.gob.mx.sems.DAO.GasDAO;
import sep.gob.mx.sems.Model.Gas;

@Repository
public class GasDAOImpl implements GasDAO{
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void addViaticosCombustible(Gas gas) throws Exception {
		sessionFactory.getCurrentSession().saveOrUpdate(gas);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Gas> listaViaticosCombustible() throws Exception {
		return sessionFactory.getCurrentSession().createQuery("from Gas").list();
	}

	@Override
	public void deleteViaticosCombustible(Integer idGas) throws Exception {
		
		Gas gas = (Gas)sessionFactory.getCurrentSession().load(Gas.class, idGas);
		if(null != gas)this.sessionFactory.getCurrentSession().delete(gas);
		
	}

	@Override
	public Gas updateViaticosCombustible(Gas gas) throws Exception {
		sessionFactory.getCurrentSession().update(gas);
		return gas;
	}

	@Override
	public Gas getViaticoCombustible(int idGas) throws Exception {
		return (Gas)sessionFactory.getCurrentSession().get(Gas.class, idGas);
	}

}
