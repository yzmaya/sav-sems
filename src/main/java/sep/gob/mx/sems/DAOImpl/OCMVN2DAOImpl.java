package sep.gob.mx.sems.DAOImpl;

import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import sep.gob.mx.sems.DAO.OCMVN2DAO;
import sep.gob.mx.sems.Model.Destinos_viat_nac;
import sep.gob.mx.sems.Model.ViaticosDestinos;
import sep.gob.mx.sems.Model.Viaticos_nacionales;

/**
 *
 * @author brayan.padilla
 */
@Repository
public class OCMVN2DAOImpl implements OCMVN2DAO{

    @Autowired
    SessionFactory sessionFactory;
    
    @Override
    public List<Destinos_viat_nac> listDestViatNac() throws Exception {
        return sessionFactory.getCurrentSession().createQuery("from Destinos_viat_nac").list();
    }

    @Override
    public Destinos_viat_nac getDestViatNacById(Integer idDestino) throws Exception {
        return (Destinos_viat_nac)sessionFactory.getCurrentSession().get(Destinos_viat_nac.class, idDestino);
    }

    @Override
    public Destinos_viat_nac getDestViatNacByIdOMVI(Integer idOMVI) throws Exception {
        ViaticosDestinos viatDest = getViaticosDestinosByIdOMVI(idOMVI);
        return (Destinos_viat_nac)sessionFactory.getCurrentSession().get(Destinos_viat_nac.class, viatDest.getId_Destino());
    }

    @Override
    public Destinos_viat_nac updateDestViatNac(Destinos_viat_nac destViatNac) throws Exception {
        sessionFactory.getCurrentSession().update(destViatNac);
        return destViatNac;
    }

    @Override
    public String saveDestViatNac(Destinos_viat_nac destViatNac) throws Exception {
        sessionFactory.getCurrentSession().saveOrUpdate(destViatNac);
        return "Se guardo Destinos Viaticos Nacionales";
    }

    @Override
    public String deleteDestViatNac(Integer idDestViatNac) throws Exception {
        Destinos_viat_nac destViat = (Destinos_viat_nac)sessionFactory.getCurrentSession().load(Destinos_viat_nac.class, idDestViatNac);
        if(null != destViat)this.sessionFactory.getCurrentSession().delete(destViat);
        return "Se borro Destinos Viaticos Nacionales";
    }

    @Override
    public List<Viaticos_nacionales> listViaticosNacionales() throws Exception {
        return sessionFactory.getCurrentSession().createQuery("from Viaticos_nacionales").list();
    }

    @Override
    public Viaticos_nacionales getViaticos_nacionalesById(Integer idViatNac) throws Exception {
        return (Viaticos_nacionales)sessionFactory.getCurrentSession().get(Viaticos_nacionales.class, idViatNac);
    }

    @Override
    public Viaticos_nacionales getViatNacByIdOMVI(Integer idOMVI) throws Exception {
        ViaticosDestinos viatDest = getViaticosDestinosByIdOMVI(idOMVI);
        return (Viaticos_nacionales)sessionFactory.getCurrentSession().get(Viaticos_nacionales.class, viatDest.getId_Viaticos());
    }

    @Override
    public Viaticos_nacionales updateViaticos_nacionales(Viaticos_nacionales viatNac) throws Exception {
        sessionFactory.getCurrentSession().update(viatNac);
        return viatNac;
    }

    @Override
    public String saveViaticos_nacionales(Viaticos_nacionales viatNac) throws Exception {
        sessionFactory.getCurrentSession().saveOrUpdate(viatNac);
        return "Se guardo Viaticos Nacionales";
    }

    @Override
    public String deleteViaticos_nacionales(Integer idViatNac) throws Exception {
        Viaticos_nacionales viatNac = (Viaticos_nacionales)sessionFactory.getCurrentSession().load(Viaticos_nacionales.class, idViatNac);
        if(null != viatNac)this.sessionFactory.getCurrentSession().delete(viatNac);
        return "Se borro Viaticos Nacionales";
    }

    @Override
    public ViaticosDestinos getViaticosDestinosByIdOMVI(Integer IdOMVI) throws Exception {
        String query = "from ViaticosDestinos viatDest where viatDest.Id_OMVI="+IdOMVI;
        return (ViaticosDestinos)sessionFactory.getCurrentSession().createQuery(query);
    }

    @Override
    public ViaticosDestinos updateViaticosDestinos(ViaticosDestinos viatDest) throws Exception {
        sessionFactory.getCurrentSession().update(viatDest);
        return viatDest;
    }

    @Override
    public String saveViaticosDestinos(ViaticosDestinos viatDest) throws Exception {
        sessionFactory.getCurrentSession().saveOrUpdate(viatDest);
        return "Se guardo Viaticos Destinos";
    }

    @Override
    public String deleteViaticosDestinos(Integer idViatDest) throws Exception {
        ViaticosDestinos viatDest = (ViaticosDestinos)sessionFactory.getCurrentSession().load(ViaticosDestinos.class, idViatDest);
        if(null != viatDest)this.sessionFactory.getCurrentSession().delete(viatDest);
        return "Se borro Viaticos Destinos";
    }

    public ViaticosDestinos getViaticosDestinosById(Integer IdViatDest) throws Exception {
        return (ViaticosDestinos)sessionFactory.getCurrentSession().get(ViaticosDestinos.class, IdViatDest);
    }
    
}
