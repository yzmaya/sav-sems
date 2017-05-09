package sep.gob.mx.sems.DAOImpl;

import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import sep.gob.mx.sems.DAO.CatalogosDAO;
import sep.gob.mx.sems.Model.Cat_partidas;
import sep.gob.mx.sems.Model.Cat_puesto;
import sep.gob.mx.sems.Model.Cat_unidad_responsable;

/**
 *
 * @author brayan.padilla
 */
@Component
@Repository
public class CatalogosDAOImpl implements CatalogosDAO {

    @Autowired
    private SessionFactory sessionFactory;
    
    @Override
    public List<Cat_partidas> getCatPartidas() throws Exception {
        return sessionFactory.getCurrentSession().createQuery("from Cat_partidas").list();
    }
    
    @Override
    public List<Cat_puesto> getCatPuesto() throws Exception {
        return sessionFactory.getCurrentSession().createQuery("from Cat_puesto").list();
    }
    
    @Override
    public List<Cat_unidad_responsable> getCatUR() throws Exception {
        return sessionFactory.getCurrentSession().createQuery("from Cat_unidad_responsable").list();
    }
}
