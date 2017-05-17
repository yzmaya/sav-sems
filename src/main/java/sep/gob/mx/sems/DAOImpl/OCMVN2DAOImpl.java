package sep.gob.mx.sems.DAOImpl;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import sep.gob.mx.sems.DAO.OCMVN2DAO;
import sep.gob.mx.sems.Model.Destinos_viat_nac;
import sep.gob.mx.sems.Model.Viaticos_Destinos_Nacionales;
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
        String query = "from Destinos_viat_nac dvn where dvn.Id_OMVI="+idOMVI;
        return (Destinos_viat_nac)sessionFactory.getCurrentSession().createQuery(query);
    }
    
    @Override
    public List<Destinos_viat_nac> getListDestViatNacByIdOMVI(Integer idOMVI) throws Exception {
        
        List<Viaticos_Destinos_Nacionales> viatDestNac = getListViaticos_Destinos_NacionalesByIdOMVI(idOMVI);
        Destinos_viat_nac destViatNac;
        List<Destinos_viat_nac> listdestViatNac = new ArrayList<Destinos_viat_nac>();
        
        for(Viaticos_Destinos_Nacionales vdn : viatDestNac){
            destViatNac = (Destinos_viat_nac)sessionFactory.getCurrentSession().get(Destinos_viat_nac.class, vdn.getId_Destino());
            listdestViatNac.add(destViatNac);
        }
        return listdestViatNac;
    }

    @Override
    public Destinos_viat_nac updateDestViatNac(Destinos_viat_nac destViatNac) throws Exception {
        sessionFactory.getCurrentSession().update(destViatNac);
        return destViatNac;
    }

    @Override
    public String saveDestViatNac(Destinos_viat_nac destViatNac) throws Exception {
        sessionFactory.getCurrentSession().save(destViatNac);
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
        Viaticos_Destinos_Nacionales viatNac = getListViaticos_Destinos_NacionalesByIdOMVI(idOMVI).get(0);
        return (Viaticos_nacionales)sessionFactory.getCurrentSession().get(Viaticos_nacionales.class, viatNac.getId_Viaticos());
    }

    @Override
    public Viaticos_nacionales updateViaticos_nacionales(Viaticos_nacionales viatNac) throws Exception {
        sessionFactory.getCurrentSession().update(viatNac);
        return viatNac;
    }

    @Override
    public String saveViaticos_nacionales(Viaticos_nacionales viatNac) throws Exception {
        sessionFactory.getCurrentSession().save(viatNac);
        return "Se guardo Viaticos Nacionales";
    }

    @Override
    public String deleteViaticos_nacionales(Integer idViatNac) throws Exception {
        Viaticos_nacionales viatNac = (Viaticos_nacionales)sessionFactory.getCurrentSession().load(Viaticos_nacionales.class, idViatNac);
        if(null != viatNac)this.sessionFactory.getCurrentSession().delete(viatNac);
        return "Se borro Viaticos Nacionales";
    }
//-----------------------------------------------------------Metodos de Viaticos_Destinos_Nacionales-----------------------------------------------

    @Override
    public List<Viaticos_Destinos_Nacionales> listViaticos_Destinos_Nacionales() throws Exception {
        return sessionFactory.getCurrentSession().createQuery("from Viaticos_Destinos_Nacionales").list();
    }

    @Override
    public Viaticos_Destinos_Nacionales getViaticos_Destinos_NacionalesById(Integer idViatDestNac) throws Exception {
        return(Viaticos_Destinos_Nacionales)sessionFactory.getCurrentSession().get(Viaticos_Destinos_Nacionales.class, idViatDestNac);
    }
    
    @Override
    public List<Viaticos_Destinos_Nacionales> getListViaticos_Destinos_NacionalesByIdOMVI(Integer idOMVI) throws Exception {
        String query = "from Viaticos_Destinos_Nacionales viatDestNac where viatDestNac.Id_OMVI="+idOMVI;
        return sessionFactory.getCurrentSession().createQuery(query).list();
    }

    @Override
    public Viaticos_Destinos_Nacionales getViaticos_Destinos_NacionalesByIdOMVI(Integer idOMVI) throws Exception {
        return(Viaticos_Destinos_Nacionales)sessionFactory.getCurrentSession().createQuery("from Viaticos_Destinos_Nacionales vdn where vdn.Id_OMVI="+idOMVI);
    }

    @Override
    public Viaticos_Destinos_Nacionales updateViaticos_Destinos_Nacionales(Viaticos_Destinos_Nacionales viaticos_Destinos_Nacionales) throws Exception {
        sessionFactory.getCurrentSession().update(viaticos_Destinos_Nacionales);
        return viaticos_Destinos_Nacionales;
    }

    @Override
    public String saveViaticos_Destinos_Nacionales(Viaticos_Destinos_Nacionales viaticos_Destinos_Nacionales) throws Exception {
        sessionFactory.getCurrentSession().save(viaticos_Destinos_Nacionales);
        return "Se guardo Viaticos_Destinos_Nacionales";
    }

    @Override
    public String deleteViaticos_Destinos_Nacionales(Integer idViatDestNac) throws Exception {
        Viaticos_Destinos_Nacionales viatdestNac = (Viaticos_Destinos_Nacionales)sessionFactory.getCurrentSession().load(Viaticos_Destinos_Nacionales.class, idViatDestNac);
        if(null != viatdestNac)this.sessionFactory.getCurrentSession().delete(viatdestNac);
        return "Se borro Viaticos_Destinos_Nacionales";
    }

}
