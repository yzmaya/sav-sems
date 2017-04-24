package sep.gob.mx.sems.DAOImpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sep.gob.mx.sems.DAO.Sav_omviDAO;
import sep.gob.mx.sems.Model.Sav_omvi;

@Repository
public class Sav_omviDAOImpl implements Sav_omviDAO{
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void addOmvi(Sav_omvi omvi) throws Exception { //------------------> Agregar OMVI
		sessionFactory.getCurrentSession().saveOrUpdate(omvi);
		
	}

	@SuppressWarnings("unchecked")
	public List<Sav_omvi> listaOmvi() throws Exception {//------------------> Listar todos los OMVI que hay
		return sessionFactory.getCurrentSession().createQuery("from Sav_omvi")
				.list();
	}

	@Override
	public void deleteOmvi(Integer idOmvi) throws Exception {//------------------> Borrar OMVI mediante ID
		
		Sav_omvi omvi = (Sav_omvi)sessionFactory.getCurrentSession().load(Sav_omvi.class, idOmvi);
		if(null != omvi)this.sessionFactory.getCurrentSession().delete(omvi);
	}

	@Override
	public Sav_omvi updateOmvi(Sav_omvi omvi) throws Exception {//------------------> Actualizar OMVI
		sessionFactory.getCurrentSession().update(omvi);
		return omvi;
	}

	@Override
	public Sav_omvi getOmvi(int idOmvi) throws Exception {//------------------> Consulta 1 solo OMVI por su ID
		return (Sav_omvi)sessionFactory.getCurrentSession().get(Sav_omvi.class, idOmvi);
	}

}
