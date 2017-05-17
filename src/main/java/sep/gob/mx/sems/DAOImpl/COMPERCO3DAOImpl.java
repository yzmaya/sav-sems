package sep.gob.mx.sems.DAOImpl;

import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import sep.gob.mx.sems.DAO.COMPERCO3DAO;
import sep.gob.mx.sems.Model.COMPERCO;
import sep.gob.mx.sems.Model.CompercoItinerario;
import sep.gob.mx.sems.Model.Itinerario;
/**
 *
 * @author brayan.padilla
 */
@Component
@Repository
public class COMPERCO3DAOImpl implements COMPERCO3DAO{
    
    @Autowired
    SessionFactory sessionFactory;
    
    @Override
    public List<Itinerario> listItinerario() throws Exception {
        return sessionFactory.getCurrentSession().createQuery("from Itinerario").list();
    }

    @Override
    public Itinerario getItinerarioById(Integer idItinerario) throws Exception {
        return (Itinerario)sessionFactory.getCurrentSession().get(Itinerario.class, idItinerario);
    }

    @Override
    public Itinerario getItinerarioByIdOMVI(Integer idOMVI) throws Exception {
        CompercoItinerario compItin= getCompercoItinerarioByIdOMVI(idOMVI).get(0);
        return (Itinerario)sessionFactory.getCurrentSession().get(Itinerario.class, compItin.getID_Itinerario());
    }

    @Override
    public Itinerario updateItinerario(Itinerario itinerario) throws Exception {
        sessionFactory.getCurrentSession().update(itinerario);
        return itinerario;
    }

    @Override
    public String saveItinerario(Itinerario itinerario) throws Exception {
        sessionFactory.getCurrentSession().save(itinerario);
        return "Se guardo Itinerario";
    }

    @Override
    public String deleteItinerario(Integer idItinerario) throws Exception {
        Itinerario itinerario = (Itinerario)sessionFactory.getCurrentSession().load(Itinerario.class, idItinerario);
        if( null != itinerario)this.sessionFactory.getCurrentSession().delete(itinerario);
        return "Se borro Itinerario";
    }

    @Override
    public List<COMPERCO> listCOMPERCO() throws Exception {
        return sessionFactory.getCurrentSession().createQuery("from COMPERCO").list();
    }

    @Override
    public COMPERCO getCOMPERCOById(Integer idCOMPERCO) throws Exception {
        return (COMPERCO)sessionFactory.getCurrentSession().get(COMPERCO.class, idCOMPERCO);
    }

    @Override
    public COMPERCO getCOMPERCOByIdOMVI(Integer idOMVI) throws Exception {
        CompercoItinerario compItin = getCompercoItinerarioByIdOMVI(idOMVI).get(0);
        return (COMPERCO)sessionFactory.getCurrentSession().get(COMPERCO.class, compItin.getId_COMPERCO());
    }

    @Override
    public COMPERCO updateCOMPERCO(COMPERCO comperco) throws Exception {
        sessionFactory.getCurrentSession().update(comperco);
        return comperco;
    }

    @Override
    public String saveCOMPERCO(COMPERCO comperco) throws Exception {
        sessionFactory.getCurrentSession().save(comperco);
        return "Se guardo COMPERCO";
    }

    @Override
    public String deleteCOMPERCO(Integer idCOMPERCO) throws Exception {
        COMPERCO comperco = (COMPERCO)sessionFactory.getCurrentSession().load(COMPERCO.class, idCOMPERCO);
        if(null != comperco)this.sessionFactory.getCurrentSession().delete(comperco);
        return "Se borro COMPERCO";
    }

    @Override
    public List<CompercoItinerario> getCompercoItinerarioByIdOMVI(Integer idOMVI) throws Exception {
        String query = "from CompercoItinerario compItin where compItin.Id_OMVI="+idOMVI;
        return sessionFactory.getCurrentSession().createQuery(query).list();
    }

    @Override
    public CompercoItinerario updateCompercoItinerario(CompercoItinerario compItin) throws Exception {
        sessionFactory.getCurrentSession().update(compItin);
        return compItin;
    }

    @Override
    public String saveCompercoItinerario(CompercoItinerario compItin) throws Exception {
        sessionFactory.getCurrentSession().save(compItin);
        return "Se guardo Comperco Itinerario";
    }

    @Override
    public String deleteCompercoItinerario(Integer idCompItin) throws Exception {
        CompercoItinerario compItin = (CompercoItinerario)sessionFactory.getCurrentSession().load(CompercoItinerario.class, idCompItin);
        if(null != compItin)this.sessionFactory.getCurrentSession().delete(compItin);
        return "Se borro Comperco Itinerario";
    }

    public CompercoItinerario getCompercoItinerarioById(Integer idCompItin) throws Exception {
        return(CompercoItinerario)sessionFactory.getCurrentSession().get(CompercoItinerario.class, idCompItin);
    }
    
}
